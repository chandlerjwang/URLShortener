class User < ApplicationRecord
	validates :email, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :email, uniqueness: true

	has_many(
		:submitted_urls,
		primary_key: :id,
		foreign_key: :user_id,
		class_name: :ShortenedUrl
	)

end