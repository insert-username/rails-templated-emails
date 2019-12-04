class CreateTemplatedEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :templated_emails do |t|
      t.string :sender_name
      t.string :destination_email
      t.belongs_to :message_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
