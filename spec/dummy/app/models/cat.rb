class Cat < ActiveRecord::Base
  include TokenAction::TokenGenerator
end
