class AddColumnExtensionDateToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :extension_date, :date
  end
end
