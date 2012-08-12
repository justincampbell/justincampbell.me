class Foursquare
  LIMIT = 250

  def self.burritos
    #checkins.keep_if { |checkin| is_burrito?(checkin) }

    [
      { venue: "Test1", createdAt: 1.day.ago },
      { venue: "Test2", createdAt: 2.days.ago },
      { venue: "Test1", createdAt: 3.days.ago },
      { venue: "Test1", createdAt: 7.days.ago },
      { venue: "Test2", createdAt: 8.days.ago },
      { venue: "Test1", createdAt: 11.days.ago },
      { venue: "Test3", createdAt: 14.days.ago },
      { venue: "Test1", createdAt: 17.days.ago },
      { venue: "Test3", createdAt: 23.days.ago },
      { venue: "Test1", createdAt: 24.days.ago },
      { venue: "Test2", createdAt: 30.days.ago },
      { venue: "Test4", createdAt: 30.days.ago },
      { venue: "Test1", createdAt: 31.days.ago },
      { venue: "Test2", createdAt: 32.days.ago }
    ]
  end

  def self.checkins
    Rails.cache.fetch("checkins") {
      result = []

      20.times do |iteration|
        items = client.user_checkins(limit: LIMIT, offset: iteration * LIMIT).items

        break if items.empty?

        result += items
      end

      result
    }
  end

  private

  def self.client
    @client ||= Foursquare2::Client.new oauth_token: ENV['FOURSQUARE_OAUTH_TOKEN']
  end

  def self.is_burrito?(checkin)
    return unless checkin.venue

    checkin.venue.categories.collect(&:name).any? { |category|
      category =~ /Burrito|Mexican/
    }
  end
end
