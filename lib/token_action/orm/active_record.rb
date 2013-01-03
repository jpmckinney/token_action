require 'orm_adapter/adapters/active_record'

module TokenAction
  # A token to authenticate an action.
  class Token < ActiveRecord::Base
    include TokenAction::Model

    serialize :args
  end
end
