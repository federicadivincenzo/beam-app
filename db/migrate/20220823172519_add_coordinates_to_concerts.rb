class AddCoordinatesToConcerts < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :latitude, :float
    add_column :concerts, :longitude, :float
  end
end
