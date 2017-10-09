source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'high_voltage', '~> 3.0'
gem "paperclip", "~> 5.0.0"
gem 'geocoder'
gem 'devise'
gem "cancan"
gem 'ransack'
gem 'kaminari'
gem 'bootstrap-kaminari-views'
gem 'activeadmin', github: 'activeadmin'
gem 'active_skin'
gem 'active_admin_theme'
gem 'data-confirm-modal', github: 'ifad/data-confirm-modal', branch: 'bootstrap2'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'bootstrap-datepicker-rails', '~> 1.6', '>= 1.6.4.1'
gem 'simple_form'
gem 'non-stupid-digest-assets', '~> 1.0.4'
gem 'wtf_lang'

gem 'rails', '~> 5.0.3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'mysql2', '>= 0.3.18', '< 0.5', :group => [:development, :test]

gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'

gem 'rails_12factor', group: :production
gem 'pg', '~> 0.21.0', group: :production

group :development, :test do

  gem 'byebug', platform: :mri
end
group :development do
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
