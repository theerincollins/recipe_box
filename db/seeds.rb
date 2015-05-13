# Dir[File.dirname(__FILE__) + './lib/*.rb'].each { |file| require file}
require('./lib/type.rb')
require('./lib/ingredient.rb')

fruit = Type.create(description: "Fruit")
baking = Type.create(description: "Baking")
vegetable = Type.create(description: "Vegetables")
starches = Type.create(description: "Starches")
meat = Type.create(description: "Meat")
fake_meat = Type.create(description: "Fake Meat")

Ingredient.create(description: "Apple", type_id: fruit.id())
Ingredient.create(description: "Banana", type_id: fruit.id())
Ingredient.create(description: "Rhubarb", type_id: fruit.id())

Ingredient.create(description: "Cinnamon", type_id: baking.id())
Ingredient.create(description: "Sugar", type_id: baking.id())
Ingredient.create(description: "Flour", type_id: baking.id())

Ingredient.create(description: "Broccoli", type_id: vegetable.id())
Ingredient.create(description: "Kale", type_id: vegetable.id())
Ingredient.create(description: "Onion", type_id: vegetable.id())

Ingredient.create(description: "Pasta", type_id: starches.id())
Ingredient.create(description: "Rice", type_id: starches.id())
Ingredient.create(description: "Barley", type_id: starches.id())

Ingredient.create(description: "Carnitas", type_id: meat.id())
Ingredient.create(description: "Chicken", type_id: meat.id())
Ingredient.create(description: "Beef", type_id: meat.id())

Ingredient.create(description: "Tofurkey", type_id: fake_meat.id())
Ingredient.create(description: "Tofurkey Italian Sausage", type_id: fake_meat.id())
Ingredient.create(description: "Morning Star", type_id: fake_meat.id())
