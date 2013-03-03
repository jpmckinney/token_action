module TokenAction
  module Model
    extend ActiveSupport::Concern
    include TokenAction::TokenGenerator

    included do
      validates_presence_of :token, :kind

      # ActiveRecord, Mongoid, MongoMapper and DataMapper implement
      # `validates_uniqueness_of`. Sequel implements it in a plugin.
      #
      # @see http://sequel.rubyforge.org/rdoc-plugins/classes/Sequel/Plugins/ValidationClassMethods.html
      validates_uniqueness_of :token

      before_validation :set_token
    end

  private

    def set_token
      self.token ||= self.class.generate_token(:token)
    end
  end
end
