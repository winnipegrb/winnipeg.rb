# frozen_string_literal: true

require "frozen_record"
require "kramdown"

class ::Meetup < FrozenRecord::Base
  self.base_path = File.join(__dir__, "db", "data")

  def formatted_time
    time.strftime("%B %d, %Y @ %l:%M%P").sub("  ", " ")
  end

  def description_html
    Kramdown::Document.new(description).to_html
  end

  class << self
    def current
      where(time: Time.now..).last
    end
  end
end

FrozenRecord::Base.auto_reloading = true

helpers do
  def next_meeting
    @next_meeting ||= Meetup.current
  end
end
