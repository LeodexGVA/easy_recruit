class CreateTimeSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :time_slots do |t|
      t.date :date
      t.time :time
      t.string :status
      t.references :application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
