TokenAction.setup do |config|
  config.success_url = lambda { Rails.application.routes.url_helpers.root_url }
  config.failure_url = lambda { Rails.application.routes.url_helpers.root_path }
end
