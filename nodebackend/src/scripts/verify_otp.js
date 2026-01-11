import dotenv from 'dotenv';
import { createClient } from '@supabase/supabase-js';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config({ path: path.resolve(__dirname, '../../.env') });

const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_KEY);

async function checkOrder() {
    const orderNum = 'GZ202601111308I59X';
    console.log(`Checking Order: ${orderNum}`);

    // 1. Get Order ID
    const { data: order } = await supabase.from('orders').select('id, delivery_otp').eq('order_number', orderNum).single();
    
    if (!order) {
        console.log("❌ Order NOT FOUND");
        return;
    }
    console.log("✅ Order Found UUID:", order.id);
    console.log("   Order Table Delivery OTP:", order.delivery_otp);

    // 2. Get Delivery Record
    const { data: delivery } = await supabase.from('deliveries').select('*').eq('order_id', order.id).single();

    if (!delivery) {
        console.log("❌ Delivery Record NOT FOUND in 'deliveries' table");
    } else {
        console.log("✅ Delivery Record Found:");
        console.log("   Status:", delivery.status);
        console.log("   Pickup OTP:", delivery.pickup_otp);
        console.log("   Delivery OTP:", delivery.delivery_otp);
    }
}

checkOrder();
