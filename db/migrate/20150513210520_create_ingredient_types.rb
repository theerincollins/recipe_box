class CreateIngredientTypes < ActiveRecord::Migration
  def change
      create_table(:ingredient_types) do |t|
        t.column(:description, :string)
      end
  end
end
