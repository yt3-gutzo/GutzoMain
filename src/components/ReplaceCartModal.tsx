import React from 'react';
import { useMediaQuery } from '../hooks/use-media-query'; // Assuming this hook exists in the project
import { X } from 'lucide-react';

interface ReplaceCartModalProps {
  isOpen: boolean;
  onClose: () => void;
  onConfirm: () => void;
  oldVendorName: string;
  newVendorName: string;
}

const ReplaceCartModal: React.FC<ReplaceCartModalProps> = ({ isOpen, onClose, onConfirm, oldVendorName, newVendorName }) => {
  const isDesktop = useMediaQuery("(min-width: 1024px)");

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-[2000] flex items-end justify-center lg:items-center bg-black/60 backdrop-blur-sm animate-in fade-in duration-200">
      <div 
        className={`
          bg-white w-full max-w-md p-6 
          ${isDesktop ? 'rounded-2xl shadow-xl' : 'rounded-t-2xl shadow-[0_-4px_24px_rgba(0,0,0,0.15)]'}
          animate-in slide-in-from-bottom-10 duration-300
        `}
      >
        <div className="flex flex-col gap-4">
          <div className="flex justify-between items-start">
             <div className="space-y-1">
                <h3 className="text-lg font-bold text-gray-900">Replace cart items?</h3>
                <p className="text-sm text-gray-500 leading-relaxed">
                   Your cart contains dishes from <span className="font-semibold text-gray-900">{oldVendorName}</span>. 
                   Do you want to discard the selection and add dishes from <span className="font-semibold text-gray-900">{newVendorName}</span>?
                </p>
             </div>
             {/* Optional Close Button for Desktop */}
             {isDesktop && (
                <button onClick={onClose} className="p-1 rounded-full hover:bg-gray-100 transition-colors">
                   <X size={20} className="text-gray-400" />
                </button>
             )}
          </div>

          <div className="flex gap-3 mt-2 pt-2">
             <button 
                onClick={onClose}
                className="flex-1 py-3 px-4 bg-white border border-gray-200 text-gray-700 font-semibold rounded-xl text-sm hover:bg-gray-50 transition-colors"
             >
                No
             </button>
             <button 
                onClick={onConfirm}
                className="flex-1 py-3 px-4 bg-[#1BA672] text-white font-semibold rounded-xl text-sm hover:bg-[#14885E] shadow-sm transition-colors"
             >
                Yes, replace
             </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ReplaceCartModal;
