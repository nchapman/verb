## What is this?

Verb is a piece of Rack Middleware that serves up RHTML files.

## How do I use it?

1. Put a file ending with `.rhtml` in the root, like `hello.rhtml`
2. Put some static files in `public` if you need them.
3. Run `rackup` in the terminal where your `config.ru` files resides.
4. Open [http://localhost:9292/hello/](http://localhost:9292/hello/) to see your handy work in action.

## Now what?

It's based on Rack so you can run this on any web server that supports Rack like [Phusion Passenger][] or [Thin][].

[Phusion Passenger]: http://www.modrails.com/documentation/Users%20guide.html#_deploying_a_rack_based_ruby_application
[Thin]: http://code.macournoyer.com/thin/doc/files/README.html
