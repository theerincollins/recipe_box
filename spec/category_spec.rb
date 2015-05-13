require('spec_helper')


describe Category do

  describe('#recipes') do
    it('returns the recipe of a category') do
      recipe = Recipe.create(title: "Banana Pancakes", instructions: "mash bananas")
      category = Category.new({:recipe_ids => [recipe.id()]})
      expect(category.recipes).to(eq([recipe]))
    end
  end
end
