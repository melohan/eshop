class CreateOrderItem < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.decimal :item_price, precision: 10, scale: 2
      t.references :order, foreign_key: { on_delete: :cascade }
      t.references :product, foreign_key: true
    end
  end
end