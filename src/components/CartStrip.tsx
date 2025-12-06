

import React from "react";
import { useCart } from "../contexts/CartContext";
import { ShoppingBag } from "lucide-react";

interface CartStripProps {
  onShowCart?: () => void;
}

const CartStrip: React.FC<CartStripProps> = ({ onShowCart }) => {
  const { totalItems, totalAmount } = useCart();
  React.useEffect(() => {
    console.log('[CartStrip] totalItems:', totalItems);
  }, [totalItems]);
  if (!totalItems || totalItems === 0) return null;

  return (
    <>
      <style>{`
        .gutzo-cart-strip-fixed {
          position: fixed;
          left: 0;
          right: 0;
          bottom: 0;
          z-index: 100;
          display: flex;
          justify-content: center;
          pointer-events: none;
        }
        .gutzo-cart-strip-inner {
          background: #219653;
          color: #fff;
          padding: 14px 24px;
          display: flex;
          align-items: center;
          justify-content: space-between;
          font-weight: 600;
          font-size: 1rem;
          box-shadow: 0 -2px 12px rgba(0,0,0,0.08);
          border-radius: 0;
          width: 100%;
          max-width: 800px;
          margin: 0 auto;
          pointer-events: auto;
        }
        @media (max-width: 767px) {
          .gutzo-cart-strip-inner {
            max-width: 100vw;
            border-radius: 0;
          }
        }
      `}</style>
      <div className="gutzo-cart-strip-fixed">
        <div className="gutzo-cart-strip-inner">
          <span>{totalItems} item{totalItems > 1 ? 's' : ''} added</span>
          <div
            style={{
              display: 'flex',
              alignItems: 'center',
              fontWeight: 500,
              fontSize: 18,
              cursor: 'pointer',
              letterSpacing: 'normal',
              textTransform: 'uppercase',
              color: '#fff',
              gap: 0,
            }}
            onClick={onShowCart}
          >
            VIEW CART
            <ShoppingBag size={24} strokeWidth={1} style={{ marginLeft: 2 }} />
          </div>
        </div>
      </div>
    </>
  );
};

export default CartStrip;
