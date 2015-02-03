module RespondOnlySupported
  class Application < Rails::Application
    routes.draw do
      get 'hi' => 'foo#hi'
    end
    config.secret_key_base = '1234568890' * 10
  end
end

class FooController < ActionController::Base
  include Rails.application.routes.url_helpers

  def hi
    render text: 'hello'
  end
end
