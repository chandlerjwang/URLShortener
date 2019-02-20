class ShortenedUrl < ApplicationRecord
	validates :short_url, presence: true
	validates :user_id, presence: true
	validates :short_url, uniqueness: true

	belongs_to(
		:submitter,
		primary_key: :id,
		foreign_key: :user_id,
		class_name: :User
	)


	def self.random_code
		short_url = SecureRandom::urlsafe_base64
		while self.exists?(:short_url => short_url)
			short_url = SecureRandom::urlsafe_base64
		end
		short_url
	end

	def self.create!(user, long_url)
		n = ShortenedUrl.new(user_id: user.id, long_url: long_url)
		n.short_url = ShortenedUrl.random_code
		n.save
	end
end