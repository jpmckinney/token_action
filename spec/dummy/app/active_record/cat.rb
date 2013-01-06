class AnimalError < StandardError; end
class MammalError < StandardError; end

class Cat < ActiveRecord::Base
  class CatError < StandardError; end
  include TokenAction::TokenGenerator

  def self.redeem_token(action = nil)
    case action
    when 'upgrade'
      raise AnimalError.new
    when 'metamorphose'
      raise MammalError.new
    when 'fly'
      raise CatError.new
    end
  end
end
