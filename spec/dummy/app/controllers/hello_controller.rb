class HelloController < ApplicationController
  def hello
    render :text => 'Hello, world'
  end
end
