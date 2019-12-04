class CreateMessageTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :message_templates do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
