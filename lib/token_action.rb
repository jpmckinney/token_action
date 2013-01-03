require 'token_action/engine'

require 'securerandom'

require 'active_support/concern'
require 'orm_adapter'

module TokenAction
  # Returns the default success URL.
  #
  # @return [String] the default success URL
  def self.success_url
    if Proc === @@success_url
      @@success_url.call
    else
      @@success_url
    end
  end

  # Sets the default success URL.
  #
  # @param [String,Proc] a default success URL
  def self.success_url=(success_url)
    @@success_url = success_url
  end

  # Returns the default failure URL.
  #
  # @return [String] the default failure URL
  def self.failure_url
    if Proc === @@failure_url
      @@failure_url.call
    else
      @@failure_url
    end
  end

  # Sets the default failure URL.
  #
  # @param [String,Proc] a default failure URL
  def self.failure_url=(failure_url)
    @@failure_url = failure_url
  end

  # Configures TokenAction.
  #
  # * `success_url`: the default success URL
  # * `failure_url`: the default failure URL
  #
  # @example
  #   require 'token_action'
  #
  #   TokenAction.setup do |config|
  #     config.success_url = '/home'
  #     config.failure_url = '/oops'
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
