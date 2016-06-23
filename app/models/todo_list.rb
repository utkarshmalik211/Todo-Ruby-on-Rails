class TodoList < ApplicationRecord
  #validates :title, presence: true
  #validates :description, presence: true
  validates :title, length: {minimum:3}
  validates :description, length: {minimum:5}
end
