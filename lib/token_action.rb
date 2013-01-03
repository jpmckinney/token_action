require 'token_action/engine'

require 'securerandom'

require 'active_support/concern'
require 'orm_adapter'

module TokenAction
  # Returns a random alphanumeric string.
  #
  # @return [String] a random alphanumeric string
  # @see Devise::friendly_token
  def self.friendly_token
    SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
  end
end

require 'token_action/mixins/model'
require 'token_action/mixins/token_generator'
