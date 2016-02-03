class DebatesController < ApplicationController
	# before_action :authenticate_user!
	before_action :find_opinion, only: [:new, :create, :show, :destroy]
	before_action :find_debate, only: [:show, :disable, :destroy]

	def disable
	  if @debate.hide
      respond_to do |format|
        format.html {redirect_to @opinion, notice: "The comment from #{@comment.user.name} is now hidden."}
        format.js
      end
    end
	end

	def new
		@debate = Debate.new
	end

	def create

		@debate = @opinion.debates.new(post_params)

		if @debate.save
			redirect_to [@opinion, @debate], notice: 'Invitation sent!'
			user = User.find(@debate.user_con_id)
			user.invitations.create(sender_id: current_user.id, debate_id: @debate.id)
		else
			render 'edit'
		end
	end

	def edit
		@debate = find_debate
	end

	def destroy
	  if @debate.destroy
	    respond_to do |format|
	      format.html {redirect_to @opinion, notice: "You've deleted a debate from #{@debate.user.name}."}
	  	  format.js
	    end
	  end
	end

	def show
		@comments = Comment.where(opinion_id: @opinion)
		@comment = Comment.new
	end

	private

	def find_opinion
		@opinion = Opinion.find(params[:opinion_id])
	end

	def find_debate
		@debate = Debate.find(params[:id])
	end

	def post_params
		params.require(:debate).permit(:opinion_id, :user_pro_id, :user_con_id, :deadline, :winner_id, :disable)
	end
end
