require 'spec_helper'
require 'securerandom'

RSpec.describe SupermarketApi::Client do
  subject { described_class.new(api_key) }

  let(:api_key) { ENV['API_KEY'] || SecureRandom.hex }

  describe '#stores_by_name' do
    let(:results) do
      VCR.use_cassette('stores_by_name') { subject.stores_by_name('Whole Foods') }
    end

    it 'returns an array of stores' do
      expect(results).to all be_a(SupermarketApi::Store)
    end

    it 'returns stores with matching names' do
      expect(results.map(&:name)).to all match(/whole.*foods/i)
    end
  end

  describe '#stores_by_city_state' do
    let(:results) do
      VCR.use_cassette('stores_by_city_state') { subject.stores_by_city_state('San Francisco', 'CA') }
    end

    it 'returns an array of stores' do
      expect(results).to all be_a(SupermarketApi::Store)
    end

    it 'returns stores with matching city/state' do
      expect(results.map(&:city)).to all eq 'San Francisco'
      expect(results.map(&:state)).to all eq 'CA'
    end
  end

  describe '#stores_by_zip' do
    let(:results) do
      VCR.use_cassette('stores_by_zip') { subject.stores_by_zip('80027') }
    end

    it 'returns an array of stores' do
      expect(results).to all be_a(SupermarketApi::Store)
    end

    it 'returns stores with matching zip code' do
      expect(results.map(&:zip)).to all eq '80027'
    end
  end

  describe '#product_search_by_id' do
    let(:id) { 37332 }
    let(:results) do
      VCR.use_cassette('product_search_by_id') { subject.product_search_by_id(id) }
    end

    it 'returns a product' do
      expect(results).to be_a SupermarketApi::Product
    end

    it 'returns the product with matching id' do
      expect(results.id).to eq id
    end
  end

  describe '#product_search_by_name' do
    let(:results) do
      VCR.use_cassette('product_search_by_name') { subject.product_search_by_name('parsley') }
    end

    it 'returns an array of products' do
      expect(results).to all be_a(SupermarketApi::Product)
    end

    it 'returns products with matching name' do
      expect(results.map(&:name)).to all match(/parsley/i)
    end
  end

  describe '#product_search' do
    let(:results) do
      VCR.use_cassette('product_search') { subject.product_search('apple', 'af9f101a75') }
    end

    it 'returns an array of products' do
      expect(results).to all be_a(SupermarketApi::Product)
    end

    it 'returns products with matching name' do
      expect(results.map(&:name)).to all match(/apple/i)
    end
  end

  describe '#commercial_product_search_by_id' do
    let(:id) { 37332 }
    let(:results) do
      VCR.use_cassette('commercial_product_search_by_id') { subject.commercial_product_search_by_id(id) }
    end

    it 'returns a product' do
      expect(results).to be_a SupermarketApi::Product
    end

    it 'returns the product with matching id' do
      expect(results.id).to eq id
    end

    it 'includes the price' do
      expect(results.price).to be_a(Float).and(be > 0)
    end
  end

  describe '#commercial_product_search_by_name' do
    let(:results) do
      VCR.use_cassette('commercial_product_search_by_name') { subject.commercial_product_search_by_name('parsley') }
    end

    it 'returns an array of products' do
      expect(results).to all be_a(SupermarketApi::Product)
    end

    it 'returns products with matching name' do
      expect(results.map(&:name)).to all match(/parsley/i)
    end

    it 'includes the price' do
      expect(results.map(&:price)).to all be_a(Float).and(be > 0)
    end
  end

  describe '#commercial_product_search' do
    let(:results) do
      VCR.use_cassette('commercial_product_search') { subject.commercial_product_search('apple', 'af9f101a75') }
    end

    it 'returns an array of products' do
      expect(results).to all be_a(SupermarketApi::Product)
    end

    it 'returns products with matching name' do
      expect(results.map(&:name)).to all match(/apple/i)
    end

    it 'includes the price' do
      expect(results.map(&:price)).to all be_a(Float).and(be > 0)
    end
  end

  describe '#groceries' do
    let(:results) do
      VCR.use_cassette('groceries') { subject.groceries('apple') }
    end

    xit 'returns an array of strings' do
      expect(results).to all be_a(String)
    end

    xit 'returns groceries with matching name' do
      expect(results).to all match(/apple/i)
    end
  end

  describe '#commercial_groceries' do
    let(:results) do
      VCR.use_cassette('commercial_groceries') { subject.commercial_groceries('apple') }
    end

    xit 'returns an array of strings' do
      expect(results).to all be_a(String)
    end

    xit 'returns groceries with matching name' do
      expect(results).to all match(/apple/i)
    end
  end

  describe '#us_states' do
    let(:results) do
      VCR.use_cassette('us_states') { subject.us_states }
    end

    it 'returns an array of store states' do
      expect(results).to all be_a(SupermarketApi::StoreState)
    end
  end

  describe '#cities_by_state' do
    let(:results) do
      VCR.use_cassette('cities_by_state') { subject.cities_by_state('CO') }
    end

    it 'returns an array of store cities' do
      expect(results).to all be_a(SupermarketApi::StoreCity)
    end

    it 'returns cities with matching state' do
      expect(results.map(&:state)).to all eq 'CO'
    end
  end
end
