// Shared content for meal plan next steps panel
import type { MealPlan } from "./components/WeeklyMealPlansSection";
import { MealPlanMenuPreview } from "./components/MealPlanMenuPreview";

const NextStepsContent = ({ plan, hideTitle = false, isMobile = false, hideVendor = false }: { plan: MealPlan; hideTitle?: boolean; isMobile?: boolean; hideVendor?: boolean }) => (
  <div className="font-primary text-main">
    {/* 1. Plan Title */}
    {!hideTitle && <h1 className="text-2xl font-bold mb-1">{plan?.title} Plan</h1>}
    
    {/* 2. Vendor Name */}
    {!hideVendor && <div className="text-base font-medium text-sub mb-0.5">by {plan?.vendor}</div>}
    

    
    {/* 4. Weekly Menu Preview (3 days) */}
    <MealPlanMenuPreview removePadding={isMobile} />



    <div className="bg-gutzo-bg rounded-gutzo-panel p-4 mb-4">


      {/* 7. Price Section */}
      <div className="text-lg font-medium mb-2">
        ₹{plan?.price?.includes('week') 
          ? Math.round(parseInt(plan.price.replace(/[^\d]/g, '')) / 6) 
          : plan?.price?.replace('/day','').replace('/week','')} / day
      </div>

      {/* 6. Social Proof Badge (Moved) */}
      <div className="inline-flex items-center gap-1.5 bg-white text-main text-xs font-bold px-3 py-1.5 mb-2 rounded-full border border-gray-200 shadow-[0_2px_8px_rgba(0,0,0,0.12)]">
        <Zap className="w-3.5 h-3.5 fill-main text-main" />
        <span>Most chosen · 72% continue after week 1</span>
      </div>
      <div className="text-xs text-[#9A9A9A] mb-3">Cheaper than home cooking • No delivery fees • Daily variety</div>

      
      <hr className="border-gray-100 my-4" />

      {/* 8. Customize Your Plan */}
      <h3 className="font-semibold text-base mb-3 text-main">Customize Your Plan</h3>
      
      <div className="space-y-4">
        {/* Included Daily (Meals) */}
        <div>
          <div className="text-sm text-sub mb-2 font-medium">Included Daily:</div>
          <div className="flex flex-wrap gap-2">
            <div className="flex items-center gap-1.5 bg-brand-light border border-transparent rounded-gutzo-badge px-3 py-2 cursor-pointer transition-all hover:border-brand">
               <div className="w-4 h-4 rounded-full bg-brand flex items-center justify-center">
                 <span className="text-white text-xs font-bold">✓</span>
               </div>
               <span className="text-main font-medium text-sm">Lunch</span>
            </div>
            <div className="flex items-center gap-1.5 bg-brand-light border border-transparent rounded-gutzo-badge px-3 py-2 cursor-pointer transition-all hover:border-brand">
               <div className="w-4 h-4 rounded-full bg-brand flex items-center justify-center">
                 <span className="text-white text-xs font-bold">✓</span>
               </div>
               <span className="text-main font-medium text-sm">Dinner</span>
            </div>
            <div className="flex items-center gap-1.5 bg-white border border-main rounded-gutzo-badge px-3 py-2 cursor-pointer transition-all hover:border-gray-400 opacity-60">
               <div className="w-4 h-4 rounded-full border border-gray-400"></div>
               <span className="text-sub font-medium text-sm">Breakfast (+₹39)</span>
            </div>
          </div>
        </div>

        {/* Delivery Days */}
        <div>
          <div className="text-sm text-sub mb-2 font-medium">Delivery Days:</div>
          <div className="flex flex-wrap gap-1.5">
            {['Mon','Tue','Wed','Thu','Fri','Sat'].map(day => (
              <div key={day} className="bg-brand text-white rounded-gutzo-badge w-10 h-8 flex items-center justify-center font-medium text-xs shadow-sm">
                {day}
              </div>
            ))}
             <div className="bg-gray-100 text-disabled rounded-gutzo-badge w-10 h-8 flex items-center justify-center font-medium text-xs opacity-50">
                Sun
              </div>
          </div>
          <div className="text-brand text-xs mt-2 font-medium flex items-center gap-0.5">
             <span className="w-1.5 h-1.5 rounded-full bg-brand"></span>
             Sunday is a rest day (Vendor closed)
          </div>
        </div>
      </div>

      <div className="h-px bg-gray-200 my-4"></div>
      
      {/* Starting From */}
      <div className="flex justify-between items-center bg-white p-3 rounded-gutzo-badge border border-gray-100">
        <div className="flex flex-col">
          <span className="text-xs text-sub font-medium">Starting From</span>
          <span className="font-semibold text-main text-sm">Tomorrow, Lunch</span>
        </div>
        <span className="text-brand font-medium text-sm">Change &gt;</span>
      </div>
    </div>

    {/* 9. Plan Benefits */}
    <div className="bg-gutzo-bg rounded-gutzo-panel p-4 mb-4">
      <div className="font-semibold mb-3">Plan Benefits</div>
      <div className="grid grid-cols-2 gap-3">
        <div className="flex items-start gap-2">
          <span className="text-brand font-bold text-lg leading-none">✓</span>
          <span className="text-sm text-sub leading-tight">Fresh menu every day</span>
        </div>
        <div className="flex items-start gap-2">
          <span className="text-brand font-bold text-lg leading-none">✓</span>
          <span className="text-sm text-sub leading-tight">Pause/skip anytime</span>
        </div>
        <div className="flex items-start gap-2">
          <span className="text-brand font-bold text-lg leading-none">✓</span>
          <span className="text-sm text-sub leading-tight">Cancel anytime</span>
        </div>
      </div>
    </div>

    {/* 10. FAQ Section */}
    <div className="space-y-3 mb-6">
      <div className="bg-gutzo-bg rounded-gutzo-panel p-4 font-medium text-main cursor-pointer flex justify-between items-center transition-colors hover:bg-gray-100">
        <span className="text-sm font-medium">Will I get the same food every day?</span>
        <span className="text-sub">&gt;</span>
      </div>
      <div className="bg-gutzo-bg rounded-gutzo-panel p-4 font-medium text-main cursor-pointer flex justify-between items-center transition-colors hover:bg-gray-100">
        <span className="text-sm font-medium">Can I cancel my plan?</span>
        <span className="text-sub">&gt;</span>
      </div>
    </div>
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
import { Loader2, MapPin, Plus, X, Zap } from "lucide-react";
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
    const isDesktop = useMediaQuery('(min-width: 850px)');

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
  // Meal plan scroll lock handled in consolidated effect below

  // Right panel and bottom sheet components (reuse from VendorDetailsPage)
  const RightPanelNextSteps = ({ plan, onClose }: { plan: MealPlan, onClose: () => void }) => (
    <>
      <div 
        className="fixed inset-0 bg-black/50 transition-opacity" 
        style={{ zIndex: 1090 }}
        onClick={onClose}
        aria-hidden="true"
      />
      <div 
        className="fixed top-0 right-0 h-full w-full bg-gutzo-surface shadow-modal flex flex-col items-stretch"
        style={{ zIndex: 1100, maxWidth: '600px' }}
      >
        <div 
          className="flex-none py-6 pb-2 bg-gutzo-surface z-10"
          style={{ paddingLeft: '24px', paddingRight: '24px' }}
        >
          <div className="flex items-start justify-between">
            <h1 className="text-3xl font-bold m-0 font-primary text-main mb-0.5">{plan?.title} Plan</h1>
            <button
              onClick={onClose}
              className="bg-transparent border-none p-0 cursor-pointer pt-1.5"
              aria-label="Close panel"
            >
              <X className="h-6 w-6 text-gray-500" />
            </button>
          </div>
          <div className="text-base font-medium text-sub">by {plan?.vendor}</div>
      </div>
      <div 
        className="flex-1 overflow-y-auto py-6 pt-2"
        style={{ paddingLeft: '24px', paddingRight: '24px' }}
      >
        <NextStepsContent plan={plan} hideTitle={true} hideVendor={true} />
      </div>
        <div className="flex-none p-6 bg-gutzo-surface border-t border-gray-100 shadow-[0_-4px_12px_rgba(0,0,0,0.05)]">
          <button className="w-full bg-brand text-white font-semibold text-lg rounded-gutzo-btn py-4 cursor-pointer hover:bg-brand-hover active:bg-brand-pressed transition-colors border-none shadow-lg shadow-green-900/10">
            Continue →
          </button>
        </div>
      </div>
    </>
  );

  const BottomSheetNextSteps = ({ plan, onClose }: { plan: MealPlan, onClose: () => void }) => (
    <>
      <div 
        className="fixed inset-0 bg-black/50 transition-opacity" 
        style={{ zIndex: 1090 }}
        onClick={onClose}
        aria-hidden="true"
      />
      <div 
        className="fixed left-0 bottom-0 w-full bg-gutzo-surface shadow-[0_-2px_8px_rgba(0,0,0,0.08)] rounded-t-3xl flex flex-col"
        style={{ zIndex: 1100, top: '104px', height: 'calc(100vh - 104px)' }}
      >
        <div className="flex-none p-5 pb-2 bg-gutzo-surface rounded-t-3xl">
          <div className="flex items-start justify-between">
            <h1 className="text-2xl font-bold m-0 font-primary text-main mb-0.5">{plan?.title} Plan</h1>
            <button
              onClick={onClose}
              className="bg-transparent border-none p-0 cursor-pointer ml-3 pt-1"
              aria-label="Close panel"
            >
              <X className="h-6 w-6 text-gray-500" />
            </button>
          </div>
          <div className="text-base font-medium text-sub">by {plan?.vendor}</div>
        </div>
        <div className="flex-1 overflow-y-auto p-5 py-2 scrollbar-hide">
          <NextStepsContent plan={plan} hideTitle={true} isMobile={true} hideVendor={true} />
        </div>
        <div className="flex-none p-5 pb-8 bg-gutzo-surface z-20">
          <button className="w-full bg-brand text-white font-semibold text-lg rounded-gutzo-btn py-4 cursor-pointer hover:bg-brand-hover active:bg-brand-pressed transition-colors border-none shadow-lg shadow-green-900/10">
            Continue →
          </button>
        </div>
      </div>
    </>
  );

  useEffect(() => {
    const handler = (e: any) => {
      e.preventDefault();
      setDeferredPrompt(e);
    };
    window.addEventListener('beforeinstallprompt', handler);
    return () => window.removeEventListener('beforeinstallprompt', handler);
  }, []);

  // Consolidated Body Scroll Lock Effect
  useEffect(() => {
    const shouldLock = 
      selectedMealPlan !== null || 
      showLoginPanel || 
      showProfilePanel || 
      showCartPanel || 
      showCheckoutPanel || 
      showAddressPanel;

    if (shouldLock) {
      document.body.style.overflow = 'hidden';
      // Only add padding right if it's a modal panel (not necessarily for meal plan if needed, but safe to add)
      if (!selectedMealPlan) {
         document.body.style.paddingRight = '0px'; 
      }
    } else {
      document.body.style.overflow = '';
      document.body.style.paddingRight = '';
    }
    
    return () => {
      document.body.style.overflow = '';
      document.body.style.paddingRight = '';
    };
  }, [selectedMealPlan, showLoginPanel, showProfilePanel, showCartPanel, showCheckoutPanel, showAddressPanel]);

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
  // Use vendors fetched from API
  let filteredVendors = vendors;

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
    const paymentSuccessPayload = {
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
    setPaymentSuccessData(paymentSuccessPayload);
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
          className="fixed inset-0 z-40 transition-all duration-300 ease-out bg-black-50"
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
              className="fixed-full bg-black-50 z-49"
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
              className="fixed-full bg-black-50"
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
                className="text-left font-semibold text-3xl md:text-4xl lg:text-5xl tracking-tight w-full font-primary text-main"
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
      {/* Show CartStrip only when cart, profile, and login panels are not open */}
      {!showCartPanel && !showProfilePanel && !showLoginPanel && <CartStrip onShowCart={handleShowCart} />}
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