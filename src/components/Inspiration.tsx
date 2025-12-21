import React, { useEffect, useState } from "react";
import { supabase } from "../utils/supabase/client";

interface InspirationOption {
  label: string;
  img: string | null;
}

interface InspirationProps {
  onOptionClick?: (label: string) => void;
  loading?: boolean;
}

export const Inspiration: React.FC<InspirationProps> = ({ onOptionClick, loading: parentLoading = false }) => {
  const [inspirationOptions, setInspirationOptions] = useState<InspirationOption[]>([]);
  const [loading, setLoading] = useState(true);
  const [errorState, setErrorState] = useState<any>(null);

  useEffect(() => {
    const fetchCategories = async () => {
      try {
        const { data, error } = await supabase
          .from('categories')
          .select('name, image_url')
          .eq('is_active', true)
          .order('sort_order', { ascending: true });

        if (error) {
          console.error('Error fetching categories:', error);
          setErrorState(error);
          return;
        }

        if (data) {
          console.log('Fetched inspiration categories:', data);
          const mappedData = data.map((item) => ({
            label: item.name,
            img: item.image_url,
          }));
          setInspirationOptions(mappedData);
          setErrorState(null); // Clear error if success
        }
      } catch (err) {
        console.error('Unexpected error fetching categories:', err);
        setErrorState(err);
      } finally {
        setLoading(false);
      }
    };

    fetchCategories();
  }, []);

  const isLoading = parentLoading || loading;
  return (
  <section className="w-full bg-[#fafafa] pt-4 pb-8 md:pt-6 md:pb-12 lg:pt-8 lg:pb-16">
      <div className="w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col">
        <h2
          className="text-left font-medium tracking-tight w-full mb-4 text-[20px] lg:text-[30px]"
          style={{ fontFamily: 'Poppins', letterSpacing: '-0.01em', fontWeight: 500, color: '#111' }}
        >
          Start Your Gutzo Journey Here
        </h2>
        <div className="mt-2" />
        {/* Error/Empty State Debugging */}
        {!isLoading && (
          <>
             {errorState && (
              <div className="p-4 bg-red-50 text-red-600 rounded-lg text-sm mb-4">
                <strong>Supabase Error:</strong> {JSON.stringify(errorState)}
              </div>
             )}
             {!errorState && inspirationOptions.length === 0 && (
              <div className="p-4 bg-yellow-50 text-yellow-700 rounded-lg text-sm mb-4">
                <strong>Data is empty.</strong> The query returned 0 rows.
              </div>
             )}
          </>
        )}
        {/* Mobile: double-lined horizontal scroll (both rows scroll together) */}
        {isLoading ? (
           <div className="sm:hidden overflow-x-auto scrollbar-hide pb-2 -mr-4" style={{ width: 'calc(100% + 16px)' }}>
             <div className="flex flex-col min-w-max">
               <div className="flex gap-2 mb-2">
                 {[...Array(9)].map((_, i) => (
                    <div key={i} className="flex flex-col items-center flex-shrink-0 min-w-[90px] animate-pulse">
                      <div className="w-[80px] h-[80px] rounded-full bg-gray-200 mb-1"></div>
                      <div className="w-16 h-3 rounded bg-gray-200 mt-1"></div>
                    </div>
                 ))}
               </div>
               <div className="flex gap-2">
                 {[...Array(9)].map((_, i) => (
                    <div key={i} className="flex flex-col items-center flex-shrink-0 min-w-[90px] animate-pulse">
                      <div className="w-[80px] h-[80px] rounded-full bg-gray-200 mb-1"></div>
                      <div className="w-16 h-3 rounded bg-gray-200 mt-1"></div>
                    </div>
                 ))}
               </div>
             </div>
           </div>
        ) : (
        <div className="sm:hidden overflow-x-auto scrollbar-hide pb-2 -mr-4" style={{ width: 'calc(100% + 16px)' }}>
          <div className="flex flex-col min-w-max">
            <div className="flex gap-2 mb-2">
              {inspirationOptions.slice(0, Math.ceil(inspirationOptions.length / 2)).map((option) => (
                <button
                  key={option.label}
                  className="flex flex-col items-center group focus:outline-none flex-shrink-0 min-w-[90px]"
                  onClick={() => onOptionClick?.(option.label)}
                  style={{ maxWidth: '100%' }}
                >
                  <span
                    className="block rounded-full flex items-center justify-center overflow-hidden mb-0.5 transition-transform group-hover:scale-110"
                    style={{ width: '80px', height: '80px' }}
                  >
                    {option.img ? (
                      <img
                        src={option.img}
                        alt={option.label}
                        className="w-full h-full object-cover rounded-full"
                        style={{ aspectRatio: 1, display: 'block' }}
                        loading="lazy"
                      />
                    ) : (
                      <div className="w-full h-full bg-gray-300 rounded-full flex items-center justify-center text-xs text-gray-500">Img</div>
                    )}
                  </span>
                  <span
                      className="text-xs text-gray-500 transition-colors mt-1 text-center truncate w-full"
                    style={{ fontFamily: 'Poppins', fontWeight: 400, fontSize: '0.95rem' }}
                  >
                    {option.label}
                  </span>
                </button>
              ))}
            </div>
            <div className="flex gap-2">
              {inspirationOptions.slice(Math.ceil(inspirationOptions.length / 2)).map((option) => (
                <button
                  key={option.label}
                  className="flex flex-col items-center group focus:outline-none flex-shrink-0 min-w-[90px]"
                  onClick={() => onOptionClick?.(option.label)}
                  style={{ maxWidth: '100%' }}
                >
                  <span
                    className="block rounded-full flex items-center justify-center overflow-hidden mb-1 transition-transform group-hover:scale-110"
                    style={{ width: '80px', height: '80px' }}
                  >
                    {option.img ? (
                      <img
                        src={option.img}
                        alt={option.label}
                        className="w-full h-full object-cover rounded-full"
                        style={{ aspectRatio: 1, display: 'block' }}
                        loading="lazy"
                      />
                    ) : (
                      <div className="w-full h-full bg-gray-300 rounded-full flex items-center justify-center text-xs text-gray-500">Img</div>
                    )}
                  </span>
                  <span
                    className="text-xs text-gray-500 group-hover:text-gutzo-primary transition-colors mt-1 text-center truncate w-full"
                    style={{ fontFamily: 'Poppins', fontWeight: 400, fontSize: '1rem' }}
                  >
                    {option.label}
                  </span>
                </button>
              ))}
            </div>
          </div>
        </div>
        )}

        {/* Tablet/Desktop: horizontal scrollable row */}
        {isLoading ? (
             <div className="hidden sm:flex w-full overflow-x-auto scrollbar-hide items-end gap-3 md:gap-4 lg:gap-6 pb-2 animate-pulse">
               {[...Array(10)].map((_, i) => (
                  <div key={i} className="flex flex-col items-center flex-shrink-0 min-w-[90px]">
                    <div className="rounded-full bg-gray-200 mb-0.5" style={{ width: 'clamp(70px, 10vw, 140px)', height: 'clamp(70px, 10vw, 140px)' }}></div>
                    <div className="w-20 h-4 rounded bg-gray-200 mt-1"></div>
                  </div>
               ))}
             </div>
        ) : (
        <div className="hidden sm:flex w-full overflow-x-auto scrollbar-hide items-end gap-3 md:gap-4 lg:gap-6 pb-2">
          {inspirationOptions.map((option) => (
            <button
              key={option.label}
              className="flex flex-col items-center group gutzo-card-hover focus:outline-none flex-shrink-0 min-w-[90px]"
              onClick={() => onOptionClick?.(option.label)}
              style={{ maxWidth: '100%' }}
            >
              <span
                className="block rounded-full flex items-center justify-center overflow-hidden mb-0.5 transition-transform group-hover:scale-110"
                style={{
                  width: 'clamp(70px, 10vw, 140px)',
                  height: 'clamp(70px, 10vw, 140px)',
                  background: 'none',
                  border: 'none',
                  padding: 0,
                  boxShadow: 'none'
                }}
              >
                <img
                  src={option.img}
                  alt={option.label}
                  className="w-full h-full object-cover rounded-full"
                  style={{ aspectRatio: 1, display: 'block' }}
                  loading="lazy"
                />
              </span>
              <span className="text-lg lg:text-xl font-medium text-gray-500 transition-colors mt-1 text-center truncate w-full" style={{ fontFamily: 'Poppins', fontWeight: 400 }}>{option.label}</span>
            </button>
          ))}
        </div>
        )}
      </div>
    </section>
  );
};
