class CreateHomeworkReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :homework_reviews do |t|
      t.string :status
      t.references :editor, null: false, foreign_key: false
      t.references :homework, null: false, foreign_key: true

      t.timestamps
    end
  end
end
