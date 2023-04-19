# frozen_string_literal: true

require 'active_support/core_ext/integer/time'
require "active_record"
require "bullet"

Rails.application.configure do
  # config.after_initialize do
  #   Bullet.enable        = true
  #   # Bullet.raise         = true
  #   Bullet.alert         = true
  #   Bullet.bullet_logger = true
  #   Bullet.console       = true
  #   Bullet.rails_logger  = true
  #   Bullet.add_footer    = true
  # end

  # config.after_initialize do
  #   Bullet.enable = true
  #   Bullet.raise = true
  #   Bullet.sentry = true
  #   Bullet.alert = true
  #   Bullet.bullet_logger = true
  #   Bullet.console = true
  #   # Bullet.xmpp = { :account  => 'bullets_account@jabber.org',
  #   #                 :password => 'bullets_password_for_jabber',
  #   #                 :receiver => 'your_account@jabber.org',
  #   #                 :show_online_status => true }
  #   Bullet.rails_logger = true
  #   Bullet.honeybadger = true
  #   Bullet.bugsnag = true
  #   Bullet.appsignal = true
  #   Bullet.airbrake = true
  #   Bullet.rollbar = true
  #   Bullet.add_footer = true
  #   Bullet.skip_html_injection = false
  #   Bullet.stacktrace_includes = [ 'your_gem', 'your_middleware' ]
  #   Bullet.stacktrace_excludes = [ 'their_gem', 'their_middleware', ['my_file.rb', 'my_method'], ['my_file.rb', 16..20] ]
  #   # Bullet.slack = { webhook_url: 'http://some.slack.url', channel: '#default', username: 'notifier' }
  # end
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.

  # For fragment caching
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :redis_cache_store, {
      expires_in: 1.hour,
      # namespace: 'cache',
      host: 'localhost',
      port: 6379,
      db: 0
    }
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # For Page caching
  # if Rails.root.join('tmp/caching-dev.txt').exist?
  #   config.action_controller.perform_caching = true
  #   config.action_mailer.perform_caching = false
  #   config.cache_store = :memory_store
  #   config.public_file_server.headers = {
  #     'Cache-Control' => 'public, max-age=172800'
  #   }
  # else
  #   config.action_controller.perform_caching = false
  #   config.action_mailer.perform_caching = false
  #   config.cache_store = :null_store
  # end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'gmail.com',
    user_name: 'zeel.essence@gmail.com',
    password: 'fdziyppixzjvupat',
    authentication: 'plain',
    enable_starttls_auto: true
  }
  config.public_file_server.enabled = true
  # Rails.application.config.middleware.use ExceptionNotification::Rack,
  #                                         :email => {
  #                                           :email_prefix => "[PREFIX] ",
  #                                           :sender_address => %{"notifier" },
  #                                           :exception_recipients => %w{zeelsakariya07@gmail.com}
  #                                         }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.stripe.secret_key = Rails.application.credentials.stripe[:development][:secret_key]
  config.stripe.publishable_key = Rails.application.credentials.stripe[:development][:publishable_key]
  # config.action_mailer.default_url_options = { host: "localhost:3000" }
  # config.action_mailer.default_url_options = { :host => "localhost:3000" }
  # config.hosts << "4ab8-103-81-93-37.ngrok-free.app"
  config.hosts << "8b1a-2401-4900-1c80-58ed-5913-5a3b-4563-8a9e.ngrok-free.app"
  # routes.default_url_options[:host] = 'localhost:3000'
  # Uncomment if you wish to allow Action Cable access from any origin.ma
  # config.action_cable.disable_request_forgery_protection = true
  # config.action_mailer.delivery_method = :letter_opener
  # config.action_mailer.perform_deliveries = true
  # Rails.application.config.middleware.use ExceptionNotification::Rack,

end
