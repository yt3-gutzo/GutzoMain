import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { X, Check, ChevronRight, ChevronDown, Star, Calendar, Info, Clock, MapPin } from 'lucide-react';
import { MealPlan } from './WeeklyMealPlansSection';
import { nodeApiService } from '../utils/nodeApi';

interface MealPlanBottomSheetProps {
  plan: MealPlan | null;
  onClose: () => void;
}

const MealPlanBottomSheet: React.FC<MealPlanBottomSheetProps> = ({ plan, onClose }) => {
  // State for V12 Logic
  const [duration, setDuration] = useState<'1 Week' | '2 Weeks' | '1 Month'>('1 Month');
  const [selectedMeals, setSelectedMeals] = useState<string[]>(['Lunch', 'Dinner']);
  const [selectedDays, setSelectedDays] = useState<string[]>(['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']);
  const [isFAQExpanded, setIsFAQExpanded] = useState(false);
  const [fullPlanDetails, setFullPlanDetails] = useState<any>(null);

  // Constants
  const weeklyPrice = plan ? parseInt(plan.price.replace(/[^\d]/g, '')) || 89 : 89;

  React.useEffect(() => {
    if (plan?.id) {
      const fetchDetails = async () => {
        try {
            const response = await nodeApiService.getMealPlan(plan.id);
            if (response.success) {
                setFullPlanDetails(response.data);
            }
        } catch (err) {
            console.error("Failed to fetch full plan details", err);
        }
      };
      fetchDetails();
    }
  }, [plan]);
  
  // Toggle helpers
  const toggleMeal = (meal: string) => {
    if (selectedMeals.includes(meal)) {
      setSelectedMeals(selectedMeals.filter(m => m !== meal));
    } else {
      setSelectedMeals([...selectedMeals, meal]);
    }
  };

  const toggleDay = (day: string) => {
    if (selectedDays.includes(day)) {
      setSelectedDays(selectedDays.filter(d => d !== day));
    } else {
      setSelectedDays([...selectedDays, day]);
    }
  };

  return (
    <AnimatePresence>
      {plan && (
        <>
          {/* Backdrop */}
          <motion.div 
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="fixed inset-0 bg-black/60 z-[1001]" 
            onClick={onClose}
          />

          {/* Sheet */}
          <motion.div 
            initial={{ y: "100%" }}
            animate={{ y: 0 }}
            exit={{ y: "100%" }}
            transition={{ type: "spring", damping: 25, stiffness: 300 }}
            className="fixed bottom-0 left-0 right-0 bg-white z-[1002] rounded-t-2xl flex flex-col max-h-[90vh]"
          >

        
        {/* Header / Close */}
        <div className="flex items-center justify-between p-4 border-b border-gray-100">
          <div>
             {/* 1️⃣ Top Section — Emotional Hook */}
            <h2 className="text-xl font-bold text-gray-900 leading-tight">{plan.title} Plan</h2>
            <p className="text-xs text-gray-500 mt-0.5">by {plan.vendor}</p>
          </div>
          <button onClick={onClose} className="p-2 bg-gray-100 rounded-full hover:bg-gray-200 transition-colors">
            <X size={20} className="text-gray-600" />
          </button>
        </div>

        {/* Scrollable Content */}
        <div className="overflow-y-auto flex-1 pb-32"> {/* Padding bottom for sticky footer */}
          
          <div className="px-4 py-4 space-y-6">

            {/* 1️⃣ Emotional Hook Reassurance */}
            <p className="text-sm text-gray-600 bg-green-50 text-green-800 px-3 py-2 rounded-lg font-medium inline-block w-full text-center border border-green-100">
              Fresh meals. No planning. No stress.
            </p>

            {/* 2️⃣ Weekly Menu Preview (Dynamic) */}
            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <h3 className="font-bold text-gray-900 text-sm">This Week's Menu</h3>
                <button className="text-xs font-semibold text-green-600 flex items-center">
                  View full menu <ChevronRight size={14} />
                </button>
              </div>
              <div className="grid grid-cols-3 gap-2">
                {fullPlanDetails?.day_menu?.slice(0, 3).map((item: any, i: number) => (
                  <div key={i} className="flex flex-col gap-1">
                    <div className="relative aspect-square rounded-xl overflow-hidden bg-gray-100">
                      <img 
                        src={item.lunch_image || item.dinner_image || plan.image || '/assets/mealplans/proteinpower.png'} 
                        alt={item.day_theme || item.day_name} 
                        className="object-cover w-full h-full" 
                        onError={(e) => {
                          (e.target as HTMLImageElement).src = plan.image || '/assets/mealplans/proteinpower.png';
                        }}
                      />
                      <div className="absolute bottom-0 left-0 right-0 bg-black/60 text-white text-[10px] font-bold text-center py-0.5">
                        {item.day_name?.substring(0, 3) || `Day ${i+1}`}
                      </div>
                    </div>
                    <p className="text-[10px] leading-tight text-gray-700 font-medium text-center line-clamp-2">
                      {item.day_theme || "Chef's Special"}
                    </p>
                  </div>
                )) || (
                  // Fallback if no menu data
                   [
                    { day: 'Mon', dish: 'Chef\'s Special', img: plan.image },
                    { day: 'Tue', dish: 'Healthy Bowl', img: plan.image },
                    { day: 'Wed', dish: 'Supra Dish', img: plan.image },
                  ].map((item, i) => (
                    <div key={i} className="flex flex-col gap-1">
                      <div className="relative aspect-square rounded-xl overflow-hidden bg-gray-100">
                        <img src={item.img} alt={item.dish} className="object-cover w-full h-full" />
                         <div className="absolute bottom-0 left-0 right-0 bg-black/60 text-white text-[10px] font-bold text-center py-0.5">
                          {item.day}
                        </div>
                      </div>
                      <p className="text-[10px] leading-tight text-gray-700 font-medium text-center line-clamp-2">
                        {item.dish}
                      </p>
                    </div>
                  ))
                )}
              </div>
            </div>

            {/* 3️⃣ Pricing Block */}
            <div className="bg-gray-50 rounded-xl p-4 border border-gray-100">
              <div className="flex items-baseline gap-1">
                <span className="text-2xl font-bold text-gray-900">₹{weeklyPrice}</span>
                <span className="text-base font-medium text-gray-500">/ day</span>
              </div>
              <p className="text-xs text-gray-500 mt-1 flex items-center gap-1">
                Mon – Sat <span className="w-1 h-1 rounded-full bg-gray-300"></span> Lunch/Dinner <span className="w-1 h-1 rounded-full bg-gray-300"></span> Free delivery
              </p>
            </div>

            {/* 4️⃣ Commitment Selector (Revenue Driver) */}
            <div className="space-y-2">
              <h3 className="font-semibold text-gray-900 text-sm">Customize Your Plan</h3>
              <div className="grid grid-cols-3 gap-2 bg-gray-100 p-1 rounded-xl">
                {['1 Week', '2 Weeks', '1 Month'].map((opt) => (
                  <button
                    key={opt}
                    onClick={() => setDuration(opt as any)}
                    className={`
                      relative py-2.5 px-1 rounded-lg text-xs font-semibold transition-all
                      ${duration === opt 
                        ? 'bg-white text-gray-900 shadow-sm ring-1 ring-black/5' 
                        : 'text-gray-500 hover:text-gray-700'}
                    `}
                  >
                    {opt}
                    {opt === '1 Month' && (
                       <span className={`
                         absolute -top-2 right-0 left-0 mx-auto w-max px-1.5 py-0.5 bg-green-500 text-white text-[9px] rounded-full uppercase tracking-wider
                         ${duration === opt ? 'opacity-100' : 'opacity-80 scale-90'}
                       `}>
                         Save 5%
                       </span>
                    )}
                  </button>
                ))}
              </div>
            </div>

            {/* 5️⃣ Meals Included */}
            <div className="space-y-2">
              <p className="text-xs text-gray-500 font-medium">Included Daily:</p>
              <div className="flex flex-wrap gap-2">
                {['Lunch', 'Dinner'].map(meal => (
                  <button
                    key={meal}
                    onClick={() => toggleMeal(meal)}
                    className={`
                      flex items-center gap-1.5 px-3 py-2 rounded-full text-xs font-semibold border transition-colors
                      ${selectedMeals.includes(meal)
                        ? 'bg-green-50 border-green-200 text-green-700'
                        : 'bg-white border-gray-200 text-gray-500 hover:border-gray-300'}
                    `}
                  >
                    {selectedMeals.includes(meal) && <div className="bg-green-500 rounded-full p-0.5"><Check size={10} className="text-white" /></div>}
                    {meal}
                  </button>
                ))}
                <button
                  onClick={() => toggleMeal('Breakfast')}
                  className={`
                    flex items-center gap-1.5 px-3 py-2 rounded-full text-xs font-medium border transition-colors
                    ${selectedMeals.includes('Breakfast')
                      ? 'bg-green-50 border-green-200 text-green-700 font-semibold'
                      : 'bg-white border-gray-200 text-gray-500 hover:border-gray-300'}
                  `}
                >
                  <div className={`w-3.5 h-3.5 rounded-full border flex items-center justify-center ${selectedMeals.includes('Breakfast') ? 'border-green-500 bg-green-500' : 'border-gray-300'}`}>
                    {selectedMeals.includes('Breakfast') && <Check size={10} className="text-white" />}
                  </div>
                  Breakfast (+₹39)
                </button>
              </div>
            </div>

            {/* 6️⃣ Delivery Days */}
            <div className="space-y-2">
              <p className="text-xs text-gray-500 font-medium">Delivery Days:</p>
              <div className="flex gap-1.5 overflow-x-auto pb-1 scrollbar-hide">
                {['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map(day => (
                  <button
                    key={day}
                    onClick={() => toggleDay(day)}
                    className={`
                      min-w-[40px] h-[36px] flex items-center justify-center rounded-lg text-xs font-semibold transition-colors
                      ${selectedDays.includes(day)
                        ? 'bg-green-500 text-white shadow-sm shadow-green-200'
                        : 'bg-gray-100 text-gray-500'}
                    `}
                  >
                    {day}
                  </button>
                ))}
                <div className="min-w-[40px] h-[36px] flex items-center justify-center rounded-lg text-xs font-medium bg-gray-50 text-gray-300 cursor-not-allowed">
                  Sun
                </div>
              </div>
              <p className="text-[10px] text-green-600 font-medium">Sunday is a rest day (Vendor closed)</p>
            </div>

            {/* 7️⃣ Start Date */}
            <div className="flex items-center justify-between bg-white border border-gray-200 p-3 rounded-xl">
               <div className="flex flex-col">
                  <span className="text-[10px] text-gray-500 font-semibold uppercase tracking-wide">Starting From</span>
                  <span className="text-sm font-bold text-gray-900">Tomorrow, Lunch</span>
               </div>
               <button className="text-xs font-semibold text-green-600 flex items-center gap-1">
                 Change <ChevronRight size={14} />
               </button>
            </div>

            {/* 8️⃣ Key Benefits */}
            <div className="space-y-3 pt-2">
              <h3 className="font-bold text-gray-900 text-sm">Plan Benefits</h3>
               <div className="grid grid-cols-2 gap-y-2 gap-x-4">
                  {[
                    "Pause or Skip days anytime",
                    "Free Delivery included",
                    "Daily Fresh Menu",
                    "Cancel plan anytime"
                  ].map((benefit, i) => (
                    <div key={i} className="flex items-start gap-2">
                      <Check size={14} className="text-green-500 mt-0.5 shrink-0" />
                      <span className="text-xs text-gray-600 font-medium">{benefit}</span>
                    </div>
                  ))}
               </div>
            </div>

            {/* 9️⃣ FAQ (Single Question) */}
            <div className="border border-gray-100 rounded-xl overflow-hidden">
               <button 
                  onClick={() => setIsFAQExpanded(!isFAQExpanded)}
                  className="w-full flex items-center justify-between p-3 bg-gray-50 hover:bg-gray-100 transition-colors text-left"
               >
                 <span className="text-sm font-semibold text-gray-800">Will I get the same food every day?</span>
                 <ChevronDown size={16} className={`text-gray-500 transition-transform ${isFAQExpanded ? 'rotate-180' : ''}`} />
               </button>
               {isFAQExpanded && (
                 <div className="p-3 bg-white text-xs text-gray-600 leading-relaxed">
                   No! We provide a new menu every single day to ensure you never get bored. You can check the full weekly menu in advance.
                 </div>
               )}
            </div>

            {/* Spacer for sticky footer */}
            <div className="h-4"></div>

          </div>
        </div>

        {/* 🔟 Sticky Bottom CTA */}
        <div className="absolute bottom-0 left-0 right-0 p-4 bg-white border-t border-gray-100 shadow-[0_-4px_20px_rgba(0,0,0,0.05)] z-[1003]">
           {/* Microtext */}
           <div className="flex justify-center mb-2">
             <p className="text-[10px] text-gray-500 font-medium">
               You’ll be charged only for the days you choose.
             </p>
           </div>
           <button className="w-full bg-[#1BA672] hover:bg-[#158f61] active:bg-[#0e754f] text-white font-bold py-3.5 rounded-xl shadow-lg shadow-green-200 transition-all flex items-center justify-center gap-2">
              Subscribe for ₹{weeklyPrice} / day
           </button>
        </div>

        </motion.div>
        </>
      )}
    </AnimatePresence>
  );
};

export default MealPlanBottomSheet;
