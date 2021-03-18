class AddColumnStageToProgress < ActiveRecord::Migration[6.0]
  def change
    add_column :progresses, :stage, :string, default: "tesis o equivalente"
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
