class TodoList < ApplicationRecord
  validates :title, presence: true
  #validates :description, absence: true
end
