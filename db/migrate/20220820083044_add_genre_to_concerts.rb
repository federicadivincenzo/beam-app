class AddGenreToConcerts < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :genre, :string
  end
end
