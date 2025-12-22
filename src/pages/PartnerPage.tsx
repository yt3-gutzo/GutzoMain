import { VendorInterestForm } from "../components/VendorInterestForm";
import { Header } from "../components/Header";
import { Footer } from "../components/Footer";

export function PartnerPage() {
  return (
    <div className="min-h-screen bg-gray-50 flex flex-col">
      <Header />
      <main className="flex-grow container mx-auto px-4 py-8 sm:py-12">
        <div className="max-w-2xl mx-auto mb-8 text-center">
          <h1 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
            Grow Your Kitchen with Gutzo
          </h1>
          <p className="text-lg text-gray-600">
            We handle the logistics, marketing, and technology. 
            You focus on cooking healthy, delicious meals.
          </p>
        </div>
        
        <VendorInterestForm />
        
        <div className="max-w-4xl mx-auto mt-16 grid md:grid-cols-3 gap-8">
          <Feature 
            title="Zero Tech Hassle" 
            desc="No app to manage. No complex dashboards. We send you orders daily via WhatsApp." 
          />
          <Feature 
            title="Consistent Orders" 
            desc="Reach thousands of health-conscious customers looking for subscription plans." 
          />
          <Feature 
            title="Weekly Payouts" 
            desc="Simple, transparent payments on a weekly basis. No hidden charges." 
          />
        </div>
      </main>
      <Footer />
    </div>
  );
}

function Feature({ title, desc }: { title: string, desc: string }) {
  return (
    <div className="text-center p-6 bg-white rounded-xl shadow-sm border border-gray-100">
      <h3 className="font-semibold text-lg text-gray-900 mb-2">{title}</h3>
      <p className="text-sm text-gray-600 leading-relaxed">{desc}</p>
    </div>
  );
}
