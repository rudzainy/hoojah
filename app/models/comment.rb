class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :opinion
	default_scope -> { order(created_at: :desc) }
	validates :text, :user_id, :opinion_id, presence: true

	def hide
	  self.update(disable: true)
	end

	def show
	  self.update(disable: false)
	end

end