class CategoriesController < ApplicationController
	before_action :set_category, only: :name

	def add
		@category = Category.new
		@categories = Category.all
	end

	def create
		@category = Category.new(category_params)
		if Category.where(name: @category.name).any?
			redirect_to 'categories/add', notice: 'Category already existed.'
		elsif @category.save
			@categories = Category.all
			redirect_to 'categories/add', notice: 'Category added.'
		else
			redirect_to 'categories/add', notice: 'Error creating category.'
		end
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end
end
