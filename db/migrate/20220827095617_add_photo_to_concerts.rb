class AddPhotoToConcerts < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :photo, :string
  end
end
