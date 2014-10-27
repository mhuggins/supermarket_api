require 'representable/xml'
require 'representable/coercion'

module SupermarketApi
  module ProductSerializer
    include Representable::XML
    include Representable::Coercion

    self.representation_wrap = :Product

    remove_namespaces!

    property :id, as: :ItemID, type: Integer
    property :name, as: :Itemname
    property :description, as: :ItemDescription
    property :category, as: :ItemCategory
    property :image, as: :ItemImage
    property :aisle_number, as: :AisleNumber
    property :price, as: :Pricing, type: Float
  end
end
