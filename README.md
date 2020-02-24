# Rails Product Feed for Klaviyo

Author: [LuckyGStar](https://github.com/LuckyGStar)

## Getting started with play around in local

The following assumes that you have a machine equipped with Ruby, Postgres, etc. If not, consider setting up
your machine with [this script](https://github.com/thoughtbot/laptop).

After you have cloned this repo:

* Run `bundle`
* Create the database
  * `rake db:setup`
* Run the application using [Heroku Local]
  * `heroku local`
* Navigate to [localhost:3000](http://localhost:3000) and see the project up and running.

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Feed Url

* Api without auth : [localhost:3000/api/v1/feed](http://localhost:3000/api/v1/feed)
* Api with basic auth : [localhost:3000/api/v2/feed](http://localhost:3000/api/v2/feed)

## Heroku Feed Url

* Api without auth : [https://rails-feed-api.herokuapp.com/api/v1/feed](https://rails-feed-api.herokuapp.com/api/v1/feed)
* Api with basic auth : [https://rails-feed-api.herokuapp.com/api/v2/feed](https://rails-feed-api.herokuapp.com/api/v2/feed)

## Deploying

You can deploy to staging and production, respectively, with:

    $ git push heroku master

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

Feel free to make new PR and contributions for this project. 
Any issues also welcome!
