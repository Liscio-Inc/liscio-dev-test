class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :text, null: false
      t.belongs_to :sender, foreign_key: {to_table: :users}
      t.date :edited_at

      t.timestamps
    end
  end
end
