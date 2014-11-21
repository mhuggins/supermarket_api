require 'representable/decorator'
require 'representable/xml'
require 'representable/xml/collection'

require_relative 'store_state_serializer'
require_relative '../models/store_state'

module SupermarketApi
  class StoreStatesSerializer < Representable::Decorator
    include Representable::XML::Collection

    self.representation_wrap = :ArrayOfStoreState

    # TODO this belongs in `Representable::XML::Collection`
    def self.remove_namespaces!
      representable_attrs.options[:remove_namespaces] = true
    end

    remove_namespaces!

    items class: StoreState, extend: StoreStateSerializer
  end
end
