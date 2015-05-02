all: clean build/

browse: build
	open build/index.html

serve: deps
	bundle exec middleman

build/: deps
	bundle exec middleman build

deps:
	which bundle || gem install bundler
	bundle check || bundle install

clean:
	rm -rf build/

.PHONY: all browse clean deps serve
