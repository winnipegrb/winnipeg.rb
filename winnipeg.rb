require 'rubygems'
require 'bundler'
Bundler.require
require 'sinatra'
require 'active_support/core_ext/string'

configure :production do
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
  mailchimp = Hominid::API.new(ENV['MAILCHIMP_API_KEY'])
  begin
    @newsletter_saved = mailchimp.list_subscribe('bf885d7bf8', params[:email], [], 'html', false, true, true, false)
  rescue Hominid::APIError
    @newsletter_saved = false
  end
  haml :index
end

get '/live' do
  @page_title = 'Live Event Stream'
  haml :live
end

get '/events' do 
  @page_title = 'Upcoming Events'
  @events = %w(october_2011 september_2011 august_2011 june_2011 may_2011 april_2011 march_2011 february_2011 janurary_2011 november_2010 october_2010 september_2010 august_2010 july_2010)
  haml :events
end

get '/resources' do 
  @page_title = 'Resources'
  haml :resources
end
