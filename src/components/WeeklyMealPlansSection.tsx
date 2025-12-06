import React from "react";

export type MealPlan = {
	title: string;
	vendor: string;
	rating: number;
	price: string;
	schedule: string;
	features: string[];
	image: string;
};

interface WeeklyMealPlansSectionProps {
	noPadding?: boolean;
	onMealPlanClick?: (plan: MealPlan) => void;
}

const mealPlans = [
	{
		title: "Protein Power",
		vendor: "Daily Grub",
		rating: 4.6,
		price: "₹89/day",
		schedule: "Mon – Sat · Lunch/Dinner",
		features: [
			"Curated, chef-cooked dishes",
			"Daily menu variety",
			"Free delivery on every order",
		],
		image: "/assets/mealplans/proteinpower.png",
	},
	{
		title: "Balanced Meal",
		vendor: "FitMeals",
		rating: 4.8,
		price: "₹89/day",
		schedule: "Mon – Sat · Lunch/Dinner",
		features: [
			"Curated, chef-cooked dishes",
			"Daily menu variety",
			"Free delivery on every order",
		],
		image: "/assets/mealplans/balancedmeal.png",
	},
	{
		title: "Veggie Delight",
		vendor: "Green Eats",
		rating: 4.5,
		price: "₹85/day",
		schedule: "Mon – Sat · Lunch/Dinner",
		features: [
			"Fresh vegetarian dishes",
			"Daily menu variety",
			"Free delivery on every order",
		],
		image: "/assets/mealplans/Veggiedelight.png",
	},
	{
		title: "Mediterranean Medley",
		vendor: "Olive Grove",
		rating: 4.7,
		price: "₹1100/week",
		schedule: "Mon-Fri",
		features: ["Falafel", "Hummus", "Fresh Salad"],
		image: "/assets/mealplans/Mediterraneanmedley.png",
	},
	{
		title: "Asian Fusion Feast",
		vendor: "Wok Wonders",
		rating: 4.6,
		price: "₹1150/week",
		schedule: "Mon-Sat",
		features: ["Stir Fry", "Rice Bowls", "Seasonal Veggies"],
		image: "/assets/mealplans/Asianfusionfeast.png",
	},
	{
		title: "Hearty Homestyle Meals",
		vendor: "Mom's Kitchen",
		rating: 4.8,
		price: "₹990/week",
		schedule: "Mon-Fri",
		features: ["Dal & Rice", "Sabzi", "Roti"],
		image: "/assets/mealplans/Heartyhomestylemeals.png",
	},
];

export default function WeeklyMealPlansSection({ noPadding = false, onMealPlanClick }: WeeklyMealPlansSectionProps) {
	return (
		<section className="w-full bg-[#fafafa] pt-4 pb-8 md:pt-6 md:pb-12 lg:pt-8 lg:pb-16">
			<div className={`w-full max-w-7xl mx-auto flex flex-col${noPadding ? '' : ' px-4 sm:px-6 lg:px-8'}`}> 
				<h2
					className="text-left font-medium tracking-tight w-full mb-3 text-[20px] lg:text-[30px]"
					style={{ fontFamily: 'Poppins', letterSpacing: '-0.01em', fontWeight: 500, color: '#111', marginTop: 0 }}
				>
					Weekly Meal Plans
				</h2>
				<div
					className="gutzo-desktop-scroll scrollbar-hide"
					style={{
						width: window.innerWidth >= 1024 ? 'calc(220px * 4.5 + 24px * 4)' : '100%',
						maxWidth: '100%',
						overflowX: 'auto',
						display: 'flex',
						flexDirection: 'row',
						gap: '24px',
					}}
				>
					{mealPlans.map((plan, idx) => (
						<div
							key={idx}
							className="gutzo-card-hover"
							style={{
								minWidth: window.innerWidth >= 1024 ? '220px' : '170px',
								maxWidth: window.innerWidth >= 1024 ? '220px' : '220px',
								height: window.innerWidth >= 1024 ? '340px' : 'auto',
								display: 'flex',
								flexDirection: 'column',
								justifyContent: 'space-between',
								cursor: 'pointer',
							}}
							onClick={() => {
								if (typeof onMealPlanClick === 'function') {
									onMealPlanClick(plan);
								}
							}}
						>
							<div
								className="w-full"
								style={{
									width: window.innerWidth >= 1024 ? '100%' : undefined,
									height: window.innerWidth >= 1024 ? '180px' : '140px',
									objectFit: window.innerWidth >= 1024 ? 'cover' : 'cover',
									borderRadius: '16px',
									overflow: 'hidden',
									marginBottom: window.innerWidth >= 1024 ? '12px' : '8px',
								}}
							>
								<img
									src={plan.image}
									alt={plan.title}
									style={{
										width: '100%',
										height: '100%',
										objectFit: 'cover',
										objectPosition: 'center',
										borderRadius: '16px',
									}}
								/>
							</div>
							<div className="px-2 pt-2 pb-0 flex flex-col flex-1 md:px-3" style={{ flexGrow: 1 }}>
								<h3
									className="text-[13px] font-bold text-gray-900 mb-0.5"
									style={{ fontFamily: 'Poppins', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', width: '100%' }}
									title={plan.title}
								>
									{plan.title}
								</h3>
								<p className="text-[11px] text-gray-500 mb-0.5">by {plan.vendor}</p>
								<p className="text-[12px] text-gray-600 mb-1" style={{ fontSize: '12px' }}>{plan.schedule}</p>
								<p className="text-[13px] font-semibold text-gray-900 mb-2">{plan.price}</p>
								<div style={{ display: 'flex', alignItems: 'center', justifyContent: 'flex-start', marginTop: 4, marginBottom: 10, cursor: 'pointer' }}>
									<span style={{ color: '#1BA672', fontFamily: 'Poppins', fontWeight: 400, fontSize: 14, letterSpacing: '-0.01em', marginRight: 4 }}>
										View Plan
									</span>
									<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M6 4L10 8L6 12" stroke="#1BA672" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
									</svg>
								</div>
							</div>
						</div>
					))}
				</div>
			</div>
		</section>
	);
}
