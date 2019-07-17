class Post < ApplicationRecord
  has_many :comments, dependet: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
end
