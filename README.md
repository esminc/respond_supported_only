# RespondSupportedOnly

** We are looking for twinkly name :sparkle:. **

Rails filter syntax suger to reject request with unexpected `Accept:` header.

I unlike to write rails's `respond_to` and/or `respond_with` in all of actions.
But without them, an application cause a ActionView::MissingTemplate if a request
has unexpected `Accept:` header.

Example: the request may cause error, `AV::MissingTemplate`.

```
$ curl -H 'Accept: image/png' -v -o /dev/null http://example.com/posts/42
```

And 'causing errors' means that your error notification service will be filled with them.

I try to protect my S:N ratio of notifications with less effort.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'respond_supported_only'
```

And then execute:

    $ bundle

## Usage

Include `RespondSupportedOnly` in `ApplicationController` (or other controller super class) and declare `respond_only` with support formats argument and filter options.

```ruby
# routes
resources :posts do
  member do
    get :cover_image
  end
end

```

```ruby
class PostsController < ApplicationController
  respond_only :html, :json, except: :cover_image

  respond_only :jpeg, :png,  only: :cover_image

  def index
    ...
  end

  def show
    ...
  end
end
```

## Contributing

1. Fork it ( https://github.com/esminc/respond_supported_only/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
