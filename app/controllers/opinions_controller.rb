class OpinionsController < ApplicationController
	before_action :find_opinion, only: [:show, :update, :destroy, :disable]
	helper VotesHelper

	# Disable an Opinion post
	def disable
		@opinion = Opinion.find(params[:id])
		@opinion.disable = 1
		if @opinion.save
			redirect_to @opinion, notice: 'Post has been disabled!'
		else
			redirect_to @opinion, notice: 'Error disabling post!'
		end
	end

	# Enable an Opinion post
	def enable
		@opinion = Opinion.find(params[:id])
		@opinion.disable = 0
		if @opinion.save
			redirect_to @opinion, notice: 'Post has been enabled!'
		else
			redirect_to @opinion, notice: 'Error enabling post!'
		end
	end

	# Destroys an Opinion post
	def destroy
		@opinion.destroy
		redirect_to root_path
	end

	# Open search image page for Unsplash
	def search_image
		# @search_image = Opinion.new
		@search_results = []
	end

	# # Query image from Unsplash
	# def query_image
	# 	@search_results = Unsplash::Photo.search(params[:search], rand(1..2), 20)
	# 	render 'search_image'
	# end

	# Query to use with jquery later later later
	def query_image
		@js_custom_turbolink = { 'turbolinks-track' => true, "turbolinks-eval" => false } 
		
		returned = Unsplash::Photo.search(params[:search], rand(1..2), 20)
		@search_results = []
		returned.each do |image|
			@search_results << image.urls
		end
		render json: @search_results
	end

	# Index of hoojah
	def index
		@opinion = Opinion.limit(15)
	end

	# View individual Opinion post
	def show
		@comments = Comment.where(opinion_id: @opinion)
		@comment = Comment.new
		@debates = Debate.where(opinion_id: @opinion.id)
	end

	# Page to create new Opinion post
	def new
		@opinion = current_user.opinions.new
	end

	# Edit an Opinion post
	def edit
		@opinion = find_opinion
	end 

	# Updates an Opinion post
	def update
		if @opinion.update(post_params)
			redirect_to @opinion, notice: 'Post updated!'
		else
			render 'edit'
		end
	end

	# Creates new Opinion post
	def create
		@opinion = current_user.opinions.new(post_params)

		if @opinion.save
			redirect_to @opinion, notice: 'Successfully created post!'
		else
			render 'new'
		end
	end

	def disable
	  if @opinion.hide
        respond_to do |format|
          format.html {redirect_to @opinion, notice: "The opinion from #{@opinion.user.name} is now hidden."}
          format.js
        end
      end
	end

	private

	def find_opinion
		@opinion = Opinion.find(params[:id])
	end

	def post_params
		params.require(:opinion).permit(:user_id, :category_id, :title, :image, :option1, :option2, :disable)
	end
end
