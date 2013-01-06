class AnimalError < StandardError; end
class MammalError < StandardError; end

class Cat
  class CatError < StandardError; end
  include TokenAction::TokenGenerator

  include Mongoid::Document

  field :token, :type => String

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
