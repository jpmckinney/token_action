TokenAction.setup do |config|
  config.default_redirect_url = lambda { Rails.application.routes.url_helpers.root_url }
end
