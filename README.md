# TWEETSTACK

A simple Rails5 app that allows you to search for the last 25 tweets by a given @handle.

You will need a user email and password to use the demo app hosted: 

* https://quiet-harbor-86203.herokuapp.com/

Message or email me if you care to use it.

There is no real need for the database but, in this case, we have an authentication layer that leverages bcrypt and ActiveRecord's `has_secure_password`.

Making use of the [Twitter gem](https://github.com/sferik/twitter), we simply take a handle and attempt to find the last 25 tweets, parsing out the text, time and mentions.

https://github.com/stacksocial/code-challenge/blob/master/ruby/rails-twitter-api/README.md
