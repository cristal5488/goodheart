class CreateAnalytics < ActiveRecord::Migration[5.1]
  def change
    create_table :analytics do |t|
      t.references :health_provider, foreign_key: true
      t.references :event, foreign_key: true
      t.time :arrival_time
      t.string :bloodtype

      t.timestamps
    end
  end
end
