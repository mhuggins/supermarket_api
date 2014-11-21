module SupermarketApi
  class Product
    attr_accessor :id, :name, :description, :category, :image, :aisle_number, :price

    def initialize(attrs = {})
      attrs.each do |key, val|
        public_send("#{key}=", val)
      end
    end

    def to_s
      name
    end

    def inspect
      descriptions = [:id, :name, :price].map do |attr|
        [attr, public_send(attr).inspect].join('=')
      end

      "#<#{self.class} #{descriptions.join(' ')}>"
    end
  end
end
