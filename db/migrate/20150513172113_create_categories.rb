class CreateCategories < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.column(:description, :string)
    end
  end
end
