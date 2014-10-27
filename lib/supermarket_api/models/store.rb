module SupermarketApi
  class Store
    attr_accessor :id, :name, :address, :city, :state, :zip, :phone

    def initialize(attrs = {})
      attrs.each do |key, val|
        public_send("#{key}=", val)
      end
    end

    def state=(val)
      @state = val.is_a?(String) ? val.upcase : val
    end

    def to_s
      city_state = [city, state].compact.join(', ')
      city_state_zip = [city_state, zip].compact.join(' ')
      [name, address, city_state_zip].compact.join("\n")
    end

    def inspect
      descriptions = [:id, :name, :address, :zip].map do |attr|
        [attr, public_send(attr).inspect].join('=')
      end

      "#<#{self.class} #{descriptions.join(' ')}>"
    end
  end
end
