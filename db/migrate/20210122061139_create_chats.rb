class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: false
      t.string :status

      t.timestamps
    end
  end
end
