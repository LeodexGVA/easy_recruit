class AddIndustryToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :industry, :string
  end
end
