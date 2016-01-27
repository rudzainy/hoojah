class Debate < ActiveRecord::Base
	belongs_to :opinion
	has_many :users
	has_many :hoojahs
end