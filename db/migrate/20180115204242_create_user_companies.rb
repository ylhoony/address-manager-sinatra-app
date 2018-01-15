class CreateUserCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :user_companies do |t|
      t.integer :user_id
      t.integer :company_id
      t.boolean :is_owner
    end
  end
end
