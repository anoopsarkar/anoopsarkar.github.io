bundle exec jekyll build --config=_config.yml,_sfuconfig.yml
rsync --delete -avz _site/ anoop@rcga-linux-ts1.dc.sfu.ca:/cs/csweb/webhome/anoop
