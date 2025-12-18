import React, { useState } from 'react';
import { Sheet, SheetContent } from './ui/sheet'; // Adjust path if needed
import { X, Check, CheckCircle2, ChevronRight, ChevronDown, Star, Calendar, Info, Clock, MapPin, Sun, Utensils, Moon, Coffee, ArrowRight, Lightbulb } from 'lucide-react';
import { MealPlan } from './WeeklyMealPlansSection';
import { nodeApiService } from '../utils/nodeApi';

interface MealPlanBottomSheetProps {
  plan: MealPlan | null;
  onClose: () => void;
}

const MealPlanBottomSheet: React.FC<MealPlanBottomSheetProps> = ({ plan, onClose }) => {
  // State for Healthy Daily Logic (HMR Trigger 1)
  const [duration, setDuration] = useState<'Trial' | '1 Week' | 'Monthly'>('1 Week'); // Default to "Most Chosen"
  const [selectedMeals, setSelectedMeals] = useState<string[]>(['Breakfast', 'Lunch', 'Dinner']);
  const [isVeg, setIsVeg] = useState(true);
  // State for Day Selection
  const [monthlyDays, setMonthlyDays] = useState<4 | 5 | 6>(5);
  const [weekDays, setWeekDays] = useState<number[]>([1, 2, 3, 4, 5, 6]); // 1=Mon... 6=Sat
  
  // State for Full Menu View
  const [showFullMenu, setShowFullMenu] = useState(false);

  // Force default selection on mount to override any persisted HMR state
  React.useEffect(() => {
     setDuration('1 Week');
  }, []);

  // Constants
  const weeklyPrice = plan ? parseInt(plan.price.replace(/[^\d]/g, '')) || 89 : 89;
  const isRoutine = duration !== 'Trial'; // Binary state logic for UI
  const isTrial = duration === 'Trial';
  
  // Toggle helpers
  const toggleMeal = (meal: string) => {
    if (selectedMeals.includes(meal)) {
      setSelectedMeals(selectedMeals.filter(m => m !== meal));
    } else {
      setSelectedMeals([...selectedMeals, meal]);
    }
  };

  const toggleWeekDay = (day: number) => {
    if (day === 0) return; // Sunday disabled
    if (weekDays.includes(day)) {
      if (weekDays.length > 3) {
        setWeekDays(weekDays.filter(d => d !== day));
      }
    } else {
      setWeekDays([...weekDays, day].sort());
    }
  };


  if (!plan) return null;

  return (
    <Sheet open={!!plan} onOpenChange={(open) => {
      if (!open) {
         onClose();
         setTimeout(() => setShowFullMenu(false), 300); // Reset on close
      }
    }}>
      <SheetContent 
        side="bottom" 
        className="gap-0 rounded-t-3xl p-0 w-full max-w-full left-0 right-0 transition-transform duration-300 ease-in-out flex flex-col"
        style={{ top: '104px', bottom: 0, height: 'calc(100vh - 104px)', zIndex: 1002 }}
      >
        <style>{`
           [data-slot="sheet-content"] > button[class*="absolute"] {
             display: none !important;
           }
           /* Force override for the persisted class in user's browser */
           .bg-green-100 {
             background-color: #FFF3E6 !important;
           }
        `}</style>

        <div className="flex flex-col h-full relative bg-white">
           {/* ----------------------------------------------------------------------
               PERSISTENT HEADER (Plan Info + Close)
               ---------------------------------------------------------------------- */}
           <div className="flex items-start justify-between px-6 pt-4 pb-0 flex-shrink-0">
             <div>
                <h2 className="text-2xl font-bold text-gray-900 leading-tight">{plan.title || 'Healthy Daily'}</h2>
                <p className="text-xs text-gray-500 mt-0.5">by {plan.vendor || 'FitMeals Inc.'}</p>
             </div>
             <div className="flex items-center gap-3">
                {/* Veg Toggle */}


                <button onClick={onClose} className="p-2 rounded-full hover:bg-gray-100 transition-colors">
                  <X className="h-5 w-5 text-gray-500" />
                </button>
             </div>
           </div>

        {showFullMenu ? (
           // ----------------------------------------------------------------------
           // FULL MENU VIEW (Nested Content)
           // ----------------------------------------------------------------------
           <div className="flex flex-col flex-1 overflow-hidden mt-2">
              {/* Secondary Header (Back + Title) */}
              <div className="flex items-center gap-2 px-6 py-3 border-b border-gray-100 flex-shrink-0 bg-white">
                 <button 
                  onClick={() => setShowFullMenu(false)}
                  className="p-1.5 -ml-2 rounded-full hover:bg-gray-100 transition-colors"
                 >
                    <ArrowRight className="h-5 w-5 text-gray-700 rotate-180" /> {/* Back Icon */}
                 </button>
                 <h2 className="text-sm font-bold text-gray-900">Weekly Menu</h2>
              </div>

              {/* Scrollable Menu List */}
              <div className="flex-1 overflow-y-auto bg-gray-50 p-4">
                 <div className="space-y-4">
                  {['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'].map((day, idx) => (
                     <div key={day} className="bg-white rounded-xl border border-gray-100 p-4 shadow-sm">
                        <div className="flex justify-between items-center mb-3">
                           <h3 className="font-bold text-gray-900">{day}</h3>
                           {day === 'Tuesday' && <span className="text-[10px] bg-orange-100 text-orange-700 px-2 py-0.5 rounded-full font-medium">TOMORROW</span>}
                        </div>
                        <div className="space-y-3">
                           <div className="flex gap-3">
                              <div className="mt-1 w-8 h-8 rounded-full bg-orange-50 flex items-center justify-center shrink-0">
                                 <Sun size={14} className="text-orange-500" />
                              </div>
                              <div>
                                 <p className="text-xs font-bold text-gray-400 uppercase">Breakfast</p>
                                 <p className="text-sm font-medium text-gray-800">Idly & Sambar {idx % 2 === 0 ? '+ Chutney' : ''}</p>
                              </div>
                           </div>
                           <div className="flex gap-3">
                              <div className="mt-1 w-8 h-8 rounded-full bg-green-50 flex items-center justify-center shrink-0">
                                 <Utensils size={14} className="text-green-500" />
                              </div>
                              <div>
                                 <p className="text-xs font-bold text-gray-400 uppercase">Lunch</p>
                                 <p className="text-sm font-medium text-gray-800">{idx % 2 === 0 ? 'Sambar Rice & Poriyal' : 'Curd Rice & Pickle'}</p>
                              </div>
                           </div>
                           <div className="flex gap-3">
                              <div className="mt-1 w-8 h-8 rounded-full bg-indigo-50 flex items-center justify-center shrink-0">
                                 <Moon size={14} className="text-indigo-500" />
                              </div>
                              <div>
                                 <p className="text-xs font-bold text-gray-400 uppercase">Dinner</p>
                                 <p className="text-sm font-medium text-gray-800">Chapati & {idx % 2 === 0 ? 'Paneer Gravy' : 'Dal Fry'}</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  ))}
                  
                  <div className="p-4 rounded-xl bg-gray-100 border border-gray-200 text-center">
                     <p className="text-sm font-medium text-gray-500">Sunday is a rest day 😴</p>
                     <p className="text-xs text-gray-400 mt-1">Kitchen closed</p>
                  </div>
                 </div>
              </div>
           </div>
        ) : (
           // ----------------------------------------------------------------------
           // MAIN MEAL PLAN VIEW
           // ----------------------------------------------------------------------
        <div className="flex flex-col flex-1 overflow-hidden">
           {/* Scrollable Content */}
           <div className="overflow-y-auto flex-1 px-6 pb-6 pt-2">
            
            <div className="space-y-2">

              {/* 1️⃣ Trust Badge */}
              <div className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-green-50 rounded-lg border border-green-100">
                 <span className="text-green-600 font-semibold text-xs">↗ 96% choose to continue</span>
              </div>

              {/* 2️⃣ Menu Card */}
              <div className="bg-white rounded-2xl shadow-[0_2px_12px_rgba(0,0,0,0.06)] border border-gray-100 p-3">
                 <div className="flex justify-between items-start mb-2">
                    <h3 className="text-lg font-bold text-gray-900">Tuesday <span className="text-orange-500 font-medium">(Tomorrow)</span></h3>
                 </div>
                 
                 <div className="flex gap-3 items-center">
                    {/* Left: Menu List */}
                    <div className="flex-1 space-y-2">
                       {[
                          { label: 'BREAKFAST', item: 'Idly & Sambar' },
                          { label: 'LUNCH', item: 'Sambar & Rice' },
                          { label: 'DINNER', item: 'Chapati & Gravy' }
                       ].map((m, i) => (
                          <div key={i} className="flex gap-2.5">
                             <div className="mt-1.5 w-1.5 h-1.5 rounded-full bg-orange-500 shrink-0" />
                             <div>
                                <p className="text-[12px] font-bold text-gray-500 uppercase tracking-wide" style={{ fontSize: '12px' }}>{m.label}</p>
                                <p className="text-[12px] font-semibold text-gray-800 leading-tight" style={{ fontSize: '12px' }}>{m.item}</p>
                             </div>
                          </div>
                       ))}
                    </div>

                    {/* Right: Image */}
                    <div className="w-[100px] h-[100px] min-w-[100px] min-h-[100px] rounded-xl overflow-hidden bg-gray-100 shrink-0" style={{ width: '100px', height: '100px', minWidth: '100px', minHeight: '100px' }}>
                       <img 
                          src={plan.image || '/assets/mealplans/proteinpower.png'} 
                          alt="Meal"
                          className="w-full h-full object-cover"
                       />
                    </div>
                 </div>


                 <div className="mt-2 pt-3 border-t border-gray-100 flex justify-center">
                     <button 
                        onClick={() => setShowFullMenu(true)}
                        className="flex items-center gap-1 text-gray-500 text-[12px] font-medium hover:gap-2 transition-all"
                     >
                        View full menu <ArrowRight size={14} />
                     </button>
                 </div>
              </div>

              {/* 3️⃣ Plan Configuration */}
              <div className="space-y-4">
                 <h3 className="text-lg font-bold text-gray-900">How do you want to start?</h3>

                 {/* Starts From */}
                 <div className="flex items-center justify-between bg-gray-50 p-4 rounded-xl">
                    <div className="flex items-center gap-3">
                       <Calendar className="text-gray-400" size={24} />
                       <div>
                          <p className="text-xs text-gray-500 font-medium">Starts from</p>
                          <p className="text-sm font-bold text-gray-900">Tomorrow (Tuesday)</p>
                       </div>
                    </div>
                    <ChevronRight size={20} className="text-gray-400" />
                 </div>

                 {/* Select Meals Grid */}
                 <div className="space-y-2">
                    <p className="text-xs font-bold text-gray-400 uppercase tracking-wide">SELECT MEALS</p>
                    <div className="grid grid-cols-2 gap-3">
                       {[
                          { id: 'Breakfast', icon: <Sun size={18} /> },
                          { id: 'Lunch', icon: <Utensils size={18} /> },
                          { id: 'Snacks', icon: <Coffee size={18} /> }, // Using Coffee for Snacks
                          { id: 'Dinner', icon: <Moon size={18} /> }
                       ].map((meal) => (
                          <button
                             key={meal.id}
                             onClick={() => toggleMeal(meal.id)}
                             className={`
                                flex items-center gap-3 p-3 rounded-xl border transition-all text-left
                                ${selectedMeals.includes(meal.id)
                                   ? 'bg-green-50 border-green-200 text-gray-900'
                                   : 'bg-white border-gray-100 text-gray-500 hover:border-gray-200'}
                             `}
                          >
                             <div className={`${selectedMeals.includes(meal.id) ? 'text-gray-800' : 'text-gray-400'}`}>
                                {meal.icon}
                             </div>
                             <span className="text-sm font-semibold flex-1">{meal.id}</span>
                             {selectedMeals.includes(meal.id) && (
                                <div className="w-2 h-2 rounded-full bg-gutzo-primary" />
                             )}
                          </button>
                       ))}
                    </div>
                 </div>

                 {/* Duration */}
                 <div className="space-y-3">
                    <p className="text-xs font-bold text-gray-400 uppercase tracking-wide">DURATION</p>
                    
                     <div className="flex flex-col gap-3">
                       {/* Card 1: Trial */}
                       <button
                          onClick={() => setDuration('Trial')}
                           style={{
                              borderWidth: isTrial ? '2px' : '1px',
                              borderColor: isTrial ? '#1BA672' : '#F3F4F6', // #F3F4F6 is gray-100
                              backgroundColor: isTrial ? '#F2FBF6' : 'white'
                           }}
                           className={`
                              relative flex items-center gap-4 p-4 rounded-2xl text-left transition-all
                              ${isTrial 
                                 ? 'shadow-[0_4px_12px_rgba(27,166,114,0.15)]' 
                                 : 'hover:border-gray-200'}
                           `}
                        >
                           <div 
                              style={{ 
                                 backgroundColor: isTrial ? '#E8F6F1' : '#F3F4F6', 
                                 color: isTrial ? '#1BA672' : '#6B7280' 
                              }}
                              className="w-12 h-12 rounded-full flex items-center justify-center shrink-0"
                           >
                              <Calendar size={24} strokeWidth={2} />
                           </div>
                          <div className="flex-1">
                             <div className="flex items-center justify-between pr-8">
                                <h4 className="text-base font-bold text-gray-900">Try for 3 days</h4>
                             </div>
                             <p className="text-xs text-gray-500 mt-1 font-medium leading-relaxed">Just try it. No pressure.</p>
                          </div>
                          {isTrial ? (
                             <div 
                                style={{
                                   position: 'absolute',
                                   top: '16px',
                                   right: '16px',
                                   width: '20px',
                                   height: '20px',
                                   backgroundColor: 'white',
                                   borderRadius: '50%',
                                   display: 'flex',
                                   alignItems: 'center',
                                   justifyContent: 'center',
                                   zIndex: 50
                                }}
                             >
                                <Check size={12} strokeWidth={3} color="#1BA672" />
                             </div>
                          ) : (
                             <div 
                                style={{
                                   position: 'absolute',
                                   top: '16px',
                                   right: '16px',
                                   width: '20px',
                                   height: '20px',
                                   border: '2px solid #E5E7EB',
                                   borderRadius: '50%',
                                   zIndex: 50
                                }}
                             />
                          )}
                       </button>

                       {/* Card 2: Routine (Mapped to '1 Week') */}
                       <button
                          onClick={() => setDuration('1 Week')}
                           style={{
                              borderWidth: isRoutine ? '2px' : '1px',
                              borderColor: isRoutine ? '#1BA672' : '#F3F4F6',
                              backgroundColor: isRoutine ? '#F2FBF6' : 'white'
                           }}
                           className={`
                              relative flex items-center gap-4 p-4 rounded-2xl text-left transition-all
                              ${isRoutine 
                                 ? 'shadow-[0_4px_12px_rgba(27,166,114,0.15)]' 
                                 : 'hover:border-gray-200'}
                           `}
                        >
                           <div 
                              style={{ 
                                 backgroundColor: isRoutine ? '#E8F6F1' : '#F3F4F6', 
                                 color: isRoutine ? '#1BA672' : '#6B7280' 
                              }}
                              className="w-12 h-12 rounded-full flex items-center justify-center shrink-0"
                           >
                              <Utensils size={24} strokeWidth={2} />
                           </div>
                          <div className="flex-1">
                             <div className="flex items-center justify-between pr-8">
                                <h4 className="text-base font-bold text-gray-900">Set a routine</h4>
                             </div>
                             <p className="text-xs text-gray-500 mt-1 font-medium leading-relaxed">Eat on days you choose.</p>
                          </div>
                          {isRoutine ? (
                             <div 
                                style={{
                                   position: 'absolute',
                                   top: '16px',
                                   right: '16px',
                                   width: '20px',
                                   height: '20px',
                                   backgroundColor: 'white',
                                   borderRadius: '50%',
                                   display: 'flex',
                                   alignItems: 'center',
                                   justifyContent: 'center',
                                   zIndex: 50
                                }}
                             >
                                <Check size={12} strokeWidth={3} color="#1BA672" />
                             </div>
                          ) : (
                             <div 
                                style={{
                                   position: 'absolute',
                                   top: '16px',
                                   right: '16px',
                                   width: '20px',
                                   height: '20px',
                                   border: '2px solid #E5E7EB',
                                   borderRadius: '50%',
                                   zIndex: 50
                                }}
                             />
                          )}
                       </button>

                       {/* Banner */}
                       {/* Insight Strip */}
                       <div 
                           style={{ marginTop: '-12px' }}
                           className="flex items-center gap-2.5 p-2 px-3 rounded-xl bg-[#F7FAF8]"
                       >
                          <Lightbulb size={16} className="text-gray-400 shrink-0" />
                          <p 
                              style={{ fontSize: '12px' }}
                              className="text-gray-500 font-medium leading-relaxed"
                           >
                              Most Gutzo users stick to a routine
                           </p>
                       </div>
                    </div>

                     {/* Dynamic Delivery Details */}
                     <div className="mt-5">
                        {(() => {
                           // Define configuration based on Plan Duration
                           let headerText = "Delivery days";
                           let helperText = "";
                           let isLocked = false;
                           let activeDays: number[] = [];
                           let interactionHandler: ((d: number) => void) | undefined = undefined;

                           // Logic per plan
                           if (isTrial) {
                              headerText = "Delivery days";
                              helperText = "We picked the next 3 delivery days for you."; 
                              isLocked = true;
                              // Trial is fixed 3 days starting tomorrow (Tuesday) -> Tue, Wed, Thu (Days 2,3,4)
                              activeDays = [2, 3, 4]; 
                           } else { // Routine (1 Week / Monthly)
                              headerText = "Choose delivery days";
                              helperText = "Repeats every week. You can change anytime.";
                              isLocked = false; // UNLOCKED for Routine
                              activeDays = weekDays;
                              interactionHandler = (d) => toggleWeekDay(d);
                           }

                           return (
                              <div className="space-y-3">
                                 {/* Header Row */}
                                 <div className="flex justify-between items-end">
                                    <h4 className="text-base font-bold text-gray-900">{headerText}</h4>
                                 </div>

                                 {/* Universal Day Grid Component */}
                                 <div className="flex gap-3 flex-wrap">
                                    {['Mon','Tue','Wed','Thu','Fri','Sat','Sun'].map((dayLabel, idx) => {
                                       const dayNum = idx === 6 ? 0 : idx + 1;
                                       
                                       const isSunday = dayNum === 0; 
                                       const isActive = activeDays.includes(dayNum);

                                       let className = "w-11 h-11 rounded-full text-sm font-bold border transition-all flex items-center justify-center";
                                       let forcedStyle: React.CSSProperties = {};
                                       
                                       if (isActive) {
                                          className += " shadow-md";
                                          // Force Green styling inline to prevent white-on-white text issue
                                          forcedStyle = { backgroundColor: '#1BA672', color: '#ffffff', borderColor: '#1BA672' };
                                       } else if (isSunday) {
                                          className += " bg-gray-50 text-gray-300 border-gray-100 line-through decoration-gray-300 decoration-1"; 
                                       } else {
                                          // INACTIVE STATE HANDLING
                                          if (isLocked) {
                                             // TRIAL MODE: Non-selected days should look "skipped/ghosted" (Gray)
                                             className += " bg-white border-gray-200 text-gray-300";
                                          } else {
                                             // ROUTINE MODE: Non-selected days should look "selectable" (Black/White)
                                             className += " bg-white border-gray-200 hover:border-gray-300";
                                             forcedStyle = { color: '#000000' };
                                          }
                                       }
                                       
                                       if (isLocked || isSunday) className += " cursor-default";
                                       else className += " cursor-pointer";

                                       return (
                                          <button
                                             key={dayLabel}
                                             disabled={isSunday || isLocked}
                                             onClick={() => interactionHandler && interactionHandler(dayNum)}
                                             className={className}
                                             style={forcedStyle}
                                          >
                                             {dayLabel}
                                          </button>
                                       );
                                    })}
                                 </div>

                                 {/* Helper Text */}
                                 <p className="text-sm text-gray-500 font-medium">
                                    {helperText}
                                 </p>
                              </div>
                           );
                        })()}
                     </div>
                 </div>



              </div>
           </div>
          </div>
           {/* Sticky Bottom CTA */}
           <div className="flex-shrink-0 p-6 bg-white border-t border-gray-100 shadow-[0_-4px_20px_rgba(0,0,0,0.05)] z-[1003]">
              <button className="w-full bg-gutzo-primary hover:bg-gutzo-primary-hover text-white h-[42px] rounded-md text-sm font-medium flex items-center justify-center gap-2 transition-colors">
                 Continue <ArrowRight className="h-4 w-4" />
              </button>
               <div className={`flex justify-center pt-3 transition-opacity duration-200 ${isRoutine ? 'opacity-100' : 'opacity-0'}`}>
                  <p className="text-gray-400 flex items-center gap-1" style={{ fontSize: '11px' }}>
                     Cancel anytime.
                  </p>
               </div>
           </div>
        </div>
        )}
       </div>
       </SheetContent>
    </Sheet>
  );
};

export default MealPlanBottomSheet;
