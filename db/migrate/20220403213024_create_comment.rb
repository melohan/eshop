class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :author, foreign_key: { to_table: :clients, on_delete: :nullify, on_update: :cascade }
      t.references :target, polymorphic: true
      t.timestamps
    end
  end
end