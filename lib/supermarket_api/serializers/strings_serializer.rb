require 'representable/decorator'
require 'representable/xml'
require 'representable/xml/collection'

module SupermarketApi
  class StringsSerializer < Representable::Decorator
    include Representable::XML::Collection

    self.representation_wrap = :ArrayOfString

    # TODO this belongs in `Representable::XML::Collection`
    def self.remove_namespaces!
      representable_attrs.options[:remove_namespaces] = true
    end

    remove_namespaces!

    items as: :string
  end
end
