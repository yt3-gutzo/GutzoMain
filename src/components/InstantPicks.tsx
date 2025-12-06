import './InstantPicks.css';
import React from "react";
import { useCart } from "../contexts/CartContext";
import StarIcon from "./StarIcon";
import { Product as GlobalProduct } from "../types";

type Product = GlobalProduct & {
  action?: "add" | "reserve" | "soldout";
};

const products: Product[] = [
  {
    id: "p1",
    vendor_id: "v1",
    name: "Protein Chicken Bowl",
    description: "A delicious bowl packed with high-quality protein, fresh vegetables, and wholesome grains, perfect for muscle growth and recovery after workouts.",
    price: 299,
    category: "Bowls",
    image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80",
    is_available: true,
    is_veg: false,
    created_at: "2025-12-01T00:00:00Z",
    rating: 4.6,
    ratingCount: 74,
    action: "add"
  },
  {
    id: "p2",
    vendor_id: "v1",
    name: "Glow Veg Bowl",
    description: "A vibrant vegetarian bowl designed to support healthy skin and digestion, featuring a mix of nutrient-rich veggies and superfoods for a natural glow.",
    price: 249,
    category: "Bowls",
    image: "https://images.unsplash.com/photo-1464306076886-debede6bbf94?auto=format&fit=crop&w=400&q=80",
    is_available: true,
    is_veg: true,
    created_at: "2025-12-01T00:00:00Z",
    rating: 4.4,
    ratingCount: 40,
    action: "add"
  },
  {
    id: "p3",
    vendor_id: "v1",
    name: "Detox Smoothie",
    description: "A refreshing smoothie made with fresh fruits and greens, crafted to help cleanse your system and keep you feeling light and energized throughout the day.",
    price: 189,
    category: "Smoothies",
    image: "https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80",
    is_available: true,
    is_veg: true,
    created_at: "2025-12-01T00:00:00Z",
    rating: 4.5,
    ratingCount: 26,
    action: "add"
  },
  {
    id: "p4",
    vendor_id: "v1",
    name: "Healthy Cookie Pack",
    description: "A pack of wholesome cookies made with oats, nuts, and seeds, perfect for guilt-free snacking. Available for preorder and delivery tomorrow.",
    price: 150,
    category: "Snacks",
    image: "https://images.unsplash.com/photo-1502741338009-cac2772e18bc?auto=format&fit=crop&w=400&q=80",
    is_available: false,
    is_veg: true,
    created_at: "2025-12-01T00:00:00Z",
    rating: 4.2,
    ratingCount: 12,
    action: "add"
  },
];

interface InstantPicksProps {
  noPadding?: boolean;
}

const InstantPicks: React.FC<InstantPicksProps> = ({ noPadding = false }) => (
  <div style={{ margin: noPadding ? '32px 0 0 0' : '32px 16px 0 16px' }}>
    <h3
      className="instant-picks-heading text-left font-medium tracking-tight w-full mb-3"
    >
      Today's best picks (Instant)
    </h3>
    <div className={`instant-picks-list${noPadding ? ' no-padding' : ''}`}>
      {products.map((product, idx) => {
        const { addItem, updateQuantity, getItemQuantity } = useCart();
        const quantity = getItemQuantity(product.id);
        return (
          <React.Fragment key={product.id}>
            <div className={`instant-picks-card${noPadding ? ' no-padding' : ''}`} style={{ display: 'flex', alignItems: 'center', width: '100%' }}>
              <div className="instant-picks-details" style={{ flex: 1, paddingRight: 24 }}>
                <div className="instant-picks-title">{product.name}</div>
                <div className="instant-picks-price">₹{product.price}</div>
                <div className="instant-picks-rating">
                  <StarIcon size={16} color="#43A047" className="instant-picks-star" />
                  <span className="instant-picks-rating-value">{product.rating}</span>
                  <span className="instant-picks-rating-count">({product.ratingCount})</span>
                </div>
                <div className="instant-picks-desc">{product.description}</div>
              </div>
              <div className="instant-picks-image-btn" style={{ width: 160, display: 'flex', flexDirection: 'column', alignItems: 'flex-end' }}>
                <div className="instant-picks-image-wrapper">
                  <div className="instant-picks-image">
                    {product.image && <img src={product.image} alt={product.name} style={{ maxWidth: '100%', height: 'auto', display: 'block' }} />}
                  </div>
                  {product.action === "add" && (
                    quantity === 0 ? (
                      <button
                        className="instant-picks-btn instant-picks-btn-green"
                        onClick={() =>
                          addItem(
                            product,
                            {
                              id: 'vendor',
                              name: 'Vendor',
                              description: '',
                              location: '',
                              rating: 5,
                              image: '',
                              deliveryTime: '',
                              minimumOrder: 0,
                              deliveryFee: 0,
                              cuisineType: '',
                              phone: '',
                              isActive: true,
                              isFeatured: false,
                              created_at: '2025-12-01T00:00:00Z',
                              tags: []
                            },
                            1
                          )
                        }
                      >ADD</button>
                    ) : (
                      <div className="qty-selector">
                        <button className="qty-btn" onClick={() => updateQuantity(product.id, quantity - 1)}>-</button>
                        <span className="qty-count">{quantity}</span>
                        <button className="qty-btn" onClick={() => updateQuantity(product.id, quantity + 1)}>+</button>
                      </div>
                    )
                  )}
                  {/* {product.action === "reserve" && <button className="instant-picks-btn instant-picks-btn-orange">Reserve</button>} */}
                  {product.action === "soldout" && <button className="instant-picks-btn instant-picks-btn-gray" disabled>SOLD OUT</button>}
                </div>
              </div>
            </div>
            {idx < products.length - 1 && (
              <div className="instant-picks-splitter" />
            )}
          </React.Fragment>
        );
      })}
    </div>
  </div>
);

export default InstantPicks;
