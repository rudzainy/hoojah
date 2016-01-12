# require 'elasticsearch/model'

class Opinion < ActiveRecord::Base
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

	belongs_to :user
	has_many :comments
	has_many :votes
	has_many :debates

	validates :user_id, :category_id, :option1, :option2, presence: true
	default_scope -> { order(created_at: :desc) }

	def hide
	  self.update(disable: true)
	end

	def show
	  self.update(disable: false)
	end

	def self.search(query)
	  __elasticsearch__.search(
	  {
	    query: {
		multi_match: {
		  query: query,
		  fields: ['title^10','text']
	      }
		},
		highlight: {
		  pre_tags: ['<em>'],
		  post_tags: ['</em>'],
		    fields: {
			  title: {},
			  text: {}
		    }
		  }
	    }
	)
	end

	# settings index: { number_of_shards: 1 } do
	#   mappings dynamic: 'false' do
	#   	indexes :title, analyzer: 'english', index_options: 'offsets'
	#   	indexes :text, analyzer: 'english'
	#   end
	# end

	# Select featured Opinions to show on index page
end

	# Delete the previous opinion index in Elasticsearch

	# Opinion.__elasticsearch__.client.indices.delete index: Opinion.index_name rescue nil

	# Create the new index with the new mapping

	# Opinion.__elasticsearch__.client.indices.create \
	#   index: Opinion.index_name,
	#   body: { settings: Opinion.settings.to_hash, mappings: Opinion.mappings.to_hash }

 #    #index all opinion records from db to Elasticsearch
 #    Opinion.import