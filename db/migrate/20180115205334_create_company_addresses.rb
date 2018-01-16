class CreateCompanyAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :company_addresses do |t|
      t.integer :company_id
      t.string :name
      t.string :dba
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.integer :country_id
      t.string :postal_code
      t.string :email
      t.string :phone
      t.boolean :is_billing_address
      t.boolean :is_shipping_address
      t.integer :company_contact_id      
    end
  end
end
