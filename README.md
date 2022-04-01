![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=flat-square&logo=ruby&logoColor=white)

![GitHub contributors](https://img.shields.io/github/contributors/melohan/exercise-eshop?style=flat-square)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/melohan/exercise-eshop/main?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/melohan/exercise-eshop?style=flat-square)


# Exercise eShop

POO1 - Ruby ActiveRecord

The objective is to create an object and relational model for an e-commerce system as part of the object-oriented programming course in the Ruby language.

This project satisfies the following requirements. 
Step by step realization of the project:

1. [Create migrations and models](documentation/requirements/2_1-requirement.md)
2. [-](documentation/requirements/2_2-requirement.md)
3. [-](documentation/requirements/2_3-requirement.md)
4. [-](documentation/requirements/2_4-requirement.md)
5. [-](documentation/requirements/2_5-requirement.md)
6. [-](documentation/requirements/2_6-requirement.md)
7. [-](documentation/requirements/2_7-requirement.md)
8. [-](documentation/requirements/2_8-requirement.md)
9. [-](documentation/requirements/2_9-requirement.md)

### First installation

Required gems:
```shell
gem install activerecord
gem install bundler 
gem install active_record_migrations
gem externe: rails-observers
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