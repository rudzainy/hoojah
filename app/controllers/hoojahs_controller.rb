class HoojahsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_debate, only: [:new, :create, :destroy]
	before_action :find_opinion, only: [:create, :destroy]
	# before_action :find_hoojah, only: [:show, :disable, :destroy]

	def new
	  @hoojah = Hoojah.new
	end

	def create
		@hoojah = @debate.hoojahs.new(hoojah_params)

		if @hoojah.save
			redirect_to [@opinion, @debate], notice: 'Posted!'
		else
			render 'new', notice: 'Error!'
		end
	end

	def edit
		@hoojah = find_debate
	end

	def destroy
	  if @hoojah.destroy
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
	  @opinion = Opinion.find(@debate.opinion_id)
	end


	def find_debate
	  @debate = Debate.find(params[:debate_id])
	end

	def find_comment
	  @hoojah = Hoojah.find(params[:id])
	end

	def hoojah_params
		params.require(:hoojah).permit(:debate_id, :body, :user_id)
	end
end
