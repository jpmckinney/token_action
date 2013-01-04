class Cat
  include Mongoid::Document
  include TokenAction::TokenGenerator
  field :token, :type => String
end
