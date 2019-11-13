bundle exec jekyll build --config=_config.yml,_sfuconfig.yml
rsync --delete -avz _site/ anoop@linux.cs.sfu.ca:/cs/csweb/webhome/anoop
