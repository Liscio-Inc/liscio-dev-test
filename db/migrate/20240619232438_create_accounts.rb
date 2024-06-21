class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :address
      t.string :company_type, null: false

      t.timestamps
    end
  end
end
