// Shared content for meal plan next steps panel
import type { MealPlan } from "./components/WeeklyMealPlansSection";
const NextStepsContent = ({ plan }: { plan: MealPlan }) => (
  <div style={{ fontFamily: 'Poppins, sans-serif', color: '#222' }}>
    <h1 style={{ fontSize: 24, fontWeight: 700, marginBottom: 4 }}>{plan?.title} Plan</h1>
    <div style={{ fontSize: 16, fontWeight: 500, color: '#555', marginBottom: 2 }}>by {plan?.vendor}</div>
    <div style={{ fontSize: 16, color: '#666', marginBottom: 18 }}>Eat well without deciding every day</div>
    <div style={{ background: '#f7f7fa', borderRadius: 16, padding: 16, marginBottom: 16 }}>
      <div style={{ fontSize: 22, fontWeight: 700, marginBottom: 4 }}>₹{plan?.price?.replace('/day','').replace('/week','')} / {plan?.price?.includes('week') ? 'week' : 'day'}</div>
      <div style={{ fontSize: 15, color: '#444', marginBottom: 8 }}>{plan?.schedule} · Free delivery</div>
      <div style={{ fontWeight: 600, marginBottom: 8 }}>Select meals</div>
      <div style={{ display: 'flex', gap: 12, marginBottom: 8 }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: 4, background: '#e6f4ea', borderRadius: 8, padding: '4px 12px' }}><span style={{ color: '#1BA672', fontWeight: 700 }}>✓</span> Lunch</div>
        <div style={{ display: 'flex', alignItems: 'center', gap: 4, background: '#e6f4ea', borderRadius: 8, padding: '4px 12px' }}><span style={{ color: '#1BA672', fontWeight: 700 }}>✓</span> Dinner</div>
        <div style={{ display: 'flex', alignItems: 'center', gap: 4, background: '#f0f0f0', borderRadius: 8, padding: '4px 12px', color: '#aaa' }}>□ Breakfast</div>
      </div>
      <div style={{ fontWeight: 600, marginBottom: 8 }}>Select days</div>
      <div style={{ display: 'flex', gap: 8, marginBottom: 8 }}>
        {['Mon','Tue','Wed','Thu','Fri','Sat'].map(day => (
          <div key={day} style={{ background: '#fff', borderRadius: 8, padding: '4px 12px', border: '1px solid #eee', fontWeight: 500 }}>{day}</div>
        ))}
      </div>
      <div style={{ color: '#888', fontSize: 14, marginBottom: 8 }}>○ Sunday – vendor closed</div>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 8 }}>
        <div style={{ fontWeight: 600 }}>Start from</div>
        <div style={{ fontWeight: 500, color: '#222' }}>Tomorrow &gt;</div>
      </div>
      <div style={{ color: '#1BA672', fontWeight: 500, marginBottom: 8, cursor: 'pointer' }}>View sample weekly menu &gt;</div>
    </div>
    <div style={{ background: '#f7f7fa', borderRadius: 16, padding: 16, marginBottom: 16 }}>
      <div style={{ fontWeight: 600, marginBottom: 8 }}>What this plan includes</div>
      <div style={{ display: 'flex', flexWrap: 'wrap', gap: 12 }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}><span style={{ color: '#1BA672', fontWeight: 700 }}>✓</span> Fresh daily meals</div>
        <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}><span style={{ color: '#1BA672', fontWeight: 700 }}>✓</span> Free delivery</div>
        <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}><span style={{ color: '#1BA672', fontWeight: 700 }}>✓</span> Skip or pause anytime</div>
        <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}><span style={{ color: '#1BA672', fontWeight: 700 }}>✓</span> No lock-in & cancel anytime</div>
      </div>
    </div>
    <div style={{ background: '#f7f7fa', borderRadius: 16, padding: 16, marginBottom: 16, fontWeight: 500, color: '#222', cursor: 'pointer' }}>
      Will I get the same food every day? &gt;
    </div>
    <button style={{ width: '100%', background: '#1BA672', color: '#fff', fontWeight: 600, fontSize: 20, borderRadius: 12, padding: '16px 0', border: 'none', marginTop: 8, marginBottom: 8, cursor: 'pointer' }}>
      Continue &rarr;
    </button>
  </div>
);
import { useState, useRef, useEffect } from "react";
// Responsive hook for media queries
function useMediaQuery(query: string) {
  const [matches, setMatches] = useState(() => window.matchMedia(query).matches);
  useEffect(() => {
    const media = window.matchMedia(query);
    if (media.matches !== matches) setMatches(media.matches);
    const listener = () => setMatches(media.matches);
    media.addEventListener('change', listener);
    return () => media.removeEventListener('change', listener);
  }, [query, matches]);
  return matches;
}
import { Header } from "./components/Header";
import { CategoryBar } from "./components/CategoryBar";
import { Inspiration } from "./components/Inspiration";
import WeeklyMealPlansSection from "./components/WeeklyMealPlansSection";
import { VendorCard } from "./components/VendorCard";
import { ResponsiveProductDetails } from "./components/ResponsiveProductDetailsFixed";
import { VendorSkeleton } from "./components/VendorSkeleton";
import { VendorCartStrip } from "./components/VendorCartStrip";
import { Footer } from "./components/Footer";
import { WhatsAppSupport } from "./components/WhatsAppSupport";
import { LocationGate } from "./components/LocationGate";
import { LoginPanel } from "./components/auth/LoginPanel";
import { ProfilePanel } from "./components/auth/ProfilePanel";
import { PaymentSuccessModal } from "./components/PaymentSuccessModal";
import { LocationProvider, useLocation } from "./contexts/LocationContext";
import { CartProvider } from "./contexts/CartContext";
import { AuthProvider, useAuth } from "./contexts/AuthContext";
import { RouterProvider, useRouter } from "./components/Router";
import { CartPanel } from "./components/CartPanel";
import { InstantOrderPanel } from "./components/InstantOrderPanel";
import { TermsPage } from "./pages/TermsPage";
import { RefundPage } from "./pages/RefundPage";
import { PrivacyPage } from "./pages/PrivacyPage";
import { ContactPage } from "./pages/ContactPage";
import { AboutPage } from "./pages/AboutPage";
import PaymentStatusPage from "./pages/PaymentStatusPage";
import PhonePeComingSoon from "./pages/PaytmComingSoon";
import { Toaster } from "./components/ui/sonner";
import { Loader2, MapPin, Plus, X } from "lucide-react";
import { Vendor } from "./types/index";
import { useVendors } from "./hooks/useVendors";
import { filterVendors, extractCategoriesFromVendors } from "./utils/vendors";
import { useCart } from "./contexts/CartContext";
import { AddressModal } from "./components/auth/AddressModal";
import { AddressListPanel } from "./components/AddressListPanel";
import { Button } from "./components/ui/button";
import AddToHomeScreenPrompt from "./components/AddToHomeScreenPrompt";
import { BrowserRouter } from 'react-router-dom';
import VendorDetailsPage from './components/VendorDetailsPage';
import CartStrip from "./components/CartStrip";

function AppContent() {
    // Use responsive hook for desktop detection
    const isDesktop = useMediaQuery('(min-width: 900px)');

    // Next steps state for meal plan
    const [selectedMealPlan, setSelectedMealPlan] = useState<MealPlan | null>(null);

    // Prevent background scroll when panel is open
    useEffect(() => {
      if (selectedMealPlan) {
        document.body.style.overflow = 'hidden';
      } else {
        document.body.style.overflow = '';
      }
      return () => {
        document.body.style.overflow = '';
      };
    }, [selectedMealPlan]);
  const { vendors, loading, loadVendorProducts } = useVendors();
  const { isInCoimbatore, isLoading: locationLoading } = useLocation();
  const { currentRoute } = useRouter();
  const { isAuthenticated, isLoading: authLoading, user, login, logout } = useAuth();
  const [selectedCategory, setSelectedCategory] = useState("All");
  const [searchQuery, setSearchQuery] = useState("");
  const [showLocationGate, setShowLocationGate] = useState(false);
  const [showLoginPanel, setShowLoginPanel] = useState(false);
  const [showProfilePanel, setShowProfilePanel] = useState(false);
  const [profilePanelContent, setProfilePanelContent] = useState<'profile' | 'orders' | 'address'>('profile');
  const [profileOrderData, setProfileOrderData] = useState<any>(null);
  const [showCartPanel, setShowCartPanel] = useState(false);
  const [showCheckoutPanel, setShowCheckoutPanel] = useState(false);
  const [checkoutData, setCheckoutData] = useState<any>(null);
  const [showPaymentSuccess, setShowPaymentSuccess] = useState(false);
  const [paymentSuccessData, setPaymentSuccessData] = useState<{
    paymentDetails: {
      paymentId: string;
      subscriptionId: string;
      method: string;
      amount: number;
      date: string;
    };
    orderSummary: {
      items: number;
      vendor: string;
      orderType: string;
      quantity: string;
      estimatedDelivery: string;
    };
  } | null>(null);
  const [showAddressModal, setShowAddressModal] = useState(false);
  const [showAddressPanel, setShowAddressPanel] = useState(false);
  const [returnToCheckout, setReturnToCheckout] = useState(false);
  const listingsRef = useRef<HTMLDivElement>(null);
  const filterRef = useRef<HTMLDivElement>(null);
  const { navigate } = useRouter();
  const { clearCart } = useCart();
  const [deferredPrompt, setDeferredPrompt] = useState<any>(null);
  // Next steps state for meal plan
  // (already declared above, remove duplicate)

  // Prevent background scroll when panel is open
  useEffect(() => {
    if (selectedMealPlan) {
      document.body.style.overflow = 'hidden';
    } else {
      document.body.style.overflow = '';
    }
    return () => {
      document.body.style.overflow = '';
    };
  }, [selectedMealPlan]);

  // Right panel and bottom sheet components (reuse from VendorDetailsPage)
  const RightPanelNextSteps = ({ plan, onClose }: { plan: MealPlan, onClose: () => void }) => (
    <div style={{
      position: 'fixed',
      top: 0,
      right: 0,
      height: '100%',
      width: '95%',
      maxWidth: '600px',
      backgroundColor: 'white',
      boxShadow: '-10px 0 40px rgba(0, 0, 0, 0.2)',
      zIndex: 50,
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'stretch',
      overflowY: 'auto',
    }}>
      <button
        onClick={onClose}
        style={{
          position: 'absolute',
          top: '1.5rem',
          right: '1.5rem',
          zIndex: 10,
          background: 'none',
          border: 'none',
          padding: 0,
          cursor: 'pointer',
        }}
        aria-label="Close panel"
      >
        <X className="h-6 w-6 text-gray-500" />
      </button>
      <div style={{ padding: '2rem', paddingTop: '5rem', width: '100%' }}>
        <NextStepsContent plan={plan} />
      </div>
    </div>
  );

  const BottomSheetNextSteps = ({ plan, onClose }: { plan: MealPlan, onClose: () => void }) => (
    <div style={{
      position: 'fixed',
      left: 0,
      bottom: 0,
      width: '100vw',
      background: '#fff',
      boxShadow: '0 -2px 8px rgba(0,0,0,0.08)',
      zIndex: 1000,
      padding: 20,
      borderTopLeftRadius: 16,
      borderTopRightRadius: 16,
      minHeight: '60vh',
    }}>
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 8 }}>
        <h1 style={{ fontSize: 24, fontWeight: 700, margin: 0, fontFamily: 'Poppins, sans-serif', color: '#222' }}>{plan?.title} Plan</h1>
        <button
          onClick={onClose}
          style={{
            background: 'none',
            border: 'none',
            padding: 0,
            cursor: 'pointer',
            marginLeft: 12,
          }}
          aria-label="Close panel"
        >
          <X className="h-6 w-6 text-gray-500" />
        </button>
      </div>
      <div style={{ marginTop: 0 }}>
        {/* Render rest of NextStepsContent except title */}
        <div style={{ fontFamily: 'Poppins, sans-serif', color: '#222' }}>
          <div style={{ fontSize: 16, fontWeight: 500, color: '#555', marginBottom: 2 }}>by {plan?.vendor}</div>
          <div style={{ fontSize: 16, color: '#666', marginBottom: 18 }}>Eat well without deciding every day</div>
          <div style={{ background: '#f7f7fa', borderRadius: 16, padding: 16, marginBottom: 16 }}>
            <div style={{ fontSize: 22, fontWeight: 700, marginBottom: 4 }}>₹{plan?.price?.replace('/day','').replace('/week','')} / {plan?.price?.includes('week') ? 'week' : 'day'}</div>
            <div style={{ fontSize: 15, color: '#444', marginBottom: 8 }}>{plan?.schedule} · Free delivery</div>
            <div style={{ fontWeight: 600, marginBottom: 8 }}>Select meals</div>
            <div style={{ display: 'flex', gap: 12, marginBottom: 8 }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: 4, background: '#e6f4ea', borderRadius: 8, padding: '4px 12px' }}><span style={{ color: '#1BA672', fontWeight: 700 }}>✓</span> Lunch</div>
              <div style={{ display: 'flex', alignItems: 'center', gap: 4, background: '#e6f4ea', borderRadius: 8, padding: '4px 12px' }}><span style={{ color: '#1BA672', fontWeight: 700 }}>✓</span> Dinner</div>
              <div style={{ display: 'flex', alignItems: 'center', gap: 4, background: '#f0f0f0', borderRadius: 8, padding: '4px 12px', color: '#aaa' }}>□ Breakfast</div>
            </div>
            <div style={{ fontWeight: 600, marginBottom: 8 }}>Select days</div>
            <div style={{ display: 'flex', gap: 8, marginBottom: 8 }}>
              {['Mon','Tue','Wed','Thu','Fri','Sat'].map(day => (
                <div key={day} style={{ background: '#fff', borderRadius: 8, padding: '4px 12px', border: '1px solid #eee', fontWeight: 500 }}>{day}</div>
              ))}
            </div>
            <div style={{ color: '#888', fontSize: 14, marginBottom: 8 }}>○ Sunday – vendor closed</div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 8 }}>
              <div style={{ fontWeight: 600 }}>Start from</div>
              <div style={{ fontWeight: 500, color: '#222' }}>Tomorrow &gt;</div>
            </div>
            <div style={{ color: '#1BA672', fontWeight: 500, marginBottom: 8, cursor: 'pointer' }}>View sample weekly menu &gt;</div>
          </div>
          <div style={{ background: '#f7f7fa', borderRadius: 16, padding: 16, marginBottom: 16 }}>
            <div style={{ fontWeight: 600, marginBottom: 8 }}>What this plan includes</div>
            <div style={{ display: 'flex', flexWrap: 'wrap', gap: 12 }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}><span style={{ color: '#1BA672', fontWeight: 700 }}>✓</span> Fresh daily meals</div>
              <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}><span style={{ color: '#1BA672', fontWeight: 700 }}>✓</span> Free delivery</div>
              <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}><span style={{ color: '#1BA672', fontWeight: 700 }}>✓</span> Skip or pause anytime</div>
              <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}><span style={{ color: '#1BA672', fontWeight: 700 }}>✓</span> No lock-in & cancel anytime</div>
            </div>
          </div>
          <div style={{ background: '#f7f7fa', borderRadius: 16, padding: 16, marginBottom: 16, fontWeight: 500, color: '#222', cursor: 'pointer' }}>
            Will I get the same food every day? &gt;
          </div>
          <button style={{ width: '100%', background: '#1BA672', color: '#fff', fontWeight: 600, fontSize: 20, borderRadius: 12, padding: '16px 0', border: 'none', marginTop: 8, marginBottom: 8, cursor: 'pointer' }}>
            Continue &rarr;
          </button>
        </div>
      </div>
    </div>
  );

  useEffect(() => {
    const handler = (e: any) => {
      e.preventDefault();
      setDeferredPrompt(e);
    };
    window.addEventListener('beforeinstallprompt', handler);
    return () => window.removeEventListener('beforeinstallprompt', handler);
  }, []);

  useEffect(() => {
    if (showLoginPanel || showProfilePanel || showCartPanel || showCheckoutPanel || showAddressPanel) {
      document.body.style.overflow = 'hidden';
      document.body.style.paddingRight = '0px';
    } else {
      document.body.style.overflow = '';
      document.body.style.paddingRight = '';
    }
    return () => {
      document.body.style.overflow = '';
      document.body.style.paddingRight = '';
    };
  }, [showLoginPanel, showProfilePanel, showCartPanel, showCheckoutPanel, showAddressPanel]);

  useEffect(() => {
    //if (!locationLoading && !isInCoimbatore) {
    if(false){
      const timer = setTimeout(() => {
        setShowLocationGate(true);
      }, 2000);
      return () => clearTimeout(timer);
    }
  }, [locationLoading, isInCoimbatore]);

  const availableCategories = extractCategoriesFromVendors(vendors);
  // Custom vendor data for Explore Delicious Choices
  const customVendors = [
    {
      id: '1',
      name: 'Zero cals',
      description: 'Healthy low calorie meals',
      location: 'Peelamedu',
      rating: 4.2,
        image: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80',
      deliveryTime: '20-30 mins',
      minimumOrder: 150,
      deliveryFee: 20,
      cuisineType: 'Balanced Diet',
      phone: '',
      isActive: true,
      isFeatured: true,
      created_at: '',
      tags: ['Balanced Diet', 'Low Calorie', 'High Protein'],
    },
    {
      id: '2',
      name: 'The fruit bowl co',
      description: 'Fresh fruit bowls and vegan options',
      location: 'Gandhipuram',
      rating: 4.5,
        image: 'https://images.unsplash.com/photo-1464306076886-debede6bbf94?auto=format&fit=crop&w=400&q=80',
      deliveryTime: '25-35 mins',
      minimumOrder: 120,
      deliveryFee: 15,
      cuisineType: 'Fruit Bowl',
      phone: '',
      isActive: true,
      isFeatured: true,
      created_at: '',
      tags: ['Fruit Bowl', 'Vegan', 'Fresh Fruits'],
    },
    {
      id: '3',
      name: 'The buddha bowl',
      description: 'Balanced vegetarian buddha bowls',
      location: 'Sitra',
      rating: 4.3,
        image: 'https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80',
      deliveryTime: '20-30 mins',
      minimumOrder: 130,
      deliveryFee: 18,
      cuisineType: 'Buddha Bowl',
      phone: '',
      isActive: true,
      isFeatured: true,
      created_at: '',
      tags: ['Buddha Bowl', 'Balanced Diet', 'Vegetarian'],
    },
    {
      id: '4',
      name: 'Daily grubs',
      description: 'South Indian healthy meals',
      location: 'Neelambur',
      rating: 4.1,
        image: 'https://images.unsplash.com/photo-1502741338009-cac2772e18bc?auto=format&fit=crop&w=400&q=80',
      deliveryTime: '20-30 mins',
      minimumOrder: 100,
      deliveryFee: 10,
      cuisineType: 'South Indian Diet',
      phone: '',
      isActive: true,
      isFeatured: true,
      created_at: '',
      tags: ['South Indian Diet', 'Balanced Diet'],
    },
    {
      id: '5',
      name: 'Mealzy',
      description: 'Low carb, high protein meals',
      location: 'Chinniampalayam',
      rating: 4.0,
        image: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=400&q=80',
      deliveryTime: '20-30 mins',
      minimumOrder: 110,
      deliveryFee: 12,
      cuisineType: 'Low Carb',
      phone: '',
      isActive: true,
      isFeatured: true,
      created_at: '',
      tags: ['Low Carb', 'High Protein', 'Balanced Diet'],
    },
    {
      id: '6',
      name: 'Incredibowl Coimbatore',
      description: 'Bowl meals for every diet',
      location: 'Gandhipuram',
      rating: 4.4,
        image: 'https://images.unsplash.com/photo-1506089676908-3592f7389d4d?auto=format&fit=crop&w=400&q=80',
      deliveryTime: '25-35 mins',
      minimumOrder: 140,
      deliveryFee: 16,
      cuisineType: 'Bowl Meals',
      phone: '',
      isActive: true,
      isFeatured: true,
      created_at: '',
      tags: ['Bowl Meals', 'Balanced Diet'],
    },
    {
      id: '7',
      name: 'Padayal NO OIL NO BOIL Restaurant',
      description: 'No oil, healthy South Indian food',
      location: 'Sitra',
      rating: 4.3,
      image: 'https://images.unsplash.com/photo-1502741338009-cac2772e18bc?auto=format&fit=crop&w=400&q=80',
      deliveryTime: '20-30 mins',
      minimumOrder: 125,
      deliveryFee: 14,
      cuisineType: 'South Indian Diet',
      phone: '',
      isActive: true,
      isFeatured: true,
      created_at: '',
      tags: ['South Indian Diet', 'No Oil', 'Healthy'],
    },
    {
      id: '8',
      name: 'FooDelights',
      description: 'Balanced diet and low calorie meals',
      location: 'Peelamedu',
      rating: 4.2,
      image: 'https://images.unsplash.com/photo-1464306076886-debede6bbf94?auto=format&fit=crop&w=400&q=80',
      deliveryTime: '20-30 mins',
      minimumOrder: 115,
      deliveryFee: 13,
      cuisineType: 'Balanced Diet',
      phone: '',
      isActive: true,
      isFeatured: true,
      created_at: '',
      tags: ['Balanced Diet', 'Low Calorie'],
    },
    {
      id: '9',
      name: 'food darzee',
      description: 'High protein, low carb meals',
      location: 'Neelambur',
      rating: 4.5,
      image: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=400&q=80',
      deliveryTime: '25-35 mins',
      minimumOrder: 135,
      deliveryFee: 17,
      cuisineType: 'High Protein',
      phone: '',
      isActive: true,
      isFeatured: true,
      created_at: '',
      tags: ['High Protein', 'Low Carb', 'Balanced Diet'],
    },
  ];

  let filteredVendors = customVendors;

  const handleCategoryChange = (category: string) => {
    setSelectedCategory(category);
  };
  const handleVendorClick = (vendor: Vendor) => {
    navigate(`/vendor/${vendor.id}`);
  };
  const clearFilters = () => {
    setSelectedCategory("All");
  };
  const handleLocationApproved = () => {
    setShowLocationGate(false);
  };
  const handleAuthComplete = async (authData: any) => {
    try {
      await login(authData);
      setShowLoginPanel(false);
    } catch (error) {
      // Keep the login panel open if authentication fails
    }
  };
  const handleShowLogin = () => {
    setShowLoginPanel(true);
  };
  const handleCloseAuth = () => {
    setShowLoginPanel(false);
  };
  const handleShowProfile = (content: 'profile' | 'orders' | 'address') => {
    setProfilePanelContent(content);
    setShowProfilePanel(true);
    if (content !== 'orders') {
      setProfileOrderData(null);
    }
  };
  const handleCloseProfile = () => {
    setShowProfilePanel(false);
    setProfileOrderData(null);
    if (returnToCheckout) {
      setTimeout(() => {
        setShowCheckoutPanel(true);
        setReturnToCheckout(false);
      }, 250);
    }
  };
  const handleShowCart = () => {
    setShowCartPanel(true);
  };
  const handleCloseCart = () => {
    setShowCartPanel(false);
  };
  const handleShowCheckout = () => {
    setShowCartPanel(false);
    setShowCheckoutPanel(true);
  };
  const handleCloseCheckout = () => {
    setShowCheckoutPanel(false);
  };
  const handleProceedToPayment = (orderData: any) => {
    setCheckoutData(orderData);
    setShowCheckoutPanel(false);
  };
  const handleClosePayment = () => {
    setCheckoutData(null);
  };
  const handleBackToCheckout = () => {
    setShowCheckoutPanel(true);
  };
  const handleLogout = () => {
    logout();
    setShowProfilePanel(false);
  };
  const handlePaymentSuccess = (paymentData: any) => {
    clearCart();
    const mockPaymentData = {
      paymentDetails: {
        paymentId: `PAY_${Date.now()}`,
        subscriptionId: `ORD_${Date.now()}`,
        method: 'Wallet',
        amount: paymentData?.amount || 565,
        date: new Date().toLocaleDateString('en-IN')
      },
      orderSummary: {
        items: paymentData?.items || 3,
        vendor: paymentData?.vendor || 'the fruit bowl co',
        orderType: paymentData?.orderType || 'Instant Delivery',
        quantity: paymentData?.quantity || 'bowl',
        estimatedDelivery: paymentData?.estimatedDelivery || '05:30 pm'
      }
    };
    setPaymentSuccessData(mockPaymentData);
    setShowPaymentSuccess(true);
    setShowCheckoutPanel(false);
    setShowCartPanel(false);
    setCheckoutData(null);
  };
  const handleClosePaymentSuccess = () => {
    setShowPaymentSuccess(false);
    setPaymentSuccessData(null);
  };
  const handleContinueExploringFromSuccess = () => {
    setShowPaymentSuccess(false);
    setPaymentSuccessData(null);
  };
  const handleViewOrdersFromSuccess = () => {
    if (paymentSuccessData) {
      setProfileOrderData(paymentSuccessData);
    }
    setShowPaymentSuccess(false);
    setPaymentSuccessData(null);
    handleShowProfile('orders');
  };
  const handleViewOrderDetailsFromProfile = (orderData: any) => {
    setPaymentSuccessData(orderData);
    setShowPaymentSuccess(true);
    setShowProfilePanel(false);
  };
  const handleAddressAdded = async (address: any) => {
    setShowAddressModal(false);
  };
  const handleAddressSelected = (address: any) => {
    setShowAddressPanel(false);
  };
  const handleShowAddressList = () => {
    if (isAuthenticated) {
      setShowAddressPanel(true);
    } else {
      handleShowLogin();
    }
  };
  const isStandalone = window.matchMedia('(display-mode: standalone)').matches || (window.navigator as any).standalone;
  const canInstall = !!deferredPrompt && !isStandalone;
  const handleAddToHomeScreen = () => {
    if (deferredPrompt) {
      deferredPrompt.prompt();
      deferredPrompt.userChoice.then(() => {
        setDeferredPrompt(null);
      });
    }
  };

  if (authLoading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <Loader2 className="h-8 w-8 animate-spin text-gutzo-primary mx-auto mb-4" />
          <h3 className="font-semibold text-gray-900 mb-2">Gutzo</h3>
          <p className="text-gray-600">Checking authentication...</p>
        </div>
      </div>
    );
  }
  if (typeof currentRoute === 'string' && currentRoute.startsWith('/vendor/')) {
    return <VendorDetailsPage onShowCart={handleShowCart} />;
  }
  if (typeof currentRoute === 'string' && ['/T&C','/refund_policy','/privacy_policy','/payment-status','/phonepe-soon','/contact','/about'].includes(currentRoute)) {
    switch(currentRoute) {
      case '/T&C': return <TermsPage />;
      case '/refund_policy': return <RefundPage />;
      case '/privacy_policy': return <PrivacyPage />;
      case '/payment-status': return <PaymentStatusPage />;
      case '/phonepe-soon': return <PhonePeComingSoon />;
      case '/contact': return <ContactPage />;
      case '/about': return <AboutPage />;
      default: break;
    }
  }
  if (showLocationGate && !isInCoimbatore) {
    return <LocationGate onLocationApproved={handleLocationApproved} />;
  }
  return (
    <div className="min-h-screen bg-gray-50 relative">
      <div className="sm:hidden">
        <AddToHomeScreenPrompt
          onAddToHomeScreen={handleAddToHomeScreen}
          canInstall={canInstall}
        />
      </div>
      {(showLoginPanel || showProfilePanel || showCartPanel || showCheckoutPanel || showAddressPanel) && (
        <div 
          className="fixed inset-0 z-40 transition-all duration-300 ease-out"
          style={{ backgroundColor: 'rgba(0, 0, 0, 0.5)' }}
          onClick={() => {
            if (showLoginPanel) handleCloseAuth();
            if (showProfilePanel) handleCloseProfile();
            if (showCartPanel) handleCloseCart();
            if (showCheckoutPanel) handleCloseCheckout();
            if (showAddressPanel) setShowAddressPanel(false);
          }}
        />
      )}
      <Header 
        onShowLogin={handleShowLogin}
        onLogout={handleLogout}
        onShowProfile={handleShowProfile}
        onShowCart={handleShowCart}
        onShowAddressList={handleShowAddressList}
        searchQuery={searchQuery}
        onSearchChange={setSearchQuery}
      />
      <Inspiration onOptionClick={setSelectedCategory} />
      <WeeklyMealPlansSection onMealPlanClick={plan => setSelectedMealPlan(plan)} />
      {/* Show next steps UI when a meal plan is selected */}
      {selectedMealPlan && (
        <>
          {/* Overlay for right panel */}
          {isDesktop && (
            <div
              style={{
                position: 'fixed',
                top: 0,
                left: 0,
                width: '100vw',
                height: '100vh',
                background: 'rgba(0,0,0,0.5)',
                zIndex: 49,
              }}
              onClick={() => setSelectedMealPlan(null)}
            />
          )}
          {isDesktop ? (
            <RightPanelNextSteps
              plan={selectedMealPlan}
              onClose={() => setSelectedMealPlan(null)}
            />
          ) : (
            <>
              {/* Overlay for bottom sheet */}
              <div
                style={{
                  position: 'fixed',
                  top: 0,
                  left: 0,
                  width: '100vw',
                  height: '100vh',
                  background: 'rgba(0,0,0,0.5)',
                  zIndex: 999,
                }}
                onClick={() => setSelectedMealPlan(null)}
              />
              <BottomSheetNextSteps
                plan={selectedMealPlan}
                onClose={() => setSelectedMealPlan(null)}
              />
            </>
          )}
        </>
      )}
      <main
          className="max-w-7xl mx-auto py-6 md:py-8"
        ref={listingsRef}
      >
          <div className="px-4 sm:px-6 lg:px-8">
          <div className="mb-6">
            <div className="flex items-center justify-between mb-2">
              <h2
                className="text-left font-semibold text-3xl md:text-4xl lg:text-5xl tracking-tight w-full"
                style={{ fontFamily: 'Poppins', letterSpacing: '-0.01em', fontWeight: 500, color: '#111' }}
              >
                {selectedCategory === "All" 
                  ? "Explore Delicious Choices Near You.." 
                  : `${filteredVendors.length} ${selectedCategory} restaurants`
                }
              </h2>
            </div>
          </div>
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 max-w-full mx-auto w-full">
              {filteredVendors.map((vendor) => (
                <div key={vendor.id} className="flex justify-center items-stretch w-full h-full">
                  <VendorCard
                    vendor={vendor}
                    onClick={handleVendorClick}
                  />
                </div>
              ))}
            </div>
        </div>
      </main>
      <Footer />
      <Toaster position="top-center" />
      <LoginPanel 
        isOpen={showLoginPanel}
        onClose={handleCloseAuth}
        onAuthComplete={handleAuthComplete}
      />
      <ProfilePanel 
        isOpen={showProfilePanel}
        onClose={handleCloseProfile}
        onLogout={handleLogout}
        content={profilePanelContent}
        userInfo={user ? {
          name: user.name,
          phone: user.phone,
          email: user.email
        } : null}
        onViewOrderDetails={handleViewOrderDetailsFromProfile}
        recentOrderData={profileOrderData}
      />
      <CartPanel
        isOpen={showCartPanel}
        onClose={handleCloseCart}
        isAuthenticated={isAuthenticated}
        onShowLogin={handleShowLogin}
        onShowCheckout={handleShowCheckout}
      />
      {/* Show CartStrip only when cart panel is not open */}
      {!showCartPanel && <CartStrip onShowCart={handleShowCart} />}
      <InstantOrderPanel
        isOpen={showCheckoutPanel}
        onClose={handleCloseCheckout}
        cartItems={checkoutData?.items || []}
        onPaymentSuccess={handlePaymentSuccess}
        onAddAddress={() => {
          setShowCheckoutPanel(false);
          setReturnToCheckout(true);
          setTimeout(() => {
            setProfilePanelContent('address');
            setShowProfilePanel(true);
          }, 250);
        }}
      />
      {paymentSuccessData && (
        <PaymentSuccessModal
          isOpen={showPaymentSuccess}
          onClose={handleClosePaymentSuccess}
          paymentDetails={paymentSuccessData.paymentDetails}
          orderSummary={paymentSuccessData.orderSummary}
          onViewOrders={handleViewOrdersFromSuccess}
          onContinueExploring={handleContinueExploringFromSuccess}
        />
      )}
      <AddressModal
        isOpen={showAddressModal}
        onClose={() => setShowAddressModal(false)}
        onSave={handleAddressAdded}
      />
      <AddressListPanel
        isOpen={showAddressPanel}
        onClose={() => setShowAddressPanel(false)}
        onSelectAddress={handleAddressSelected}
      />
      {/* VendorCartStrip logic may need update if tied to old panel logic */}
    </div>
  );
}



export default function App() {
  return (
    <BrowserRouter>
      <AuthProvider>
        <RouterProvider>
          <LocationProvider>
            <CartProvider>
              <AppContent />
            </CartProvider>
          </LocationProvider>
        </RouterProvider>
      </AuthProvider>
    </BrowserRouter>
  );
}