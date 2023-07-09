# frozen_string_literal: true

require "sinatra"
require "frozen_record"
require "awesome_print"

class Meetup < FrozenRecord::Base
  self.base_path = File.join(__dir__, "data")
end

get "/" do
  @next_meeting = Meetup.last
  haml :index
end
