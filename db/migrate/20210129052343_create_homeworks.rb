class CreateHomeworks < ActiveRecord::Migration[6.0]
  def change
    create_table :homeworks do |t|
      t.references :chat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :receiver, null: false, foreign_key: false
      t.string :status

      t.timestamps
    end
  end
end
