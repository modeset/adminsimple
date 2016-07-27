# AdminSimple

A tuned down fork of [Jeremy Jackson's](https://github.com/jejacks0n)
[Protoadmin](https://github.com/jejacks0n/protoadmin). This fork removes
the default support for Twitter Bootstrap, allowing an author to use any
CSS library.

For more information and a back story, see the original [Protoadmin](https://github.com/jejacks0n/protoadmin) repository.


## Installation

Include the gem in your Gemfile and bundle to install the gem.

    gem 'adminsimple'

Run the install generator.

    rails g adminsimple:install

Migrate the database to get the admin table, and a default admin user (only in development).

    rake db:migrate

Start, and navigate to your server (http://localhost:3000/admin)[http://localhost:3000/admin] and provide the
credentials that you entered when you installed.  The default credentials are:

    admin@adminsimple.com
    password


## Usage

Any controller that you want to be part of the admin interface should inherit from `Adminsimple::ApplicationController`.

    class ArticlesController < Adminsimple::ApplicationController

The install generator puts a `adminsimple.rb` file into your `config/initializers` path.  This file can be adjusted to
provide additional navigation as well providing the devise and simple_form configurations.


## Dependencies

We removed the [has_scope gem](https://github.com/plataformatec/has_scope) as an explicit dependency, but it can be a great tool to explicitly scope your models in admin.

We also removed inherited_resources, the behavior of which is now built into Rails through responders.


## License

Licensed under the [MIT License](http://creativecommons.org/licenses/MIT/)

Copyright 2013 [Mode Set](http://modeset.com/)

