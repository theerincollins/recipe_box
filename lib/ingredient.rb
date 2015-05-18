class Ingredient < ActiveRecord::Base

  has_and_belongs_to_many(:recipes)

  validates(:description, :presence => true)

  belongs_to(:type)

  define_singleton_method(:can_make) do
    recipes_to_make = []
    recipes = Recipe.all
    a = Ingredient.all
    recipes.each do |recipe|
      b = recipe.ingredients
      c = a-b
      if (b-c).empty?
       recipes_to_make.push(recipe)
      end
      recipes_to_make
    end
  end

end
