class CreateClient < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :firstname, limit: 60
      t.string :lastname, limit: 60
    end
  end
end
