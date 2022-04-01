class CreateOrder < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :created_at
      t.datetime :shipped_at
      t.string :status, limit: 20
      t.references :client, foreign_key: true, type: :bigint
    end
  end
end
