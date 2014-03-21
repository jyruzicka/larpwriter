# Larpwriter [![Build Status](https://travis-ci.org/Florent2/larpwriter.png)](https://travis-ci.org/Florent2/larpwriter) [![Code Climate](https://codeclimate.com/github/Florent2/larpwriter.png)](https://codeclimate.com/github/Florent2/larpwriter) [![Dependency Status](https://gemnasium.com/Florent2/larpwriter.png)](https://gemnasium.com/Florent2/larpwriter)

The complete rewrite of [larpwriter.com](http://www.larpwriter.com). Work in progress.

## Installation

* install the latest version of bundler: `gem update bundler`
* install the gems: `bundle`
* install pre commit hooks: `overcommit .`
* copy `.env.example` to `.env` and set variables within
* copy `config/database.yml.example` to `config/database.yml` and set local db credentials if you want
* create the dev database: `spring rake db:create` (replace `spring` with `bundle exec` if you do not use [spring](https://github.com/jonleighton/spring))
* load the database schema: `spring rake db:schema:load`
* seed the database: `spring rake db:seed`

## Development

* run `bundle exec guard` in a terminal tab to leverage Guard. In particular
pages in your browser will reload automatically when an app asset changes
* use `ql :@user` to have a nice debugging output of `@user`
* whenever you add a new model (or important attributes) please add in the seed
file the creation of example instances of this model, it will make life much
easier for the other developers
* when you add a new variable in your `.env` file, make sure to add the var name
in `env.example` too
* you can see all the delivered mails in development on http://localhost:3000/delivered_mails
* the debugger [byebug](https://github.com/deivid-rodriguez/byebug) is available

### Bootstrap upgrade

When upgrade the Bootswatch theme in `vendor/assets/stylesheets`, change `url('../fonts/glyphicons-halfings-regular.eot')` and similar to `font-url('glyphicons-halfings-regular.eot')`.

## Run tests

* with `spring rake test`
* to run only a single test or tests of a single file, see the new rake tasks given by [single_test](https://github.com/grosser/single_test)
* to see current page content in an integration test, add a line with `save_and_open_page`
* to use byebug in tests, add it temporarily to the Gemfile test group (is not included by default because makes Travis fail)
