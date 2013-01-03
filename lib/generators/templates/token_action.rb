# Load and configure the ORM. Supports "active_record" and "mongoid". You should
# not require more than one ORM for TokenAction.
require 'token_action/orm/<%= options[:orm] %>'
