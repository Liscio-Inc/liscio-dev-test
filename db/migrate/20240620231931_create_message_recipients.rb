class CreateMessageRecipients < ActiveRecord::Migration[7.1]
  def change
    create_table :message_recipients do |t|
      t.belongs_to :message, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
