require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-validations'
require File.expand_path(File.join(File.dirname(__FILE__), '/models/newsletter.rb'))

configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
  
  not_found do
    @page_title = '404 Not Found'
    haml :not_found
  end

  error do
    'A fatal error occured :('
  end
end

get '/' do 
  haml :index
end

post '/' do
  n = Newsletter.new(:email => params[:email])
  n.save ? (@newsletter_saved = true) : (@newsletter_error = true)
  haml :index
end

get '/events' do 
  @page_title = 'Upcoming Events'
  haml :events
end

get '/resources' do 
  @page_title = 'Resources'
  haml :resources
end

get '/googlehostedservice.html' do
  "googlefffffffff1b6b43c"
end