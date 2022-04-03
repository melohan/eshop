class AddSupplierForeignKeyToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :supplier, foreign_key: { on_delete: :nullify, on_update: :cascade }
  end
end