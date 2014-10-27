require 'representable/decorator'
require 'representable/xml'
require 'representable/xml/collection'

require_relative 'store_serializer'
require_relative '../models/store'

module SupermarketApi
  class StoresSerializer < Representable::Decorator
    include Representable::XML::Collection

    self.representation_wrap = :ArrayOfStore

    # TODO this belongs in `Representable::XML::Collection`
    def self.remove_namespaces!
      representable_attrs.options[:remove_namespaces] = true
    end

    remove_namespaces!

    items class: Store, extend: StoreSerializer
  end
end
