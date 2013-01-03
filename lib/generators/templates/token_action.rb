TokenAction.setup do |config|
  # Load and configure the ORM. Supports "active_record" and "mongoid". You
  # should not require more than one ORM for TokenAction.
  require 'token_action/orm/<%= options[:orm] %>'

  # If not overridden on a per-token basis, TokenAction will redirect to this
  # URL after performing an action successfully. If not set, it will redirect to
  # your application's root_path. Set it with:
  #
  # config.success_url = 'custom/redirect/url'
  #
  # If using a URL helper, wrap the helper in a lambda or proc:
  #
  # config.success_url = lambda { Rails.application.routes.url_helpers.root_url }

  # If not overridden on a per-token basis, TokenAction will redirect to this
  # URL when an exception is raised while performing an action, or when a token
  # cannot be found. If not set, it will redirect to your app's root_path.
  #
  # config.failure_url = 'custom/redirect/url'
  #
  # If using a URL helper, wrap the helper in a lambda or proc:
  #
  # config.failure_url = lambda { Rails.application.routes.url_helpers.root_url }
end
