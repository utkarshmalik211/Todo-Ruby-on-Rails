class TodoItem < ApplicationRecord
  belongs_to :todo_list
  validates :content, presence:true
  validates :content, length: {minimum:3}
end
