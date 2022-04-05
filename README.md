![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=flat-square&logo=ruby&logoColor=white)

![GitHub contributors](https://img.shields.io/github/contributors/melohan/eshop?style=flat-square)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/melohan/eshop/main?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/melohan/eshop?style=flat-square)


# Exercise eShop

POO1 - Ruby ActiveRecord

The objective is to create an object and relational model for an e-commerce system as part of the object-oriented programming course in the Ruby language.

## Resume of commands
1. [ActiveRecord](documentation/resume/activeRecord.md)
2. [Migration](documentation/resume/migration.md)
3. [Models](documentation/resume/models.md)



## Step by step

This project satisfies the following requirements. 
Step by step realization of the project:

1. [Create migrations and models](documentation/requirements/2_1-requirement.md)
2. [Create objects](documentation/requirements/2_2-requirement.md)
3. [Scopes](documentation/requirements/2_3-requirement.md)
4. [Validations](documentation/requirements/2_4-requirement.md)
5. [Callbacks](documentation/requirements/2_5-requirement.md)
6. [Single Table inheritance](documentation/requirements/2_6-requirement.md)
7. [Link each product to a supplier](documentation/requirements/2_7-requirement.md)
8. [Polymorphic association](documentation/requirements/2_8-requirement.md)
9. [Observers](documentation/requirements/2_9-requirement.md)

### First installation

Add this to your  gemfile:

Add in your `Gemfile`
```
# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord', "~> 6"
gem 'active_record_migrations', "~> 6"
gem 'mysql2'
gem 'solargraph'
```

Install gems:
```shell
gem install activerecord
gem install bundler 
gem install rake
```

## Setting up dev

### Clone repo

```
$ git clone git@github.com:melohan/eshop.git
$ cd eshop
$ bundle
```

### Database

#### Migrations 

First migration
```shell
rake db:migrate
```

For each migration
```shell
rake db:drop db:create db:migrate
```

If you have encountered a problem execute this command before migrate
```shell
rake db:environment:set RAILS_ENV=development 
```

### Configuration file

We will set database, database user and password in this file `db/config.yml`.

Copy the `db/example.config.yml` with this command:
```
$ cp db/example.config.yml db/config.yml
```
## Run project

```
$ ruby main.rb
```

### Configure autoloader
1. Create `init.rb` and add in this file
```ruby
require "zeitwerk"

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/models")
loader.setup
```

2. Add in Gemfile
```
#autoloader
gem 'zeitwerk'
```

3. Now you only have to add in each ruby file this require:
```
require_relative 'init'
```