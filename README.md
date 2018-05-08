# Jekyll source for my home page

(c) 2002-2015 Anoop Sarkar

* Layout based on [Poole](http://getpoole.com) and [Lanyon](http://lanyon.getpoole.com).
* Further modifications by me are [licensed](LICENSE.md).
* Feel free to reuse anything except site content:
  * `assets/images`,
  * `_posts/*`,
  * `*.md`.

## Install jekyll

Check ruby

    ruby -v
    2.3.3

Install jekyll

    gem install bundler jekyll

If `Gemfile` does not already exist, create it:

    # Create a Gemfile
    bundle init

Install the bundle

    # Add Jekyll
    bundle add jekyll

    # Install gems
    bundle install

## Deploy

To copy to SFU:

    jekyll build --config=_config.yml,_sfuconfig.yml
    rsync --delete -avz _site/ anoop@linux.cs.sfu.ca:/fas-info/cs/people/Faculty/anoop

