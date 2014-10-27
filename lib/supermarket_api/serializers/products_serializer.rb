require 'representable/decorator'
require 'representable/xml'
require 'representable/xml/collection'

require_relative 'product_serializer'
require_relative '../models/product'

module SupermarketApi
  class ProductsSerializer < Representable::Decorator
    include Representable::XML::Collection

    self.representation_wrap = :ArrayOfProduct

    # TODO this belongs in `Representable::XML::Collection`
    def self.remove_namespaces!
      representable_attrs.options[:remove_namespaces] = true
    end

    remove_namespaces!

    items class: Product, extend: ProductSerializer
  end
end
