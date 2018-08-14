class AddPhotoToDragons < ActiveRecord::Migration[5.2]
  def change
    add_column :dragons, :photo, :string
  end
end
