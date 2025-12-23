import { MapPin, Loader2, AlertCircle, X, Navigation, Plus } from "lucide-react";
import { Sheet, SheetContent, SheetHeader, SheetTitle } from "./ui/sheet";
import { Button } from "./ui/button";
import { useLocation } from "../contexts/LocationContext";
import { useAuth } from "../contexts/AuthContext";
import colors from "../styles/colors";

interface LocationBottomSheetProps {
  isOpen: boolean;
  onClose: () => void;
  onShowAddressList?: () => void;
}

export function LocationBottomSheet({ isOpen, onClose, onShowAddressList }: LocationBottomSheetProps) {
  const { locationDisplay, isLoading, error, refreshLocation, isInCoimbatore, isDefaultAddress, locationLabel } = useLocation();
  const { isAuthenticated } = useAuth();

  const handleDetectLocation = () => {
    refreshLocation();
  };

  const handleManageAddresses = () => {
    onClose();
    onShowAddressList?.();
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

        <div className="p-6 space-y-4">
          {/* Current Location Display */}
          <div className="flex items-start gap-3 p-4 bg-gray-50 rounded-[0.8rem] border border-gray-200">
            {isLoading ? (
               <div className="flex items-center gap-3 w-full">
                 <div className="h-5 w-5 rounded-full bg-gray-200 animate-pulse flex-shrink-0" />
                 <div className="flex-1 space-y-2">
                   <div className="h-4 bg-gray-200 rounded animate-pulse w-1/3"></div>
                   <div className="h-3 bg-gray-200 rounded animate-pulse w-2/3"></div>
                 </div>
               </div>
            ) : (
              <>
                {error ? (
                  <AlertCircle className="h-5 w-5 flex-shrink-0 mt-0.5" style={{ color: '#E74C3C' }} />
                ) : (
                  <MapPin className="h-5 w-5 flex-shrink-0 mt-0.5" style={{ color: colors.info }} />
                )}
                <div className="flex-1 min-w-0">
                  <div className="font-medium text-gray-900">
                    {error ? "Location Error" : locationLabel ? locationLabel : isDefaultAddress ? "Default Address" : "Current Location"}
                  </div>
                  <div className="text-sm text-gray-600 mt-1">
                    {error ? error : locationDisplay}
                  </div>
                </div>
              </>
            )}
          </div>

          {/* Detect Current Location Button */}
          <Button
            onClick={handleDetectLocation}
            disabled={isLoading}
            className="w-full bg-white hover:bg-gray-50 text-gutzo-primary border border-gray-200 rounded-[0.8rem] py-6 flex items-center justify-center gap-3 shadow-[0_1px_2px_rgba(0,0,0,0.04)]"
          >
            <Navigation className={`h-5 w-5 ${isLoading ? 'animate-pulse' : ''}`} />
            <span className="font-medium">
              {isLoading ? 'Detecting...' : 'Detect Current Location'}
            </span>
          </Button>

          {/* Manage Addresses (for authenticated users) */}
          {isAuthenticated && (
            <Button
              onClick={handleManageAddresses}
              className="w-full bg-gutzo-primary hover:bg-gutzo-primary-hover text-white rounded-[0.8rem] py-6 flex items-center justify-center gap-3"
            >
              <Plus className="h-5 w-5" />
              <span className="font-medium">Add/Manage Addresses</span>
            </Button>
          )}

          {/* Info Text */}
          <p className="text-xs text-center pt-2" style={{ color: colors.info }}>
            We need your location to show restaurants delivering to you
          </p>
        </div>
      </SheetContent>
    </Sheet>
  );
}
