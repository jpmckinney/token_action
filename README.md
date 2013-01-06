# TokenAction

[![Build Status](https://secure.travis-ci.org/opennorth/token_action.png)](http://travis-ci.org/opennorth/token_action)
[![Dependency Status](https://gemnasium.com/opennorth/token_action.png)](https://gemnasium.com/opennorth/token_action)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/opennorth/token_action)

TokenAction lets you create tokens to be used to authenticate actions. For example:

* Create a token for a user to confirm an account
* Create a token for a subscriber to unsubscribe from notifications
* Create a token for a user to confirm a change of email address

## Getting Started

TokenAction works with Rails 3.1 onwards. Add it to your Gemfile:

    gem 'token_action'

Install the gem and configure your application to use TokenAction with:

    bundle
    bundle exec rails generate token_action

If you are using ActiveRecord, run the migration:

    bundle exec rake db:migrate

## Basic Usage

Create a shared secret to confirm a user account, for example:

    token = TokenAction::Token.create! :kind => 'User', :args => [1, :confirm]
    token.token # a 20-character alphanumeric string like "j7NtCaYfUpZXyDCseKG2"

You can then send the token with instructions to the user via email. When the user visits `/tokens/j7NtCaYfUpZXyDCseKG2/confirm`, TokenAction will look up the token. If not found, it will log an informational message to the Rails logger, set `flash[:alert]` and redirect to the `root_path`. If found, it will call the `redeem_token` method on the `User` class, passing in the arguments `1` and `:confirm`. You must implement the public `redeem_token` method. For example:

    class User < ActiveRecord::Base
      def self.redeem_token(id, meth)
        User.find(id).send(meth)
      end

      def confirm
        update_attribute :confirmed, true
      end
    end

If an exception is raised, TokenAction will log a warning message to the Rails logger, set `flash[:alert]` and redirect to the `root_path`. If no exception is raised, TokenAction will set `flash[:notice]` and redirect to the `root_path`. That's it!

## Customization

You can customize the redirect URLs, the routes, the flash messages and the tokens controller.

### Redirect URLs

To change the default success and failure URLs from `root_path`, edit the `config/initializers/token_action.rb` file created by `rails generate token_action`. You may also set success and failure URLs for each token, by creating tokens with `:success_url` and `:failure_url` arguments:

    token = TokenAction::Token.create! :kind => 'Cat', :success_url => cat_path(1), :failure_url => '/oops'

**Note:** If you change your URL structure after creating tokens, TokenAction may attempt to redirect to an unroutable path. If a path is unroutable, TokenAction will redirect to another URL in this order of precedence:

* `Token#success_url`
* `TokenAction.success_url`
* `root_path`

If an exception was raised and a path is unroutable, it will redirect in this order of precedence:

* `Token#failure_url`
* `TokenAction.failure_url`
* `root_path`

### Routes

The TokenAction generator will add `mount TokenAction::Engine => '/token_action'` to your routes, which defines:

    get 'tokens/:token/*path', :to => 'tokens#redeem'

As such, you can write URLs like `tokens/xxx/confirm` or `tokens/xxx/unsubscribe` or `tokens/xxx/a/b/c`.

To customize the first part of the route, replace the `mount` line with something like:

    get 'jetons/:token/*path', :to => 'token_action/tokens#redeem'

### Flash messages

The TokenAction generator will create a `config/locales/token_action.en.yml` file with the default messages for when a token is not found, an exception is raised, or the action is performed successfully. You will probably want to change these messages depending on the action taken and the exception raised.

* If a token was redeemed by accessing a URL like `tokens/xxx/confirm`, TokenAction will look for a message in the scope `token_action.tokens.confirm`. If not found, it will default to the scope `token_action.tokens.default`.

* If a token was redeemed by accessing a long URL like `tokens/xxx/a/b/c`, TokenAction will look for a message in the scope `token_action.tokens.a.b.c`.

You may want to raise an exception if an action has already been performed or if it is no longer valid, in which case you may want the failure message to change according to the exception raised.

* If an `AlreadyConfirmed` exception is raised, TokenAction will look for a message in the scope `token_action.tokens.default.already_confirmed`. If not found, it will default to `token_action.tokens.default.failure`.

* If a namespaced `MyModule::AlreadyConfirmed` exception is raised, TokenAction will look for a message in the scope `token_action.tokens.default.my_module.already_confirmed`.

Putting it all together, if a `AlreadyConfirmed` exception is raised accessing a URL like `tokens/xxx/confirm`, TokenAction will look for messages in this order of preference:

* `token_action.tokens.confirm.already_confirmed`
* `token_action.tokens.default.already_confirmed`
* `token_action.tokens.confirm.failure`
* `token_action.tokens.default.failure`

### Tokens controller

To customize the controller without monkey patching, create a new controller like:

    class TokensController < TokenAction::TokensController
    end

And replace the route with something like:

    get 'tokens/:token/*path', :to => 'tokens#redeem'

You can then override the `redeem` method in your new controller.

## Supported ORMs

* [ActiveRecord](https://rubygems.org/gems/activerecord)
* [Mongoid](https://rubygems.org/gems/mongoid)

It should be easy to add adapters for [MongoMapper](https://rubygems.org/gems/mongo_mapper), DataMapper, Sequel and CouchPotato. If you are using DataMapper or Sequel, you must use an ActiveModel compliance plugin:

* [DataMapper plugin](https://github.com/datamapper/dm-active_model)
* [Sequel plugin](http://sequel.rubyforge.org/rdoc-plugins/classes/Sequel/Plugins/ActiveModel.html)

If using Sequel, you will want to use the [orm_adapter-sequel](https://github.com/elskwid/orm_adapter-sequel) gem. If using CouchPotato, you will need to write your own adapter for ORM Adapter.

## Caveats

* If you change the name of a class, update the `kind` attribute on its tokens to avoid making them unprocessable.
* Be careful when changing the behavior of a `redeem_token` method, to avoid making tokens unprocessable.

## Roadmap

* The tokens controller only responds to HTML requests. Pull requests to add JSON and XML responders are welcome!
* The generators do not have specs.

## Bugs? Questions?

This engine's main repository is on GitHub: [http://github.com/opennorth/token_action](http://github.com/opennorth/token_action), where your contributions, forks, bug reports, feature requests, and feedback are greatly welcomed.

Copyright (c) 2012 Open North Inc., released under the MIT license
