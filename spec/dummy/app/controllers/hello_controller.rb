class HelloController < ApplicationController
  def hello
    render :text => 'Hello, world'
  end

  def token_success
    render :nothing => true
  end

  def token_failure
    render :nothing => true
  end

  def success
    render :nothing => true
  end

  def failure
    render :nothing => true
  end

  def not_found
    render :nothing => true
  end
end
