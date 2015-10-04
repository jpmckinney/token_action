require 'rails_helper'

if TOKEN_ACTION_ORM == :mongoid
  module TokenAction
    RSpec.describe Token, :type => :model do
    end
  end
end
