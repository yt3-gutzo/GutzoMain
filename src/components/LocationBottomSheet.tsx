import { MapPin, Loader2, AlertCircle, X, Navigation, Plus, ChevronRight, LocateFixed, Home, Building2, Trash2 } from "lucide-react";
import { Sheet, SheetContent, SheetHeader, SheetTitle } from "./ui/sheet";
import { Button } from "./ui/button";
import { useLocation } from "../contexts/LocationContext";
import { useAuth } from "../contexts/AuthContext";
import colors from "../styles/colors";
import { useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";
import { AddressApi } from "../utils/addressApi";
import { UserAddress } from "../types/address";

export interface LocationBottomSheetProps {
  isOpen: boolean;
  onClose: () => void;
  onAddAddress?: () => void;
}

export function LocationBottomSheet({ isOpen, onClose, onAddAddress }: LocationBottomSheetProps) {
  const { locationDisplay, isLoading, error, refreshLocation, isInCoimbatore, isDefaultAddress, locationLabel } = useLocation();
  const { isAuthenticated, user } = useAuth();
  const [savedAddresses, setSavedAddresses] = useState<UserAddress[]>([]);
  const [isLoadingAddresses, setIsLoadingAddresses] = useState(false);

  const navigate = useNavigate();

  useEffect(() => {
    if (isAuthenticated && user?.phone && isOpen) {
        setIsLoadingAddresses(true);
        AddressApi.getUserAddresses(user.phone)
            .then(res => {
                if (res.success && res.data) {
                    setSavedAddresses(res.data);
                }
            })
            .finally(() => {
                setIsLoadingAddresses(false);
            });
    }
  }, [isAuthenticated, user?.phone, isOpen]);

  const handleDetectLocation = async () => {
    await refreshLocation();
    onClose();
    navigate('/');
  };

  const handleSelectAddress = async (address: UserAddress) => {
      if (user?.phone) {
          // Set as default address
          await AddressApi.setDefaultAddress(address.id, user.phone);
          // Refresh location context
          await refreshLocation();
          onClose();
      }
  };

  const handleManageAddresses = () => {
    onAddAddress?.();
  };

  return (
    <Sheet open={isOpen} onOpenChange={onClose}>
      <SheetContent 
        side="bottom" 
        className="rounded-t-3xl p-0 w-full max-w-full left-0 right-0 transition-transform duration-300 ease-in-out" 
        style={{ top: '104px', bottom: 0, height: 'calc(100vh - 104px)', position: 'fixed', zIndex: 1100 }}
      >
        <style>{`
          [data-slot="sheet-content"] > button[class*="absolute"] {
            display: none !important;
          }
          [data-slot="sheet-content"][data-state="closed"] {
            animation: slideDown 300ms ease-in-out;
          }
          [data-slot="sheet-content"][data-state="open"] {
            animation: slideUp 300ms ease-in-out;
          }
          @keyframes slideUp {
            from {
              transform: translateY(100%);
            }
            to {
              transform: translateY(0);
            }
          }
          @keyframes slideDown {
            from {
              transform: translateY(0);
            }
            to {
              transform: translateY(100%);
            }
          }
          .scrollbar-hide::-webkit-scrollbar {
            display: none;
          }
          .scrollbar-hide {
            -ms-overflow-style: none;
            scrollbar-width: none;
          }
        `}</style>
        <SheetHeader className="p-6 pb-4 border-b border-gray-100">
          <div className="flex items-center justify-between">
            <SheetTitle className="text-xl">Select Location</SheetTitle>
            <button
              onClick={onClose}
              className="rounded-full p-2 hover:bg-gray-100 transition-colors -mr-2"
            >
              <X className="h-5 w-5 text-gray-500" />
            </button>
          </div>
        </SheetHeader>

        <div className="p-6 space-y-4 flex-1 overflow-y-auto scrollbar-hide">
          {/* Use Current Location Row */}
          <button
            onClick={handleDetectLocation}
            disabled={isLoading}
            className="w-full flex items-center justify-between p-4 rounded-[0.8rem] border border-gray-100 bg-white shadow-sm transition-colors hover:bg-gray-50 text-left group"
          >
            <div className="flex items-start gap-4 min-w-0">
               {/* Icon - Top aligned with title */}
              <div className="flex-shrink-0 mt-0.5">
                 <LocateFixed className={`h-6 w-6 text-gutzo-primary ${isLoading ? 'animate-pulse' : ''}`} />
              </div>

              {/* Text Content */}
              <div className="flex-1 min-w-0 flex flex-col gap-0.5">
                <span className="font-semibold text-[15px] text-gutzo-primary group-hover:text-gutzo-primary-hover transition-colors leading-tight">
                  {isLoading ? "Detecting location..." : "Use current location"}
                </span>
                <span className="text-[13px] text-gray-500 truncate leading-tight">
                  {isLoading
                    ? "Fetching your GPS coordinates..."
                    : error
                    ? error
                    : locationDisplay || "Using GPS"}
                </span>
              </div>
            </div>

            {/* Arrow - Centered vertically */}
            <ChevronRight className="h-5 w-5 text-gray-400 group-hover:text-gray-600 transition-colors flex-shrink-0 ml-4" />
          </button>

          {/* Manage Addresses (for authenticated users) */}
          {isAuthenticated && (
            <>
              <Button
                onClick={handleManageAddresses}
                className="w-full bg-gutzo-primary hover:bg-gutzo-primary-hover text-white rounded-xl py-6 flex items-center justify-center gap-3 shadow-sm"
              >
                <Plus className="h-5 w-5" />
                <span className="font-medium">Add/Manage Addresses</span>
              </Button>

              {/* Saved Addresses Section */}
              <div className="pt-2">
                <h3 className="text-lg font-semibold text-gray-900 mb-4">Saved Addresses</h3>
                
                {isLoadingAddresses ? (
                  /* Loading Skeletons */
                  <div className="space-y-3">
                    {[1, 2, 3].map((i) => (
                      <div key={i} className="relative p-4 rounded-xl border border-gray-100 bg-white">
                        <div className="flex items-start gap-3">
                          <div className="h-5 w-5 bg-gray-100 rounded animate-pulse flex-shrink-0 mt-0.5" />
                          <div className="flex-1 min-w-0 space-y-2">
                            <div className="h-4 w-24 bg-gray-100 rounded animate-pulse" />
                            <div className="h-3 w-full bg-gray-100 rounded animate-pulse" />
                            <div className="h-3 w-2/3 bg-gray-100 rounded animate-pulse" />
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                ) : savedAddresses.length > 0 ? (
                  /* Address List */
                  <div className="space-y-3">
                    {savedAddresses.map((addr) => {
                      const Icon = addr.type === 'home' ? Home : addr.type === 'work' ? Building2 : MapPin;
                      const label = addr.custom_label || (addr.type.charAt(0).toUpperCase() + addr.type.slice(1));
                      
                      return (
                        <div
                          key={addr.id}
                          className="relative p-4 rounded-xl border border-gray-200 bg-white hover:border-gutzo-primary transition-colors group cursor-pointer"
                          onClick={() => handleSelectAddress(addr)}
                        >
                          <div className="flex items-start gap-3">
                            <Icon className="h-5 w-5 text-gutzo-primary flex-shrink-0 mt-0.5" />
                            <div className="flex-1 min-w-0">
                              <h4 className="font-medium text-gray-900 mb-1">{label}</h4>
                              <p className="text-sm text-gray-600 leading-relaxed line-clamp-2">
                                {addr.full_address}
                              </p>
                              {addr.postal_code && (
                                <p className="text-sm text-gray-600 mt-1">
                                  {addr.state} {addr.postal_code}, {addr.country || 'India'}
                                </p>
                              )}
                            </div>
                            <button 
                              className="p-2 -mr-2 -mt-2 text-gray-400 hover:text-red-500 transition-colors"
                              onClick={(e) => {
                                e.stopPropagation();
                                // Optional: Handle delete if needed, for now just propagation stop
                              }}
                            >
                              <Trash2 className="h-4 w-4" />
                            </button>
                          </div>
                        </div>
                      );
                    })}
                  </div>
                ) : (
                  /* Empty State */
                  <div className="text-center py-8 text-gray-500 text-sm">
                    No saved addresses found.
                  </div>
                )}
              </div>
            </>
          )}

        </div>
      </SheetContent>
    </Sheet>
  );
}
