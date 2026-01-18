class Subscription
  SHORT_NAMES = %w[ FreeV1 ]

  def self.short_name
    name.demodulize
  end

  class FreeV1 < Subscription
    def self.proper_name
      "Free Subscription"
    end

    def self.price
      0
    end

    def self.frequency
      "yearly"
    end
  end
end
