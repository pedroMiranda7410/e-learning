require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Newsletter
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # Define o fuso horário para São Paulo, Brasil (UTC-3 ou UTC-2 no horário de verão)
    config.time_zone = 'America/Sao_Paulo'
    
    # Certifique-se de que os registros no banco de dados são armazenados em UTC
    config.active_record.default_timezone = :utc

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
