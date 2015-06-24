NAME = requestbin

build:
	docker build -t $(NAME) .

bash:
	docker rm -f $(NAME)_1 2>/dev/null && sleep 1 || true
	docker run --rm -it --name $(NAME)_1 $(NAME) /bin/sh

# More env vars
# SESSION_SECRET_KEY
# BUGSNAG_KEY
run:
	docker rm -f $(NAME)_1 $(NAME)_redis 2>/dev/null && sleep 1 || true
	docker run -d --name $(NAME)_redis redis
	docker run --rm --name $(NAME)_1 \
	  --link $(NAME)_redis:redis \
	  -e REDIS_URL=redis://redis:6379/0 \
	  $(NAME)
