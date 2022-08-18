class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.string :artist
      t.date :date
      t.string :address
      t.string :venue
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
