require 'rails_helper'

if TOKEN_ACTION_ORM == :active_record
  module TokenAction
    RSpec.describe Token, :type => :model do
    end
  end
end
