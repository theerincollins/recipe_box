require('spec_helper')

describe Ingredient do

  describe('#recipes') do
    it("will return the recipe that the ingredients are in") do
      recipe = Recipe.create(title: "Banana Pancakes", instructions: "1. Mash Bananas")
      ingredient = Ingredient.create(description: "1 banana", recipe_ids: [recipe.id])
      expect(ingredient.recipes()).to(eq([recipe]))
    end
  end

  it('validates the presence of a description') do
    ingredient = Ingredient.new(description: "")
    expect(ingredient.save()).to(eq(false))
  end

  describe('#type') do
    it("will return the ingredient type of an ingredient") do
      fruit = Type.create(description: "Fruit")
      ingredient = Ingredient.create(description: "1 banana", type_id: fruit.id)
      expect(ingredient.type()).to(eq(fruit))
    end
  end

  describe('.can_make') do
    it('will return the recipes that you can make with the availble ingredients') do
      fruit = Type.create(description: "Fruit")
      ingredient = Ingredient.create(description: "banana", type_id: fruit.id)
      recipe = Recipe.create(title: "Banana Pancakes",
      instructions: "1. Mash Bananas 2.Make Pancakes", prep_time: '10 minutes',
      cook_time: '3 minutes', ingredient_ids: [ingredient.id])
      expect(Ingredient.can_make).to(eq([recipe])) 
    end
  end

end
