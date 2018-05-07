class CreateTextMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :text_messages do |t|
      t.string :name
      t.string :phone
      t.string :message

      t.timestamps
    end
  end
end
