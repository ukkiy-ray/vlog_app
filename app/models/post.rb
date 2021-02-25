class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :video

  validates :title, :video, presence: true
end
