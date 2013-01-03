module TokenAction
  module TokenGenerator
    extend ActiveSupport::Concern

    module ClassMethods
      # Returns a new alphanumeric token.
      #
      # @param [String,Symbol] column an attribute
      # @return [String] a random alphanumeric string
      # @see Devise::Models::Authenticatable::ClassMethods
      def generate_token(column)
        loop do
          token = TokenAction.friendly_token
          break token unless to_adapter.find_first({ column => token })
        end
      end
    end
  end
end
