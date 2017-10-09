# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( ckeditor/*)
Rails.application.config.assets.precompile += %w( assets/chosen-1.6.2/chosen.min.css )
Rails.application.config.assets.precompile += %w( assets/font-awesome-4.7.0/css/font-awesome.min.css )
Rails.application.config.assets.precompile += %w( assets/html5lightbox/html5lightbox.js )
Rails.application.config.assets.precompile += %w( assets/jquery-ui-1.12.1/jquery-ui.min.css )
Rails.application.config.assets.precompile += %w( assets/jquery-ui-1.12.1/jquery-ui.min.js )
Rails.application.config.assets.precompile += %w( assets/slick-1.6.0/slick.css )
Rails.application.config.assets.precompile += %w( assets/slick-1.6.0/slick.min.js )
Rails.application.config.assets.precompile += %w( css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( scss/mobile.scss )
Rails.application.config.assets.precompile += %w( scss/static.scss )
Rails.application.config.assets.precompile += %w( css/nouislider.min.css )
Rails.application.config.assets.precompile += %w( css/responsive.css )
Rails.application.config.assets.precompile += %w( css/style.css.scss )
Rails.application.config.assets.precompile += %w( js/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( js/global.js )
Rails.application.config.assets.precompile += %w( js/isotope.min.js )
Rails.application.config.assets.precompile += %w( js/jquery-3.1.1.min.js )
Rails.application.config.assets.precompile += %w( js/map.js )
Rails.application.config.assets.precompile += %w( js/hamburder-menu.js )
Rails.application.config.assets.precompile += %w( js/map-search.js )
Rails.application.config.assets.precompile += %w( js/map-single.js )
Rails.application.config.assets.precompile += %w( js/nouislider.min.js )
Rails.application.config.assets.precompile += %w( js/wNumb.js )
Rails.application.config.assets.precompile += %w( application.js )
Rails.application.config.assets.precompile += %w( cable.js )
Rails.application.config.assets.precompile += %w( assets/chosen-1.6.2/chosen.jquery.min.js )
