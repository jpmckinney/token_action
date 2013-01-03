module TokenAction
  class TokensController < ApplicationController
    # @todo custom error message per exception
    def redeem
      @token = TokenAction::Token.to_adapter.find_first(:token => params[:token])
      if @token
        begin
          @token.perform
          redirect_to success_url, :notice => translate(:success)
        rescue => e
          logger.warn "TokenAction failed to perform the action for the token '#{params[:token]}': #{e.message}"
          redirect_to failure_url, :alert => translate(:failure)
        end
      else
        logger.info "TokenAction failed to find the token '#{params[:token]}': #{e.message}"
        redirect_to failure_url, :alert => translate(:not_found)
      end
    end

  private

    # Returns a translation.
    #
    # @param [String,Symbol] key a translation key
    # @return [String] a translation
    def translate(key)
      I18n.translate(key,
        :scope => [:token_action, :tokens, params[:path].gsub('/', '.')],
        :default => "token_action.tokens.redeem.#{key}")
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
