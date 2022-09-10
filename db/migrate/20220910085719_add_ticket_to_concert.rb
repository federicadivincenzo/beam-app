class AddTicketToConcert < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :ticket, :string
  end
end
