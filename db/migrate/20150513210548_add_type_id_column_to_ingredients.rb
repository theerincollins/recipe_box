class AddTypeIdColumnToIngredients < ActiveRecord::Migration
  def change
    add_column(:ingredients, :ingredient_types_id, :integer)
  end
end
