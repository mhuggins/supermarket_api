require 'net/http'

require_relative 'serializers/commercial_products_serializer'
require_relative 'serializers/products_serializer'
require_relative 'serializers/stores_serializer'

module SupermarketApi
  class Client
    API_BASE = 'http://www.supermarketapi.com/api.asmx/'.freeze

    def initialize(api_key)
      @api_key = api_key
    end

    def stores_by_name(name)
      response = get('ReturnStoresByName', StoreName: name)
      StoresSerializer.new([]).from_xml(response)
    end

    def stores_by_city_state(city, state)
      response = get('StoresByCityState', SelectedCity: city, SelectedState: state)
      StoresSerializer.new([]).from_xml(response)
    end

    def stores_by_zip(zip)
      response = get('StoresByZip', ZipCode: zip)
      StoresSerializer.new([]).from_xml(response)
    end

    def product_search_by_id(id)
      response = get('SearchByItemID', ItemId: id)
      ProductsSerializer.new([]).from_xml(response).first
    end

    def product_search_by_name(name)
      response = get('SearchByProductName', ItemName: name)
      ProductsSerializer.new([]).from_xml(response)
    end

    def product_search(name, store_id)
      response = get('SearchForItem', ItemName: name, StoreId: store_id)
      ProductsSerializer.new([]).from_xml(response)
    end

    def commercial_product_search_by_id(id)
      response = get('COMMERCIAL_SearchByItemID', ItemId: id)
      CommercialProductsSerializer.new([]).from_xml(response).first
    end

    def commercial_product_search_by_name(name)
      response = get('COMMERCIAL_SearchByProductName', ItemName: name)
      CommercialProductsSerializer.new([]).from_xml(response)
    end

    def commercial_product_search(name, store_id)
      response = get('COMMERCIAL_SearchForItem', ItemName: name, StoreId: store_id)
      CommercialProductsSerializer.new([]).from_xml(response)
    end

    private

    attr_reader :api_key

    def get(path, params = {})
      uri = URI.parse(API_BASE + path)
      uri.query = URI.encode_www_form(params.merge!(APIKEY: api_key))

      Net::HTTP.get(uri)
    end
  end
end
