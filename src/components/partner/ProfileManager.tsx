import { useState, useEffect } from 'react';
import { Button } from "../ui/button";
import { Input } from "../ui/input";
import { Label } from "../ui/label";
import { Textarea } from "../ui/textarea"; 
import { Loader2, Save } from "lucide-react";
import { nodeApiService as apiService } from "../../utils/nodeApi";
import { toast } from "sonner";

export function ProfileManager({ vendorId, initialData, onUpdate }: { vendorId: string, initialData: any, onUpdate: () => void }) {
  const [formData, setFormData] = useState({
    name: '',
    description: '',
    cuisine_type: '',
    address: '',
    phone: '',
    image: '',
    delivery_time: '',
    minimum_order: '',
    delivery_fee: '',
    pincode: ''
  });
  const [loading, setLoading] = useState(false);


  useEffect(() => {
    if (initialData) {
        setFormData({
            name: initialData.name || '',
            description: initialData.description || '',
            cuisine_type: initialData.cuisine_type || '',
            address: initialData.address || '',
            phone: initialData.phone || '',
            image: initialData.image || '',
            delivery_time: initialData.delivery_time || '',
            minimum_order: initialData.minimum_order || '',
            delivery_fee: initialData.delivery_fee || '',
            pincode: initialData.pincode || ''
        });
    }
  }, [initialData]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    try {
        await apiService.updateVendorProfile(vendorId, formData);
        toast.success('Profile updated successfully');
        onUpdate();
    } catch (error: any) {
        toast.error(error.message || 'Failed to update profile');
    } finally {
        setLoading(false);
    }
  };

  return (
    <div className="w-full max-w-2xl mx-auto space-y-6">
        <div className="flex justify-between items-center">
            <div>
                <h2 className="text-xl font-bold text-gray-900">{formData.name || 'Kitchen Profile'}</h2>
            </div>
            {formData.image && (
                <div className="h-16 w-16 rounded-full overflow-hidden border shadow-sm">
                    <img src={formData.image} alt="Profile" className="h-full w-full object-cover" />
                </div>
            )}
        </div>

        <form onSubmit={handleSubmit} className="bg-white p-6 rounded-xl border space-y-4 shadow-sm">


            <div className="space-y-2">
                <Label htmlFor="description">Description (Kitchen Bio)</Label>
                <Textarea id="description" value={formData.description} onChange={e => setFormData(prev => ({ ...prev, description: e.target.value }))} className="min-h-[280px] text-base" style={{ height: '180px' }} placeholder="Describe your kitchen, your story, or what makes your food special..." disabled />
            </div>



            <div className="space-y-2">
                <Label htmlFor="address">Address</Label>
                <Textarea id="address" value={formData.address} onChange={e => setFormData(prev => ({ ...prev, address: e.target.value }))} className="min-h-[240px] text-base" style={{ height: '100px' }} disabled />
            </div>

            <div className="grid md:grid-cols-2 gap-4">
                 <div className="space-y-2">
                    <Label htmlFor="pincode">Pincode</Label>
                    <Input id="pincode" value={formData.pincode} onChange={e => setFormData(prev => ({ ...prev, pincode: e.target.value }))} maxLength={6} disabled />
                </div>
                <div className="space-y-2">
                    <Label htmlFor="phone">Contact Phone</Label>
                    <Input id="phone" value={formData.phone} onChange={e => setFormData(prev => ({ ...prev, phone: e.target.value }))} disabled />
                </div>
            </div>



            <Button type="submit" className="w-full bg-[#1BA672] hover:bg-[#14885E] text-white" disabled>
                {loading ? <Loader2 className="animate-spin mr-2" /> : <Save className="w-4 h-4 mr-2" />}
                Save Changes
            </Button>
        </form>
    </div>
  );
}
