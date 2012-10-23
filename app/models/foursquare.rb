class Foursquare
  LIMIT = 250
  RANGE = 1.year

  class Checkin
    attr_accessor :checkin

    def initialize(raw_checkin)
      self.checkin = raw_checkin
    end

    def as_json(options = {})
      {
        date: date,
        venue: venue
      }
    end

    def categories
      checkin.venue.categories.collect(&:name).join(", ") if checkin.venue
    end

    def date
      checkin.createdAt
    end

    def venue
      checkin.venue.name
    end
  end

  def self.burritos
    checkins.keep_if { |checkin| is_burrito? checkin }
  end

  def self.checkins
    Rails.cache.fetch("checkins") {
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
