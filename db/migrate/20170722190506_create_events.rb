class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.belongs_to :health_provider, foreign_key: true
      t.string :event_name
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :description
      t.string :address
      t.string :zipcode
      t.string :bloodtype
      t.string :phone

      t.timestamps
    end
  end
end
