class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.integer :minimum_quota
      t.integer :numbers
      t.references :job_offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
