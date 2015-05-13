class CreateCategoriesRecipes < ActiveRecord::Migration
  def change
    create_table(:categories_recipes) do |t|
      t.column(:recipe_id, :integer)
      t.column(:category_id, :integer)
    end
  end
end
