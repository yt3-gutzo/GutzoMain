import { MapPin, Loader2, AlertCircle, X, Navigation, Plus, ChevronRight, LocateFixed, Home, Building2, Trash2, Search, MoreVertical, Edit2 } from "lucide-react";
import { Sheet, SheetContent, SheetHeader, SheetTitle } from "./ui/sheet";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from "./ui/alert-dialog";
import { Button } from "./ui/button";
import { useLocation } from "../contexts/LocationContext";
import { useAuth } from "../contexts/AuthContext";
import colors from "../styles/colors";
import { useNavigate } from "react-router-dom";
import { useState, useEffect, useRef } from "react";
import { createPortal } from "react-dom";
import { getGoogleMapsApiKey } from "../utils/googleMapsConfig";
import { AddressApi } from "../utils/addressApi";
import { UserAddress } from "../types/address";
import { LocationSearchInput } from "./common/LocationSearchInput";
import { AddressModal } from "./auth/AddressModal";
import { useAddresses } from "../hooks/useAddresses";

export interface LocationBottomSheetProps {
  isOpen: boolean;
  onClose: () => void;
  onAddAddress?: () => void;
}

export function LocationBottomSheet({ isOpen, onClose, onAddAddress }: LocationBottomSheetProps) {
  const { locationDisplay, isLoading, error, refreshLocation, isInCoimbatore, isDefaultAddress, locationLabel } = useLocation();
  const { isAuthenticated, user } = useAuth();
  
  // Refactor to use hook
  const { 
    addresses: savedAddresses, 
    loading: isLoadingAddresses, 
    refreshAddresses,
    deleteAddress 
  } = useAddresses();

  const [editingAddress, setEditingAddress] = useState<UserAddress | null>(null);
  const [isAddressModalOpen, setIsAddressModalOpen] = useState(false);
  const [showDeleteConfirm, setShowDeleteConfirm] = useState(false);
  const [addressToDelete, setAddressToDelete] = useState<string | null>(null);
  const [activeMenuId, setActiveMenuId] = useState<string | null>(null);

  const navigate = useNavigate();

  // Close menu on outside click
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (activeMenuId && !(event.target as Element).closest('.address-menu-trigger') && !(event.target as Element).closest('.address-menu-content')) {
         setActiveMenuId(null);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, [activeMenuId]);


  
  const handleEditAddress = (address: UserAddress) => {
     setEditingAddress(address);
     setIsAddressModalOpen(true);
     setActiveMenuId(null);
  };
   
  const handleDeleteClick = (addressId: string) => {
     setAddressToDelete(addressId);
     setShowDeleteConfirm(true);
     setActiveMenuId(null);
  };

  const confirmDelete = async () => {
     if (addressToDelete) {
        await deleteAddress(addressToDelete);
        setShowDeleteConfirm(false);
        setAddressToDelete(null);
     }
  };

  const handleAddAddress = () => {
    setEditingAddress(null);
    setIsAddressModalOpen(true);
  };

  const handleDetectLocation = async () => {
    await refreshLocation();
    onClose();
    navigate('/');
  };

  const [selectingAddressId, setSelectingAddressId] = useState<string | null>(null);

  const handleSelectAddress = async (address: UserAddress) => {
      if (user?.phone) {
          try {
            setSelectingAddressId(address.id);
            // Set as default address
            await AddressApi.setDefaultAddress(address.id, user.phone);
            // Refresh location context
            await refreshLocation();
            onClose();
            navigate('/'); // Ensure we land in the app
          } catch (error) {
            console.error("Failed to select address:", error);
          } finally {
            setSelectingAddressId(null);
          }
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
        <SheetHeader className="p-6 pb-2">
          <div className="flex items-center justify-between">
            <SheetTitle className="text-xl">Select Location</SheetTitle>
            <button
              onClick={onClose}
              className="rounded-full p-2 hover:bg-gray-100 transition-colors -mr-2"
            >
              <X className="h-5 w-5 text-gray-500" />
            </button>
          </div>
          
          <LocationSearchInput 
            onLocationSelect={(loc) => {
              console.log("Selected from search:", loc);
              // TODO: Handle selection (update context?)
              // For now we just log it as per previous plan
            }}
          />
        </SheetHeader>

        <div className="px-6 pb-6 pt-2 space-y-4 flex-1 overflow-y-auto scrollbar-hide">
          {/* Use Current Location Row */}
          <button
            onClick={handleDetectLocation}
            disabled={isLoading}
            className="w-full flex items-center justify-between p-4 rounded-[0.8rem] border border-gray-100 bg-white shadow-sm transition-colors hover:bg-gray-50 text-left group"
          >
            <div className="flex items-start gap-4 min-w-0">
              <div className="p-2 bg-gutzo-primary/10 rounded-full flex-shrink-0 group-hover:bg-gutzo-primary/20 transition-colors">
                {isLoading ? (
                   <Loader2 className="h-5 w-5 text-gutzo-primary animate-spin" />
                ) : (
                   <LocateFixed className="h-5 w-5 text-gutzo-primary" />
                )}
              </div>
              <div className="min-w-0">
                <h4 className="font-semibold text-gutzo-primary">Use current location</h4>
                <p className="text-sm text-gray-500 truncate mt-0.5">
                   {locationDisplay}
                </p>
              </div>
            </div>

            {/* Arrow - Centered vertically */}
            <ChevronRight className="h-5 w-5 text-gray-400 group-hover:text-gray-600 transition-colors flex-shrink-0 ml-4" />
          </button>

          {/* Manage Addresses (for authenticated users) */}
          {isAuthenticated && (
            <>
              <Button
                onClick={handleAddAddress}
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
                      const isSelecting = selectingAddressId === addr.id;
                      
                      return (
                        <div
                          key={addr.id}
                          className={`relative p-4 rounded-xl border bg-white transition-colors group cursor-pointer ${
                             isSelecting ? 'border-gutzo-primary bg-gutzo-primary/5' : 'border-gray-200 hover:border-gutzo-primary'
                          }`}
                          onClick={() => !isSelecting && handleSelectAddress(addr)}
                        >
                          <div className="flex items-start gap-3">
                            <Icon className="h-5 w-5 text-gutzo-primary flex-shrink-0 mt-0.5" />
                            <div className="flex-1 min-w-0">
                                <h4 className="font-medium text-gray-900 mb-1 flex items-center gap-2">
                                {label}
                                {addr.is_default && (
                                  <span 
                                    className="inline-flex items-center px-2 py-0.5 rounded-full text-[10px] font-medium border"
                                    style={{ 
                                      backgroundColor: '#E8F6F1', 
                                      color: '#1BA672', 
                                      borderColor: '#1BA672' 
                                    }}
                                  >
                                    Selected
                                  </span>
                                )}
                              </h4>
                              <p className="text-sm text-gray-600 leading-relaxed line-clamp-2">
                                {addr.full_address}
                              </p>
                              {addr.postal_code && (
                                <p className="text-sm text-gray-600 mt-1">
                                  {addr.state} {addr.postal_code}, {addr.country || 'India'}
                                </p>
                              )}
                            </div>
                            
                            {/* 3-Dot Menu */}
                            <div className="relative">
                                <button 
                                  className="p-2 -mr-2 -mt-2 text-gray-400 hover:text-gray-600 transition-colors address-menu-trigger"
                                  onClick={(e) => {
                                    e.stopPropagation();
                                    setActiveMenuId(activeMenuId === addr.id ? null : addr.id);
                                  }}
                                >
                                  <MoreVertical className="h-5 w-5" />
                                </button>

                                {activeMenuId === addr.id && (
                                    <div className="absolute right-0 top-8 w-32 bg-white rounded-lg shadow-lg border border-gray-100 z-50 py-1 overflow-hidden animate-in fade-in zoom-in-95 duration-200 address-menu-content">
                                        <button
                                            onClick={(e) => {
                                                e.stopPropagation();
                                                handleEditAddress(addr);
                                            }}
                                            className="w-full px-4 py-2 text-left text-sm text-gray-700 hover:bg-gray-50 flex items-center gap-2"
                                        >
                                            <Edit2 className="h-3.5 w-3.5" />
                                            Edit
                                        </button>
                                        <button
                                            onClick={(e) => {
                                                e.stopPropagation();
                                                handleDeleteClick(addr.id);
                                            }}
                                            className="w-full px-4 py-2 text-left text-sm text-red-600 hover:bg-red-50 flex items-center gap-2"
                                        >
                                            <Trash2 className="h-3.5 w-3.5" />
                                            Delete
                                        </button>
                                    </div>
                                )}
                            </div>
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

      {/* Global Full Screen App Loader */}
      {(selectingAddressId || isLoading) && createPortal(
        <div className="fixed inset-0 z-[9999] bg-white flex flex-col items-center justify-center animate-in fade-in duration-300">
            <div className="flex flex-col items-center gap-6">
                <div className="relative">
                    {/* Pulsing Logo */}
                    <div className="absolute inset-0 bg-gutzo-primary/20 rounded-full blur-xl animate-pulse scale-150"></div>
                    <img
                        src="https://35-194-40-59.nip.io/service/storage/v1/object/public/Gutzo/GUTZO.svg"
                        alt="Gutzo"
                        className="w-40 h-auto relative z-10 animate-bounce-slight" 
                        style={{ filter: 'drop-shadow(0 4px 6px rgba(0,0,0,0.1))' }}
                    />
                </div>
                
                <div className="flex flex-col items-center gap-3 mt-8">
                     <Loader2 className="h-8 w-8 text-gutzo-primary animate-spin" />
                     <div className="text-center">
                        <h3 className="text-lg font-semibold text-gray-900">
                             {isLoading ? "Finding your spot..." : "Setting your location..."}
                        </h3>
                        <p className="text-sm text-gray-500 mt-1">
                            Hang tight, bringing you the best food around!
                        </p>
                     </div>
                </div>
            </div>
        </div>,
        document.body
      )}

      {/* Internal Address Modal for Add/Edit */}
      <AddressModal
        isOpen={isAddressModalOpen}
        onClose={() => setIsAddressModalOpen(false)}
        editingAddress={editingAddress}
        onSave={async () => {
            await refreshAddresses();
            setIsAddressModalOpen(false);
        }}
      />

      {/* Delete Confirmation Modal */}
      {/* Delete Confirmation Modal */}
      <AlertDialog open={showDeleteConfirm} onOpenChange={(open) => !open && setShowDeleteConfirm(false)}>
        <AlertDialogContent className="z-[100001] rounded-2xl max-w-sm gap-4 p-6 shadow-xl">
          <AlertDialogHeader className="items-start text-left">
            <AlertDialogTitle className="text-lg font-bold text-gray-900">Delete Address?</AlertDialogTitle>
            <AlertDialogDescription className="text-gray-500 font-medium text-base">
              Are you sure you want to delete this address? This action cannot be undone.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter className="flex-row gap-3 mt-2">
            <AlertDialogCancel 
              className="flex-1 rounded-xl h-12 font-semibold border-gray-200 mt-0 hover:bg-gray-50 hover:text-gray-900"
              onClick={() => setShowDeleteConfirm(false)}
            >
              No
            </AlertDialogCancel>
            <AlertDialogAction 
              className="flex-1 bg-red-50 hover:bg-red-100 text-red-600 border border-red-200 rounded-xl h-12 font-bold transition-colors shadow-none"
              onClick={confirmDelete}
            >
              Yes
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </Sheet>
  );
}

// LocationSearchInput moved to components/common/LocationSearchInput.tsx
