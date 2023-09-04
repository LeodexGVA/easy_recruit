class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :address, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :phone, :string
    add_column :users, :admin, :boolean
  end
end
