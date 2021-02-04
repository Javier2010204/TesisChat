class HomeworkReview < ApplicationRecord
  belongs_to :editor, class_name: "User"
  belongs_to :homework
end
