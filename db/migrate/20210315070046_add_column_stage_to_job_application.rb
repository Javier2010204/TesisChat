class AddColumnStageToJobApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :stage, :string, default: "tesis o equivalente"
  end
end
