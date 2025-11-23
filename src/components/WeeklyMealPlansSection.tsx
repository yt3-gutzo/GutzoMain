
import React from "react";

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
		schedule: "Mon – Sat · Lnch/Dinner",
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

export default function WeeklyMealPlansSection() {
	return (
		<section className="w-full bg-white pt-8 pb-10 md:pt-12 md:pb-14 lg:pt-16 lg:pb-20">
			<div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
								<h2
									className="text-left font-medium tracking-tight w-full mb-4 text-[20px] lg:text-[30px]"
									style={{ fontFamily: 'Poppins', letterSpacing: '-0.01em', fontWeight: 500, color: '#111' }}
								>
									Weekly Meal Plans
								</h2>
				<div className="w-full overflow-x-auto scrollbar-hide pb-2 mt-2">
					<div className="flex flex-nowrap gap-6 sm:gap-5 lg:gap-8 justify-start">
						{mealPlans.map((plan, idx) => (
							<div
								key={idx}
								className="bg-white rounded-2xl shadow-md border border-gray-100 flex flex-col w-[80vw] max-w-xs sm:w-[320px] lg:w-[340px] overflow-hidden"
								style={{ minWidth: 260 }}
							>
								<div className="relative w-full">
															<img
																src={plan.image}
																alt={plan.title}
																className="w-full h-28 object-cover rounded-t-2xl"
									/>
									<span className="absolute top-3 right-3 bg-white rounded-full px-2 py-0.5 text-xs font-semibold text-gray-800 shadow">
										{plan.rating}
									</span>
								</div>
								<div className="px-6 pt-4 pb-5 flex flex-col flex-1 md:px-8">
									<h3 className="text-lg font-bold text-gray-900 mb-1" style={{ fontFamily: 'Poppins' }}>{plan.title}</h3>
									<p className="text-sm text-gray-500 mb-1">by {plan.vendor}</p>
									<p className="text-sm text-gray-600 mb-2">{plan.schedule}</p>
									<p className="text-xl font-semibold text-gray-900 mb-3">{plan.price}</p>
									<ul className="mb-4 space-y-1">
										{plan.features.map((feature, i) => (
											<li key={i} className="flex items-center text-sm text-gray-700">
												<span className="text-green-600 mr-2">✔</span>
												{feature}
											</li>
										))}
									</ul>
									<button
										className="mt-auto w-full bg-green-700 hover:bg-green-800 text-white font-semibold py-2 rounded-lg text-base transition-colors duration-150 shadow"
										style={{ fontFamily: 'Poppins' }}
									>
										Subscribe Now
									</button>
								</div>
							</div>
						))}
					</div>
				</div>
			</div>
		</section>
	);
}
 