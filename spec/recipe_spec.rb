require('spec_helper')

describe Recipe do

  describe('#ingredients') do
    it("will return ingredients in a recipe") do
      recipe = Recipe.create(title: "Banana Pancakes", instructions: "1. Mash Bananas 2.Make Pancakes")
      ingredient = Ingredient.create(description: "1 Banana", recipe_id: recipe.id)
      ingredient2 = Ingredient.create(description: "Flour", recipe_id: recipe.id)
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
      # new_recipe = Recipe.create(title: "Banana Pancakes", instructions: "1. Mash Bananas 2.Make Pancakes")
      # category.recipes.push(new_recipe)
      expect(recipe.categories).to(eq([category]))
    end
  end
end
