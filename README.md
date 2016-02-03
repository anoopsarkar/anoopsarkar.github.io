# Jekyll source for my home page

(c) 2002-2015 Anoop Sarkar

* Layout based on [Poole](http://getpoole.com) and [Lanyon](http://lanyon.getpoole.com).
* Further modifications by me are [licensed](LICENSE.md).
* Feel free to reuse anything except site content:
  * `assets/images`,
  * `_posts/*`,
  * `*.md`.
* To copy to SFU:
    jekyll build --config=_config.yml,_sfuconfig.yml
    rsync --delete -avz _site/ anoop@linux.cs.sfu.ca:/fas-info/cs/people/Faculty/anoop
