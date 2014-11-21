require 'representable/xml'

module SupermarketApi
  module StoreCitySerializer
    include Representable::XML

    self.representation_wrap = :Product

    remove_namespaces!

    property :city, as: :City
    property :state, as: :State
  end
end
