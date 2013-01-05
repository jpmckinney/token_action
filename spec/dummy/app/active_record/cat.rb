class Cat < ActiveRecord::Base
  include TokenAction::TokenGenerator

  def self.redeem_token(action = nil)
    raise 'FAIL' if action == 'FAIL'
  end
end
