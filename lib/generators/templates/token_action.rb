TokenAction.setup do |config|
  # Load and configure the ORM. Supports "active_record" and "mongoid".
  require 'token_action/orm/<%= options[:orm] %>'
end
