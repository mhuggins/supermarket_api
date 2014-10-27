require 'supermarket_api'
require 'vcr'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.expand_path('spec/support/**/*.rb')].each(&method(:require))

VCR.configure do |config|
  config.hook_into :webmock
  config.cassette_library_dir = 'spec/fixtures/cassettes'

  # Ensure new requests are recorded.
  config.default_cassette_options = { record: :new_episodes }

  # Prevent sensitive information from being recorded to new cassettes.
  config.filter_sensitive_data('API_KEY') { ENV['API_KEY'] }
end

RSpec.configure do |config|
  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  # Enable filtered runs.
  config.run_all_when_everything_filtered = true
  config.filter_run focus: true
end
