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
	config.assets.precompile << %W( *.eot *.svg *.ttf *.woff *.woff2 *.otf )
	config.secret_key = 'e01a87959c6fb9670a41f1b1a4318272c9412ea8b885f39c837bb81f681635d5db5e7d04fe365b861cfeb2e60f9d8dacb0a8a4533bee1ba299474b782b897c00'
  end
end
