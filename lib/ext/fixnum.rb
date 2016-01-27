class Fixnum
	def percentage_of(votes)
		self.to_f / votes.to_f * 100
	end
end