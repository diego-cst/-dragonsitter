class AddNewPhotoToDragons < ActiveRecord::Migration[5.2]
  def change
    add_column :dragons, :photo_first, :string
  end
end
