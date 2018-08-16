class AddAdditionalPhotoToDragon < ActiveRecord::Migration[5.2]
  def change
    add_column :dragons, :photo_second, :string
    add_column :dragons, :photo_third, :string
  end
end
