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

	has_many(
		:visits,
		foreign_key: :user_id,
		primary_key: :id,
		class_name: :Visitor
	)

	has_many :visited_urls, through: :visits, source: :shortened_url

end