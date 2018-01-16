class CreateCompanyContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :company_contacts do |t|
      t.integer :company_id
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
    end
  end
end
