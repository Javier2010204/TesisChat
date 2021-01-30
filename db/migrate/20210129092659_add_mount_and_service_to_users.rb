class AddMountAndServiceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mount, :decimal, :default => 0.0
    add_column :users, :type_service, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end