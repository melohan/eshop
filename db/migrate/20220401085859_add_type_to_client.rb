class AddTypeToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :type, :string, :after => :id
  end
end
