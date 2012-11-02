class Foursquare
  LIMIT = 250
  RANGE = 1.year

  class Checkin
    attr_accessor :checkin

    def initialize(raw_checkin)
      self.checkin = raw_checkin

      # Get what we need and trash the rest
      %w[categories date venue].each { |method| self.send method }
      self.checkin = nil
    end

    def as_json(options = {})
      {
        date: date,
        venue: venue
      }
    end

    def categories
      @categories ||= checkin.venue ? checkin.venue.categories.collect(&:name).join(", ") : ""
    end

    def date
      @date ||= checkin.createdAt or ""
    end

    def venue
      @venue ||= checkin.venue ? checkin.venue.name : ""
    end
  end

  def self.burritos
    checkins.keep_if { |checkin| is_burrito? checkin }
  end

  def self.checkins
    Rails.cache.fetch("checkins", expires_in: 15.minutes) {
      result = []

      10.times do |iteration|
        items = client.user_checkins(
          afterTimestamp: RANGE.ago.to_i,
          limit: LIMIT,
          offset: iteration * LIMIT
        ).items

        result += items

        break if items.count < LIMIT
      end

      result.map { |checkin| Checkin.new checkin }
    }
  end

  private

  def self.client
    @client ||= Foursquare2::Client.new oauth_token: ENV['FOURSQUARE_OAUTH_TOKEN']
  end

  def self.is_burrito?(checkin)
    checkin.categories.match /Burrito|Mexican/ if checkin.categories
  end
end
