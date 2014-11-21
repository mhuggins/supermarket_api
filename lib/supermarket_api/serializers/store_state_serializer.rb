require 'representable/xml'

module SupermarketApi
  module StoreStateSerializer
    include Representable::XML

    self.representation_wrap = :Product

    remove_namespaces!

    property :state, as: :State
  end
end
