import { useEffect, useState } from "react";
import { toast } from "sonner";
import { Product, Vendor } from "../types";
import { nodeApiService as apiService } from "../utils/nodeApi";
import { processVendorData } from "../utils/vendors";

export const useVendors = () => {
  const [vendors, setVendors] = useState<Vendor[]>([]);
  const [loading, setLoading] = useState(true);

  const initializeApp = async () => {
    try {
      console.log("Testing API connection...");
      await apiService.testConnection();
      console.log("API connection successful, loading vendors...");
      await loadVendors();
    } catch (error) {
      console.error("Failed to initialize app:", error);
      toast.error(
        "Failed to connect to Gutzo marketplace. Please try again later.",
      );
      setVendors([]);
      setLoading(false);
    }
  };

  const loadVendors = async () => {
    try {
      console.log("Starting to load vendors from database...");
      console.log("Calling apiService.getVendors()...");
      const response: any = await apiService.getVendors();
      console.log("Loaded vendors from API (raw):", response);

      let vendorList: any[] = [];
      if (Array.isArray(response)) {
        vendorList = response;
      } else if (response && Array.isArray(response.data)) {
        vendorList = response.data;
      } else if (
        response && response.vendors && Array.isArray(response.vendors)
      ) {
        vendorList = response.vendors;
      }

      console.log("Extracted vendor list length:", vendorList.length);

      if (vendorList.length === 0) {
        console.log("No vendors found in response");
        setVendors([]);
        return;
      }

      const processedVendors: Vendor[] = vendorList.map(processVendorData);

      // Filter out blacklisted vendors immediately
      const validVendors = processedVendors.filter((vendor) =>
        !vendor.isBlacklisted
      );
      console.log(
        `Filtering vendors: ${processedVendors.length} found, ${validVendors.length} visible (after blacklist check)`,
      );

      // Load products for each vendor
      const vendorsWithProducts = await Promise.all(
        validVendors.map(async (vendor) => {
          try {
            const products = await loadVendorProducts(vendor.id);
            return { ...vendor, products };
          } catch (error) {
            console.error(
              `Failed to load products for vendor ${vendor.name}:`,
              error,
            );
            return { ...vendor, products: [] };
          }
        }),
      );

      console.log("Vendors with products loaded:", vendorsWithProducts);

      // Debug each vendor's products for categories
      vendorsWithProducts.forEach((vendor) => {
        const categories = vendor.products?.map((p) =>
          p.category
        ).filter(Boolean) || [];
        console.log(
          `Vendor: ${vendor.name} - Categories: [${categories.join(", ")}]`,
        );
      });

      setVendors(vendorsWithProducts);
    } catch (error) {
      console.error("Failed to load vendors:", error);
      toast.error(
        `Failed to load vendors: ${
          error instanceof Error ? error.message : "Unknown error"
        }`,
      );
      setVendors([]);
    } finally {
      setLoading(false);
    }
  };

  const loadVendorProducts = async (vendorId: string): Promise<Product[]> => {
    try {
      console.log(`Loading products for vendor ${vendorId} from database...`);
      const response: any = await apiService.getVendorProducts(vendorId);

      let products: Product[] = [];

      if (Array.isArray(response)) {
        products = response;
      } else if (
        response && response.data && Array.isArray(response.data.products)
      ) {
        // Structure: { success: true, data: { products: [...], grouped: ... } }
        products = response.data.products;
      } else if (response && Array.isArray(response.products)) {
        products = response.products;
      } else if (response && Array.isArray(response.data)) {
        products = response.data;
      }

      console.log(
        `Extracted ${products.length} products for vendor ${vendorId}`,
      );

      if (!products || products.length === 0) {
        console.log(`No products found for vendor ${vendorId}`);
      }

      return products || [];
    } catch (error) {
      console.error(`Failed to load products for vendor ${vendorId}:`, error);
      console.error(
        "Error details:",
        error instanceof Error ? error.message : String(error),
      );
      return [];
    }
  };

  useEffect(() => {
    initializeApp();
  }, []);

  return {
    vendors,
    loading,
    loadVendorProducts,
  };
};
