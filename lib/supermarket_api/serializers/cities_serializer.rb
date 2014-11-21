require 'representable/decorator'
require 'representable/xml'
require 'representable/xml/collection'

require_relative 'store_city_serializer'
require_relative '../models/store_city'

module SupermarketApi
  class StoreCitiesSerializer < Representable::Decorator
    include Representable::XML::Collection

    self.representation_wrap = :ArrayOfStoreCity

    # TODO this belongs in `Representable::XML::Collection`
    def self.remove_namespaces!
      representable_attrs.options[:remove_namespaces] = true
    end

    remove_namespaces!

    items class: StoreCity, extend: StoreCitySerializer
  end
end
