Unsplash.configure do |config|    
  config.application_id     = ENV['UNSPLASH_ID']   
  config.application_secret = ENV['UNSPLASH_SECRET']
  config.application_redirect_uri = ENV['UNSPLASH_URI']
end