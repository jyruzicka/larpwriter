# Larpwriter

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

## Deployment

[TODO]

## Run tests

[TODO]
