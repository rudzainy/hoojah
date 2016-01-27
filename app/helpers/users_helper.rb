module UsersHelper

	def check_and_fill(data)
		unless data.nil?
			data
		else
			"This field is empty"
		end
	end

	def find_debate(user)
		@debates = []

		Debate.where(user_pro_id: user.id).each do |debate|
			@debates << debate
		end

		Debate.where(user_con_id: user.id).each do |debate|
			@debates << debate
		end

		@debates
	end

end
