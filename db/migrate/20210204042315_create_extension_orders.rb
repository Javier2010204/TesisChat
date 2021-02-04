class CreateExtensionOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :extension_orders do |t|
      t.date :extension_date
      t.references :order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :receiver, null: false, foreign_key: false
      t.string :status

      t.timestamps
    end
  end
end
