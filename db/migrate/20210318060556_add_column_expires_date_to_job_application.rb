class AddColumnExpiresDateToJobApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :expires_date, :datetime
    add_column :job_applications, :counter, :integer
  end
end
