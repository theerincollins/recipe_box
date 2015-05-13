class CreateIngredients < ActiveRecord::Migration
  def change
    create_table(:ingredients) do |t|
      t.column(:description, :string)
      t.column(:recipe_id, :integer)
    end
  end
end
