class CreateJobOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :job_offers do |t|
      t.string :title
      t.string :industry
      t.string :description
      t.string :address
      t.string :skills
      t.string :requirements
      t.string :contract_type
      t.date :start_date
      t.date :end_date
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
