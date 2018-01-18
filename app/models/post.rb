class Post < ApplicationRecord
	has_many :comments, dependent: :destroy #making association to post. if post gets deleted, comment gets deleted from database as well.
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true
end
