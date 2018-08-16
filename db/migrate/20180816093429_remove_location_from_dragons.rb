class RemoveLocationFromDragons < ActiveRecord::Migration[5.2]
  def change
    remove_column :dragons, :location, :string
  end
end
