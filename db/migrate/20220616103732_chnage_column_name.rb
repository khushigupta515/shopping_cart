class ChnageColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :img, :avatar
  end
end
