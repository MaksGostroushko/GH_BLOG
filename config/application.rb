require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Include the authenticity token in remote forms.
    config.action_view.embed_authenticity_token_in_remote_forms = true
    # config.secret_key_base = "421aa1287e015d358450fde71e6d325f6b9e34055b5c78f3e2c4b08c893cd910e0e8d1ffdbf5026b0699ec4e64e03ad9b6c795fe07f2ba644bfa0f9142c8bafd"
  end
end
