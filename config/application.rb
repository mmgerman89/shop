require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Shop
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
	config.autoload_paths += %W(#{Rails.root}/lib/validators)
	config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
	config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components', 'bootstrap-sass-official')
	config.assets.precompile += %W( *.eot *.svg *.ttf *.woff *.woff2 *.otf )
  end
end
