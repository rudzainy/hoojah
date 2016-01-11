class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_opinion, only: [:create]
	before_action :find_comment, only: [:edit, :update, :destroy, :disable, :enable]
	before_action :find_comment_opinion, only: [:edit,:update, :destroy, :disable, :enable]

	def index
	  @comments = Comment.all
	end

	def new
	  @comment = Comment.new
	  respond_to do |format|
	    format.html
	    format.js
	  end
	end

	def create
	  respond_to do |format|
	    if current_user.nil? 
	      format.html{render :new}
		else
	      @comment = current_user.comments.new(comment_params)	        
	      if @comment.save!
			format.html { redirect_to @opinion,
			              notice: "#{current_user.name}, you\'ve joined in the discussion!" }
			format.js
		  else 
			format.html {render :new}
		  end
		end
	  end
	end

	def edit
	end

	def update
	  if @comment.update_attributes(comment_params)
	    respond_to do |format|
          format.html {redirect_to @opinion, notice: "You've updated the comment."}
     	  format.js
        end
      end
	end

	def destroy
	  if @comment.destroy
	    respond_to do |format|
	      format.html {redirect_to @opinion, notice: "You've deleted a comment from #{@comment.user.name}."}
	  	  format.js
	    end
	  end
	end

	def disable
	  if @comment.hide
        respond_to do |format|
          format.html {redirect_to @opinion, notice: "The comment from #{@comment.user.name} is now hidden."}
          format.js
        end
      end
	end

	# def enable
	#  if @comment.show
 #        respond_to do |format|
 #          format.html {redirect_to @opinion, notice: "The comment from #{@comment.user.name} is now shown."}
 #          format.js
 #        end
 #      end
	# end

	private

	def find_comment_opinion
	  @opinion = Opinion.find_by(id: @comment.opinion_id)
	end


	def find_opinion
	  @opinion = Opinion.find(params[:comment][:opinion_id])
	end

	def find_comment
	  @comment = Comment.find_by(id: params[:id])
	end

	def comment_params
		params.require(:comment).permit(:text, :opinion_id)
	end

end
