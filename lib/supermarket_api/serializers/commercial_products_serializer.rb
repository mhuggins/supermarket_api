require_relative 'products_serializer'

module SupermarketApi
  class CommercialProductsSerializer < ProductsSerializer
    self.representation_wrap = :COMMERCIAL_ArrayOfProduct
  end
end
