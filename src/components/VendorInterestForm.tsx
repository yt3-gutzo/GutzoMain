import { useState } from "react";
import { Button } from "./ui/button";
import { Input } from "./ui/input";
import { Label } from "./ui/label";
import { Textarea } from "./ui/textarea";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "./ui/select";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "./ui/card";
import { toast } from "sonner";
import { nodeApiService as apiService } from "../utils/nodeApi";
import { Store, User, Phone, MapPin, Utensils, Mail } from "lucide-react";
import { useRouter } from "./Router";

interface VendorInterestFormData {
  kitchen_name: string;
  contact_name: string;
  phone: string;
  email: string;
  city: string;
  food_type: string;
}

export function VendorInterestForm() {
  const { navigate } = useRouter();
  const [formData, setFormData] = useState<VendorInterestFormData>({
    kitchen_name: "",
    contact_name: "",
    phone: "",
    email: "",
    city: "Coimbatore", // Default as requested
    food_type: "",
  });
  
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isSuccess, setIsSuccess] = useState(false);

  const handleInputChange = (field: keyof VendorInterestFormData, value: string) => {
    setFormData(prev => ({
      ...prev,
      [field]: value
    }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    // Basic validation
    if (!formData.kitchen_name.trim() || !formData.contact_name.trim() || !formData.phone.trim() || !formData.city.trim()) {
      toast.error("Please fill in all required fields");
      return;
    }

    setIsSubmitting(true);
    
    try {
      await apiService.createVendorLead(formData);
      setIsSuccess(true);
      toast.success("Interest received! We'll be in touch.");
    } catch (error: any) {
      console.error("Failed to submit lead:", error);
      toast.error(error.message || "Failed to submit. Please try again.");
    } finally {
      setIsSubmitting(false);
    }
  };

  if (isSuccess) {
    return (
      <Card className="w-full max-w-lg mx-auto mt-8 border-green-100 bg-green-50/50">
        <CardContent className="pt-6 text-center space-y-4">
          <div className="mx-auto w-12 h-12 bg-green-100 rounded-full flex items-center justify-center">
            <Store className="h-6 w-6 text-green-600" />
          </div>
          <h2 className="text-2xl font-bold text-gray-900">Thanks for your interest!</h2>
          <p className="text-gray-600">
            We have received your details. Our onboarding team will contact you shortly on <strong>{formData.phone}</strong>.
          </p>
          <Button 
            onClick={() => navigate('/')}
            className="mt-4 bg-green-600 hover:bg-green-700 text-white"
          >
            Return to Home
          </Button>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card className="w-full max-w-lg mx-auto">
      <CardHeader>
        <CardTitle className="text-2xl font-bold text-gray-900">Partner with Gutzo</CardTitle>
        <CardDescription>
          Start your journey to becoming a managed vendor. Tell us about your kitchen.
        </CardDescription>
      </CardHeader>
      
      <CardContent>
        <form onSubmit={handleSubmit} className="space-y-4">
          {/* Kitchen Name */}
          <div className="space-y-2">
            <Label htmlFor="kitchen_name" className="flex items-center gap-2">
              <Store className="h-4 w-4 text-gray-500" />
              Kitchen / Brand Name *
            </Label>
            <Input
              id="kitchen_name"
              value={formData.kitchen_name}
              onChange={(e) => handleInputChange("kitchen_name", e.target.value)}
              placeholder="e.g. Grandma's Healthy Kitchen"
              required
            />
          </div>

          {/* Contact Person */}
          <div className="space-y-2">
            <Label htmlFor="contact_name" className="flex items-center gap-2">
              <User className="h-4 w-4 text-gray-500" />
              Contact Person Name *
            </Label>
            <Input
              id="contact_name"
              value={formData.contact_name}
              onChange={(e) => handleInputChange("contact_name", e.target.value)}
              placeholder="e.g. John Doe"
              required
            />
          </div>

          {/* Phone */}
          <div className="space-y-2">
            <Label htmlFor="phone" className="flex items-center gap-2">
              <Phone className="h-4 w-4 text-gray-500" />
              Phone Number *
            </Label>
            <Input
              id="phone"
              type="tel"
              value={formData.phone}
              onChange={(e) => handleInputChange("phone", e.target.value)}
              placeholder="+91 98765 43210"
              required
            />
          </div>

          {/* Email */}
          <div className="space-y-2">
             <Label htmlFor="email" className="flex items-center gap-2">
               <Mail className="h-4 w-4 text-gray-500" />
               Email Address
             </Label>
             <Input
               id="email"
               type="email"
               value={formData.email}
               onChange={(e) => handleInputChange("email", e.target.value)}
               placeholder="kitchen@example.com"
             />
           </div>

          {/* City */}
          <div className="space-y-2">
            <Label htmlFor="city" className="flex items-center gap-2">
              <MapPin className="h-4 w-4 text-gray-500" />
              City *
            </Label>
            <Select 
              value={formData.city} 
              onValueChange={(value) => handleInputChange("city", value)}
            >
              <SelectTrigger id="city">
                <SelectValue placeholder="Select City" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="Coimbatore">Coimbatore</SelectItem>
                <SelectItem value="Bangalore" disabled>Bangalore (Coming Soon)</SelectItem>
                <SelectItem value="Chennai" disabled>Chennai (Coming Soon)</SelectItem>
              </SelectContent>
            </Select>
          </div>

          {/* Food Type */}
          <div className="space-y-2">
            <Label htmlFor="food_type" className="flex items-center gap-2">
              <Utensils className="h-4 w-4 text-gray-500" />
              Type of Food You Cook *
            </Label>
            <Textarea
              id="food_type"
              value={formData.food_type}
              onChange={(e) => handleInputChange("food_type", e.target.value)}
              placeholder="e.g. South Indian millet breakfasts, Keto meals, North Indian tiffins..."
              rows={3}
              required
            />
          </div>

          <Button
            type="submit"
            disabled={isSubmitting}
            className="w-full"
            style={{ backgroundColor: "#1BA672", color: "white" }}
          >
            {isSubmitting ? "Submitting..." : "Submit Interest"}
          </Button>
          
           <p className="text-xs text-center text-gray-400 mt-4">
            By submitting, you agree to be contacted by Gutzo team.
          </p>
        </form>
      </CardContent>
    </Card>
  );
}
