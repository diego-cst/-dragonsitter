class AddAddressToDragons < ActiveRecord::Migration[5.2]
  def change
    add_column :dragons, :address, :text
  end
end
