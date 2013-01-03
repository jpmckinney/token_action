require 'token_action/engine'

require 'securerandom'

require 'active_support/concern'
require 'orm_adapter'

module TokenAction
  # Returns the default redirect URL.
  #
  # @return [String] the default redirect URL
  def self.default_redirect_url
    if Proc === @@default_redirect_url
      @@default_redirect_url.call
    else
      @@default_redirect_url
    end
  end

  # Sets the default redirect URL.
  #
  # @param [String,Proc] a default redirect URL
  def self.default_redirect_url=(default_redirect_url)
    @@default_redirect_url = default_redirect_url
  end

  # Configures TokenAction.
  #
  # * `default_redirect_url`: the default redirect URL
  #
  # @example
  #   require 'token_action'
  #
  #   TokenAction.setup do |config|
  #     config.default_redirect_url = '/custom/path'
  #   end
  def self.setup
    yield self
  end

  # Returns a random alphanumeric string.
  #
  # @return [String] a random alphanumeric string
  # @see Devise::friendly_token
  def self.friendly_token
    SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
  end
end

require 'token_action/mixins/token_generator'
require 'token_action/mixins/model'
