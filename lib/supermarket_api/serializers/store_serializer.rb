require 'representable/xml'

module SupermarketApi
  module StoreSerializer
    include Representable::XML

    self.representation_wrap = :Store

    remove_namespaces!

    property :id, as: :StoreId
    property :name, as: :Storename
    property :address, as: :Address
    property :city, as: :City
    property :state, as: :State
    property :zip, as: :Zip
    property :phone, as: :Phone
  end
end
