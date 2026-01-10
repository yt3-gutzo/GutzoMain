import { useEffect, useRef, useState } from 'react';
import { getGoogleMapsApiKey } from '../utils/googleMapsConfig';

const GOOGLE_MAPS_API_KEY = getGoogleMapsApiKey();
const BIKE_ICON = "https://cdn-icons-png.flaticon.com/512/3082/3082383.png"; // Scooter Icon

interface Coordinates {
  lat: number;
  lng: number;
}

interface OrderTrackingMapProps {
  storeLocation: Coordinates;
  userLocation: Coordinates;
  driverLocation?: Coordinates;
  status: 'placed' | 'preparing' | 'ready' | 'picked_up' | 'on_way' | 'delivered' | 'arrived_at_drop' | 'reached_location' | 'driver_assigned' | 'searching_rider';
  fitBoundsPadding?: number; // Not used as much with DirectionsRenderer
  onDurationUpdate?: (duration: string) => void;
}

export function OrderTrackingMap({ 
  storeLocation, 
  userLocation, 
  driverLocation,
  status,
  fitBoundsPadding = 50,
  onDurationUpdate
}: OrderTrackingMapProps) {
  const mapRef = useRef<HTMLDivElement>(null);
  const mapInstanceRef = useRef<google.maps.Map | null>(null);
  const driverMarkerRef = useRef<google.maps.Marker | null>(null);
  const directionsRendererRef = useRef<google.maps.DirectionsRenderer | null>(null);
  const directionsServiceRef = useRef<google.maps.DirectionsService | null>(null);
  const [isMapLoaded, setIsMapLoaded] = useState(false);
  
  // Internal driver location state for animation
  const [driverPos, setDriverPos] = useState<Coordinates>(storeLocation);
  const animationFrameRef = useRef<number>();

  useEffect(() => {
    // Load Google Maps Script if not already loaded
    if (!window.google?.maps) {
      const script = document.createElement('script');
      script.src = `https://maps.googleapis.com/maps/api/js?key=${GOOGLE_MAPS_API_KEY}&libraries=places,geometry`;
      script.async = true;
      script.defer = true;
      script.onload = () => setIsMapLoaded(true);
      document.head.appendChild(script);
    } else {
      setIsMapLoaded(true);
    }
    
    return () => {
       if (animationFrameRef.current) cancelAnimationFrame(animationFrameRef.current);
    };
  }, []);

  useEffect(() => {
    if (isMapLoaded && mapRef.current && !mapInstanceRef.current) {
      // Initialize Map
      const map = new google.maps.Map(mapRef.current, {
        center: storeLocation,
        zoom: 13,
        disableDefaultUI: true,
        styles: [
          {
            featureType: "poi",
            elementType: "labels",
            stylers: [{ visibility: "off" }],
          },
        ],
      });
      mapInstanceRef.current = map;

      // Initialize Directions Service and Renderer
      directionsServiceRef.current = new google.maps.DirectionsService();
      directionsRendererRef.current = new google.maps.DirectionsRenderer({
          map: map,
          suppressMarkers: true, // We'll handle markers ourselves
          polylineOptions: {
              strokeColor: "#222",
              strokeOpacity: 0.8,
              strokeWeight: 4,
          }
      });

      // Add Markers
      // Store Marker
      new google.maps.Marker({
        position: storeLocation,
        map,
        icon: {
            url: "https://maps.google.com/mapfiles/ms/icons/restaurant.png",
            scaledSize: new google.maps.Size(32, 32)
        },
        title: "Kitchen"
      });

      // User Marker
      new google.maps.Marker({
        position: userLocation,
        map,
        icon: {
             url: "https://maps.google.com/mapfiles/ms/icons/homegardenbusiness.png",
             scaledSize: new google.maps.Size(32, 32)
        },
        title: "Accura"
      });
      
      // Driver Marker
      driverMarkerRef.current = new google.maps.Marker({
          position: storeLocation,
          map,
          icon: {
              path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
              scale: 5,
              fillColor: "#000",
              fillOpacity: 1,
              strokeWeight: 2,
              rotation: 0,
          },
          title: "Driver"
      });

      // Fit bounds to show both points
      const bounds = new google.maps.LatLngBounds();
      bounds.extend(storeLocation);
      bounds.extend(userLocation);
      map.fitBounds(bounds, fitBoundsPadding); // Dynamic padding
    }
  }, [isMapLoaded, storeLocation, userLocation]);

  // Update Driver Marker Position
  useEffect(() => {
    if (!mapInstanceRef.current || !driverMarkerRef.current || !driverLocation) return;

    const newPos = driverLocation;
    driverMarkerRef.current.setPosition(newPos);

    // Optional: Calculate heading from previous position if we tracked it, 
    // but for now just pointing it? Or maybe leave rotation alone.
    // Shadowfax might not provide heading.
    
    // If we have a previous position, we could animate/slide to new one, 
    // but direct setPosition is fine for v1.
  }, [driverLocation]);

  // Handle status-based visibility or simulation (Optional: Removed pure simulation to rely on real data)
  useEffect(() => {
      // If no driver location yet but status says on_way, maybe show at store?
     if (!driverLocation && driverMarkerRef.current) {
         driverMarkerRef.current.setPosition(storeLocation);
     }
  }, [status, driverLocation, storeLocation]);

  // 3. Routing Logic (Directions API)
  useEffect(() => {
      if (!isMapLoaded || !directionsServiceRef.current || !directionsRendererRef.current) return;

      // Determine Route based on Status
      // Stage 1: Driver -> Restaurant (driver_assigned, searching, allotted)
      // Stage 2: Driver -> Customer (picked_up, on_way, arrived_at_drop, reached_location?? No reached is stage 1 end)
      
      let origin: Coordinates | null = null;
      let destination: Coordinates | null = null;
      
      const isPickUpPhase = ['driver_assigned', 'allotted', 'reached_location'].includes(status);
      const isDeliveryPhase = ['picked_up', 'on_way', 'arrived_at_drop', 'out_for_delivery'].includes(status);

      // Default to stored driver pos or store location
      const startPoint = driverLocation || storeLocation;

      if (isPickUpPhase) {
          // Path: Driver -> Restaurant
          origin = startPoint;
          destination = storeLocation;
      } else if (isDeliveryPhase) {
          // Path: Driver -> Customer (BUT if picked up, origin is driver, dest is user)
          // Wait, if driver moves, the path shrinks. That's good.
          origin = startPoint;
          destination = userLocation;
      } else {
          // Default: Restaurant -> User (Static path if no driver yet or completed)
          origin = storeLocation;
          destination = userLocation;
      }

      if (origin && destination) {
          directionsServiceRef.current.route({
              origin,
              destination,
              travelMode: google.maps.TravelMode.DRIVING
          }, (result, status) => {
              if (status === 'OK' && result) {
                  directionsRendererRef.current?.setDirections(result);
                  // Extract Duration
                  const leg = result.routes[0]?.legs[0];
                  if (leg && leg.duration && onDurationUpdate) {
                      onDurationUpdate(leg.duration.text);
                  }
              }
          });
      }

  }, [isMapLoaded, status, driverLocation, storeLocation, userLocation, onDurationUpdate]);

  return (
    <div style={{ width: '100%', height: '100%', position: 'relative' }}>
      <div ref={mapRef} style={{ width: '100%', height: '100%' }} />
    </div>
  );
}
