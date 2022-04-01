class InheritCompanyFromClient < ActiveRecord::Migration[7.0]
  def change
    change_table :clients do |t|
      t.string :brand, limit: 120
    end
  end
end
