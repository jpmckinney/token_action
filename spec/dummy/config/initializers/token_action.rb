TokenAction.setup do |config|
  require "token_action/orm/#{TOKEN_ACTION_ORM}"
  config.success_url = lambda { Rails.application.routes.url_helpers.root_url }
  config.failure_url = lambda { Rails.application.routes.url_helpers.root_path }
end
