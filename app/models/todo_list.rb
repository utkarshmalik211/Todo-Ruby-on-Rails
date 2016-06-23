class TodoList < ApplicationRecord
  validates :title, presence: true
  #validates :description, absence: true
  validates :title, length: {minimum:3}
end
