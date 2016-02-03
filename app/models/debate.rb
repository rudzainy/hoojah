class Debate < ActiveRecord::Base
	belongs_to :opinion
	has_many :users
	has_many :hoojahs

	def user_pro
		User.find(self.user_pro_id)
	end

	def user_con
		User.find(self.user_con_id)
	end

	def current_hoojah
		self.hoojahs.count
	end
end