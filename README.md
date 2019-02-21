# README
A tool that takes an arbitrarily-long URL and will shorten it for the user. Subsequent users can then give the short URL back to our tool and be redirected to the original URL. We'll also track clickthroughs, since these can be really helpful for business analytics.


Features:

* launchy gem to pop open the original URL in a browser

* Database migrations

* Associations (:has_many, :belongs_to, :has_many :through)

* Validations


To Run:

```sh
bundle install
```

```sh
rails db:migrate
```

```sh
rails runner bin/cli
```