module SupermarketApi
  class StoreState
    attr_accessor :state

    def initialize(attrs = {})
      attrs.each do |key, val|
        public_send("#{key}=", val)
      end
    end

    def state=(val)
      @state = val.is_a?(String) ? val.upcase : val
    end

    def to_s
      state
    end

    def inspect
      "#<#{self.class} state=#{state.inspect}>"
    end
  end
end
