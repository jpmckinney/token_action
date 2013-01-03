require 'orm_adapter/adapters/mongoid'

module TokenAction
  # A token to authenticate an action.
  class Token
    include Mongoid::Document
    include Mongoid::Timestamps

    include TokenAction::Model

    # A shared secret.
    # @return [String] a token
    field :token, type: String

    # The class on which to perform the action.
    # @return [String] a class name
    # @note `class` clashes with `Object#class` and Mongoid reserves `klass`.
    field :kind, type: String

    # Any additional arguments for the action.
    # @return [Array] a list of arguments
    field :args, type: Array

    index({token: 1}, unique: true)
  end
end
