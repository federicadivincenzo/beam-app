class CreateUserModels < ActiveRecord::Migration[6.1]
  def change
    create_table :user_models do |t|
      t.references :user, null: false, foreign_key: true
      t.references :concert, null: false, foreign_key: true

      t.timestamps
    end
  end
end
