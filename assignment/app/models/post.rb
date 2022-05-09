class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 200}
  validates :description, presence: true, length: {minimum: 10}

  belongs_to :user
  
end
