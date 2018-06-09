class ChangeCompanyTable < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :revenue_code, :integer
  end
end
