class AddTicketToConcert < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :ticket, :string, default: "No tickets available."
  end
end
