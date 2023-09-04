class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
