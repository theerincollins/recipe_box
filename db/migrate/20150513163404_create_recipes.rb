class CreateRecipes < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:instructions, :string)
      t.column(:title, :string)
    end
  end
end
