require "frozen_record"

class ::Meetup < FrozenRecord::Base
  self.base_path = File.join(__dir__, "db", "data")

  def formatted_time
    time.strftime("%B %d, %Y @ %l%P").sub("  ", " ")
  end

  class << self
    def current
      where(time: Time.now..).last
    end
  end
end

FrozenRecord::Base.auto_reloading = true 

set :layout, false

helpers do
  def next_meeting
    @next_meeting ||= Meetup.current
  end
end
