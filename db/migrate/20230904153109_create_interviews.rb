class CreateInterviews < ActiveRecord::Migration[7.0]
  def change
    create_table :interviews do |t|
      t.string :status
      t.references :time_slot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
