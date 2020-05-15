# frozen_string_literal: true

require 'spree/core'
require 'solidus_user_guides'

module SolidusUserGuides
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    initializer "set_panel_text", before: :load_config_initializers do |app|
      # Exposes user_guides.yml for use in the user guide panel
      Rails.configuration.user_guides = YAML.load_file("#{Bundler.rubygems.find_name('solidus_user_guides').first.full_gem_path}/lib/user_guides.yml")
    end

    engine_name 'solidus_user_guides'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
