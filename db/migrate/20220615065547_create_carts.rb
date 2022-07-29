class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string :title
      t.float :total
      t.string :number

      t.timestamps
    end
  end
end
