class CreateProduct < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 50
      t.decimal :price, precision: 8, scale: 2
      t.string :description, limit: 300
      t.references :category, foreign_key: true, type: :bigint
    end
  end
end
