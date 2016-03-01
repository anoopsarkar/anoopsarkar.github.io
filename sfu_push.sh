jekyll build --config=_config.yml,_sfuconfig.yml
rsync --delete -avz _site/ anoop@linux.cs.sfu.ca:/fas-info/cs/people/Faculty/anoop
