# frozen_string_literal: true

require "sinatra"
require "frozen_record"

class Meetup < FrozenRecord::Base
  self.base_path = File.join(__dir__, "data")

  def formatted_time
    time.strftime("%B %d, %Y @ %l%P").sub("  ", " ")
  end

  class << self
    def current
      where(time: Time.now..).last
    end
  end
end

get "/" do
  @next_meeting = Meetup.current
  haml :index
end
