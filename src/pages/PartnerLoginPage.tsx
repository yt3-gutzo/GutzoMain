import { useState } from 'react';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "../components/ui/card";
import { Button } from "../components/ui/button";
import { Input } from "../components/ui/input";
import { Label } from "../components/ui/label";
import { Loader2 } from "lucide-react";
import { useRouter } from "../components/Router";
import { nodeApiService as apiService } from "../utils/nodeApi";
import { toast } from "sonner";
import { ImageWithFallback } from "../components/common/ImageWithFallback";

export function PartnerLoginPage() {
  const { navigate } = useRouter();
  const [formData, setFormData] = useState({ email: '', password: '' });
  const [isLoading, setIsLoading] = useState(false);
  const [errorMsg, setErrorMsg] = useState('');

  const handleLoginSubmit = async (e: React.FormEvent) => {
      e.preventDefault();
      setIsLoading(true);
      setErrorMsg('');

      // Basic email validation
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(formData.email)) {
        setErrorMsg("Please enter a valid email address");
        setIsLoading(false);
        return;
      }

      try {
          const response = await apiService.vendorLogin({ 
              email: formData.email,
              password: formData.password 
          });

          if (response && response.success && response.data) {
              localStorage.setItem('vendor_data', JSON.stringify(response.data.vendor));
              toast.success(`Welcome back, ${response.data.vendor.name}!`);
              navigate('/partner/dashboard');
          }
      } catch (error: any) {
          // Map backend 404/Vendor not found to specific message
          if (error.message === 'Vendor not found' || error.status === 404) {
             setErrorMsg("Account not found. Please register as a partner first.");
          } else {
             setErrorMsg(error.message || "Login failed");
          }
      } finally {
          setIsLoading(false);
      }
  };

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col items-center justify-center p-4">
       <button
          onClick={() => navigate('/')}
          className="absolute top-4 left-4 text-[#1A1A1A] hover:opacity-70 transition-opacity"
          style={{ fontSize: 24, lineHeight: 1, background: 'none', border: 'none', cursor: 'pointer' }}
          aria-label="Back"
        >
          &larr;
        </button>

      <div className="w-full max-w-md">
        <div className="flex justify-center mb-8">
           <ImageWithFallback
              src="https://35-194-40-59.nip.io/service/storage/v1/object/public/Gutzo/GUTZO.svg"
              alt="Gutzo"
              className="h-12 w-auto"
            />
        </div>

        <Card className="shadow-lg border-0">
          <CardHeader className="space-y-1 text-center">
            <CardTitle className="text-2xl font-bold text-gray-900">Kitchen Portal</CardTitle>
            <CardDescription>
              Enter your password to login.
            </CardDescription>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleLoginSubmit} className="space-y-4">
              
              <div className="space-y-2">
                <Label htmlFor="email">Email Address</Label>
                <Input 
                  id="email" 
                  type="email"
                  placeholder="vendor@example.com" 
                  value={formData.email}
                  onChange={(e) => setFormData(prev => ({ ...prev, email: e.target.value }))}
                  required
                />
              </div>

              <div className="space-y-2">
                <div className="flex items-center justify-between">
                    <Label htmlFor="password">Password</Label>
                    <button type="button" onClick={() => toast.info("Contact support to reset password")} className="text-xs text-[#1BA672] hover:underline">Forgot password?</button>
                </div>
                <Input 
                    id="password" 
                    type="password"
                    placeholder="••••••••" 
                    value={formData.password}
                    onChange={(e) => setFormData(prev => ({ ...prev, password: e.target.value }))}
                    required
                />
              </div>

              {errorMsg && (
                <div className="bg-red-50 text-red-600 text-sm p-3 rounded-md text-center border border-red-100">
                  {errorMsg}
                </div>
              )}

              <Button 
                type="submit" 
                className="w-full text-white hover:opacity-90 transition-opacity"
                style={{ backgroundColor: '#1BA672' }}
                disabled={isLoading}
              >
                {isLoading ? (
                  <>
                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                    Logging in...
                  </>
                ) : (
                  "Login"
                )}
              </Button>
            </form>
          </CardContent>
        </Card>
        
        <p className="text-center text-sm text-gray-500 mt-6">
          Having trouble? <a href="mailto:support@gutzo.in" className="font-semibold text-[#1BA672] hover:underline">Contact Support</a>
        </p>
      </div>
    </div>
  );
}
