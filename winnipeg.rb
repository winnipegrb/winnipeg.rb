require 'rubygems'
require 'sinatra'
require 'hominid'
require 'active_support'

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

get '/events' do 
  @page_title = 'Upcoming Events'
  @events = %w(janurary_2011 november_2010 october_2010 september_2010 august_2010 july_2010)
  haml :events
end

get '/resources' do 
  @page_title = 'Resources'
  haml :resources
end