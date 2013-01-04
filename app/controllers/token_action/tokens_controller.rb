module TokenAction
  class TokensController < ApplicationController
    def redeem
      @token = TokenAction::Token.to_adapter.find_first(:token => params[:token])
      if @token
        begin
          # Perform this in the controller's scope to allow access to request methods.
          ActiveSupport::Inflector.constantize(@token.kind).perform(*@token.args)
          redirect_to success_url, :notice => translate(:success)
        rescue => e
          key = ActiveSupport::Inflector.underscore(e.class).gsub('/', I18n.default_separator)
          logger.warn "TokenAction failed to perform the action for the token '#{params[:token]}': #{e.message}"
          redirect_to failure_url, :alert => translate(key, :failure)
        end
      else
        logger.info "TokenAction failed to find the token '#{params[:token]}': #{e.message}"
        redirect_to failure_url, :alert => translate(:not_found)
      end
    end

  private

    # Returns a translation.
    #
    # @param [Array] args translation keys
    # @return [String] a translation
    def translate(*args)
      scope = params[:path].gsub('/', I18n.default_separator)
      keys = []

      # Respect the order of precedence described in the readme.
      args.each do |key|
        [scope, :default].each do |namespace|
          keys << [:token_action, :tokens, namespace, key]
        end
      end
      keys.map! do |key|
        key.map(&:to_s).join(I18n.default_separator)
      end

      key, *default = *keys
      I18n.translate(key, :default => default)
    end

    # Returns the success URL.
    #
    # @return [String] a URL
    def success_url
      [@token && @token.success_url, TokenAction.success_url].find do |url|
        url.present? && routable?(url)
      end || main_app.root_path
    end

    # Returns the failure URL.
    #
    # @return [String] a URL
    def failure_url
      [@token && @token.failure_url, TokenAction.failure_url].find do |url|
        url.present? && routable?(url)
      end || main_app.root_path
    end

    # Returns whether a path is routable.
    #
    # @param [String] path a path
    # @return [Boolean] whether the path is routable
    def self.routable?(path)
      !!Rails.application.routes.recognize_path(path, :method => :get)
    rescue ActionController::RoutingError
      false
    end
  end
end
