NAME = requestbin

build:
	docker build -t $(NAME) .

bash: clean
	docker run --rm -it --name $(NAME)_1 $(NAME) /bin/sh

# More env vars
# SESSION_SECRET_KEY
# BUGSNAG_KEY
run: clean
	docker run -d --name $(NAME)_redis redis
	docker run -d --name $(NAME)_1 \
	  --link $(NAME)_redis:redis \
	  -e REDIS_URL=redis://redis:6379/0 \
	  $(NAME)

clean:
	docker rm -f $(NAME)_1 $(NAME)_redis 2>/dev/null && sleep 1 || true
