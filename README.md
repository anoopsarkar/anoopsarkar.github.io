# Jekyll source for my home page

(c) 2002-2015 Anoop Sarkar

* Layout based on [Poole](http://getpoole.com) and [Lanyon](http://lanyon.getpoole.com).
* Further modifications by me are [licensed](LICENSE.md).
* Feel free to reuse anything except site content:
  * `assets/images`,
  * `_posts/*`,
  * `*.md`.

## Installation

    sudo gem install jekyll bundler github-pages kramdown
    bundle install

## Deploy

    bundle exec jekyll serve

To copy to SFU:

    bundle exec jekyll build --config=_config.yml,_sfuconfig.yml
    rsync --delete -avz _site/ anoop@rcga-linux-ts1.dc.sfu.ca:/cs/csweb/webhome/anoop

