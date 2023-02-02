class Post < ApplicationRecord
	belongs_to :user, optional: true

	def user_email
		self.user&.email
	end
end
