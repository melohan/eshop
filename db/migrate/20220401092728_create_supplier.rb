class CreateSupplier < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :phoneNumber
    end
  end
end
