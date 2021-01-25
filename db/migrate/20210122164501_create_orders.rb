class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :receiver, null: false, foreign_key: false
      t.references :chat, null: false, foreign_key: true
      t.date :date
      t.text :body
      t.string :status

      t.timestamps
    end
  end
end
