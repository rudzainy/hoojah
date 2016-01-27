# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'slim'
require 'carrierwave/orm/activerecord'
require 'ext/fixnum'

# Initialize the Rails application.
Rails.application.initialize!