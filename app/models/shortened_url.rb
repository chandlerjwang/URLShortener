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

	has_many(
		:visits,
		foreign_key: :shortened_url_id,
		primary_key: :id,
		class_name: :Visitor
	)

	has_many :visitors, through: :visits, source: :user
	has_many :distinct_visitors,
		Proc.new { distinct },
		through: :visits,
		source: :user


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

	def num_clicks
		self.visits.count
	end

	def num_uniques
		# self.visitors.distinct.count(:user_id)
		self.distinct_visitors.count
	end

	def num_recent_uniques
		self.visits.where("created_at > ?", 10.minutes.ago).distinct.count(:user_id)
	end
end