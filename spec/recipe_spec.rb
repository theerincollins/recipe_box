require('spec_helper')

describe Recipe do

  describe('#ingredients') do
    it("will return ingredients in a recipe") do
      recipe = Recipe.create(title: "Banana Pancakes", instructions: "1. Mash Bananas 2.Make Pancakes")
      ingredient = Ingredient.create(description: "1 Banana", recipe_ids: [recipe.id])
      ingredient2 = Ingredient.create(description: "Flour", recipe_ids: [recipe.id])
      expect(recipe.ingredients()).to(eq([ingredient, ingredient2]))
    end
  end

  it('validates the presence of a title') do
    recipe = Recipe.new(title: "")
    expect(recipe.save()).to(eq(false))
  end

  describe("#categories") do
    it("returns the category of a recipe") do
      category = Category.create(description: "Breakfast in Bed")
      recipe = Recipe.new({:category_ids => [category.id()]})
      expect(recipe.categories).to(eq([category]))
    end
  end

  describe('#total_time') do
    it("calculates the total time to prepare and cook a recipe") do
      recipe = Recipe.create(title: "Banana Pancakes", instructions: "1. Mash Bananas 2.Make Pancakes", prep_time: '10 minutes', cook_time: '3 minutes')
      expect(recipe.total_time).to(eq(13))
    end
  end
end
