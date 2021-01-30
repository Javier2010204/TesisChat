class CreateExtensions < ActiveRecord::Migration[6.0]
  def change
    create_table :extensions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat, null: false, foreign_key: true
      t.references :receiver, null: false, foreign_key: true
      t.string :status
      t.date :date

      t.timestamps
    end
  end
end
