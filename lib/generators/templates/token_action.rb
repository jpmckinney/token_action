TokenAction.setup do |config|
  # Load and configure the ORM. Supports "active_record" and "mongoid". You
  # should not require more than one ORM for TokenAction.
  require 'token_action/orm/<%= options[:orm] %>'

  # TokenAction will always redirect to this URL if a token cannot be found. If
  # not overridden, it will redirect to this URL after performing an action. By
  # default, this URL is your application's root_path. You may change it with:
  #
  # config.default_redirect_url = 'custom/redirect/url'
  #
  # If using a URL helper, wrap the helper in a lambda or proc:
  #
  # config.default_redirect_url = lambda { Rails.application.routes.url_helpers.root_url }
end
