class VotesController < ApplicationController
	before_action :find_opinion
	before_action :authenticate
	#user can upvote a post
	def vote
		if vote_none
			@vote = @opinion.votes.create(user_id: current_user.id, flag: params[:flag])
		elsif vote_same
			unvote
		else
			@vote = @opinion.votes.find_by(user_id: current_user.id)
			@vote.update(flag: params[:flag])
		end

		# byebug
		# respond_to do |format|
		# 	format.js
		# end
		redirect_to :back
	end

	#user can unvote
	def unvote
		delete_vote = @opinion.votes.find_by(user_id: current_user.id)
		p delete_vote
		delete_vote.destroy
	end

	#but user can only vote a post once
	private
	def find_opinion
		@opinion = Opinion.find(params[:id])
	end

	def vote_none
		if @opinion.votes.where(user_id: current_user.id).any?
			false
		else
			true
		end
	end

	def vote_same
		# if @opinion.votes.where("user_id: current_user.id AND flag: params[:flag]").any?
		if Vote.where("opinion_id = #{@opinion.id} AND user_id = #{current_user.id} AND flag = #{params[:flag]}").any?
			true
		else
			false
		end
	end

	#user need to login to vote
	def authenticate
		if not current_user.nil?
			true
		else
			redirect_to new_user_session_path
		end
	end
end
