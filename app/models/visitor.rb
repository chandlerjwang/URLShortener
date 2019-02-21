class Visitor < ApplicationRecord
	validates :user_id, presence: true
	validates :shortened_url_id, presence: true

	belongs_to(
		:user,
		primary_key: :id,
		foreign_key: :user_id,
		class_name: :User
	)

	belongs_to(
		:shortened_url,
		primary_key: :id,
		foreign_key: :shortened_url_id,
		class_name: :ShortenedUrl
	)

	def self.record_visit!(user, shortened_url)
		user_id = user.id
		shortened_url_id = shortened_url.id
		n = Visitor.new(user_id: user_id, shortened_url_id: shortened_url_id)
		n.save!
	end
end