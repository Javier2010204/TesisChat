class CreateMounts < ActiveRecord::Migration[6.0]
  def change
    create_table :mounts do |t|
      t.decimal :quantity, precision: 8, scale: 2, default: 0.0
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
