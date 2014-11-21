module SupermarketApi
  class StoreCity
    attr_accessor :city, :state

    def initialize(attrs = {})
      attrs.each do |key, val|
        public_send("#{key}=", val)
      end
    end

    def state=(val)
      @state = val.is_a?(String) ? val.upcase : val
    end

    def to_s
      [city, state].compact.join(', ')
    end

    def inspect
      descriptions = [:city, :state].map do |attr|
        [attr, public_send(attr).inspect].join('=')
      end

      "#<#{self.class} #{descriptions.join(' ')}>"
    end
  end
end
