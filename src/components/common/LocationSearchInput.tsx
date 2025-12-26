import { Search, Loader2 } from "lucide-react";
import { useState, useEffect, useRef } from "react";
import { getGoogleMapsApiKey } from "../../utils/googleMapsConfig";

// Global script loading state
let isScriptLoading = false;
let isScriptLoaded = false;
let scriptLoadPromise: Promise<void> | null = null;

export function LocationSearchInput({ 
  onLocationSelect, 
  className = "",
  placeholder = "Search for area, street name..."
}: {
  onLocationSelect: (location: { lat: number; lng: number; address: string }) => void;
  className?: string;
  placeholder?: string;
}) {
  const inputRef = useRef<HTMLInputElement>(null);
  const autocompleteRef = useRef<google.maps.places.Autocomplete | null>(null);
  const [isLoaded, setIsLoaded] = useState(false);

  useEffect(() => {
    const loadGoogleMaps = async () => {
      if (window.google?.maps?.places) {
        setIsLoaded(true);
        return;
      }

      const apiKey = getGoogleMapsApiKey();
      if (!apiKey) return;

      const existingScript = document.querySelector(`script[src*="maps.googleapis.com/maps/api/js"]`);
      if (existingScript) {
        if ((window as any).google?.maps) {
           setIsLoaded(true);
        } else {
           const interval = setInterval(() => {
             if ((window as any).google?.maps) {
               clearInterval(interval);
               setIsLoaded(true);
             }
           }, 200);
        }
        return;
      }

      if (isScriptLoaded) {
          setIsLoaded(true);
          return;
      }

      if (isScriptLoading && scriptLoadPromise) {
        await scriptLoadPromise;
        setIsLoaded(true);
        return;
      }

      isScriptLoading = true;
      scriptLoadPromise = new Promise((resolve, reject) => {
        const script = document.createElement('script');
        const callbackName = `initGoogleMapsSearch_${Math.random().toString(36).substr(2, 9)}`;
        script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}&libraries=places&loading=async&callback=${callbackName}`;
        script.async = true;
        script.defer = true;

        (window as any)[callbackName] = () => {
          isScriptLoaded = true;
          isScriptLoading = false;
          setIsLoaded(true);
          delete (window as any)[callbackName];
          resolve();
        };

        script.onerror = (err) => {
          isScriptLoading = false;
          reject(err);
        };

        document.head.appendChild(script);
      });

      try {
        await scriptLoadPromise;
      } catch (e) {
        console.error(e);
      }
    };

    loadGoogleMaps();
  }, []);

  useEffect(() => {
    if (isLoaded && inputRef.current && !autocompleteRef.current && window.google?.maps?.places) {
      try {
        const autocomplete = new google.maps.places.Autocomplete(inputRef.current, {
          types: ['geocode', 'establishment'],
          componentRestrictions: { country: 'IN' },
          fields: ['formatted_address', 'geometry', 'name']
        });

        autocomplete.addListener('place_changed', () => {
          const place = autocomplete.getPlace();
          if (place.geometry?.location) {
            const lat = place.geometry.location.lat();
            const lng = place.geometry.location.lng();
            const address = place.formatted_address || place.name || '';
            
            onLocationSelect({ lat, lng, address });
          }
        });

        autocompleteRef.current = autocomplete;
      } catch (e) {
        console.error('Failed to init autocomplete', e);
      }
    }
  }, [isLoaded, onLocationSelect]);

  return (
    <div className={`relative group ${className}`}>
      <div className="absolute left-4 top-1/2 -translate-y-1/2 pointer-events-none transition-colors duration-200">
        {isLoaded ? (
          <Search className="h-5 w-5 text-gutzo-primary" />
        ) : (
          <Loader2 className="h-4 w-4 text-gray-400 animate-spin" />
        )}
      </div>
      <input
        ref={inputRef}
        placeholder={placeholder}
        disabled={!isLoaded}
        className="w-full pl-16 pr-4 h-16 bg-white border border-gray-200 rounded-2xl outline-none focus:border-gutzo-primary focus:ring-1 focus:ring-gutzo-primary transition-all duration-200 font-medium text-lg text-gray-700 placeholder:text-gray-400 shadow-sm hover:border-gray-300 disabled:opacity-60 disabled:cursor-not-allowed"
      />
    </div>
  );
}
