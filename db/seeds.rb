User.create(name: "Tom")
perry = User.create(name: "Perry")

china = Restaurant.create(name: "China Gourmet", rating: 3, address: "118 W 54th")
Restaurant.create(name: "Fiore's Deli", rating: 4, address: "10 W 4th")

UserRestaurant.create(user_id: perry.id, restaurant_id: china.id)
