require('spec_helper')

describe Ingredient do

  describe('#recipe') do
    it("will return the recipe that the ingredients are in") do
      recipe = Recipe.create(title: "Banana Pancakes", instructions: "1. Mash Bananas")
      ingredient = Ingredient.create(description: "1 banana", recipe_id: recipe.id)
      expect(ingredient.recipe()).to(eq(recipe))
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

end
