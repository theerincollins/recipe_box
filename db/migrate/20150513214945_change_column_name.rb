class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column(:ingredients, :ingredient_types_id, :type_id)
  end
end
