class RemoveNameColumn < ActiveRecord::Migration[5.1]
  def change
    change_table :company_contacts do |t|
      t.remove :name
    end
  end
end
