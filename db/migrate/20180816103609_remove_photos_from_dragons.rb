class RemovePhotosFromDragons < ActiveRecord::Migration[5.2]
  def change
    remove_column :dragons, :photos, :string
  end
end
