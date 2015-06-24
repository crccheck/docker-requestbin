NAME = requestbin

build:
	docker build -t $(NAME) .

bash:
	docker rm -f $(NAME)_1 2>/dev/null && sleep 1 || true
	docker run --rm -it --name $(NAME)_1 $(NAME) /bin/sh

run:
	docker rm -f $(NAME)_1 $(NAME)_redis 2>/dev/null && sleep 1 || true
	docker run -d --name $(NAME)_redis redis
	docker run --rm --name $(NAME)_1 \
	  -e REDIS_URL=redis://redis \
	  $(NAME)
# REDIS_URL
# REALM
# SESSION_SECRET_KEY
# BUGSNAG_KEY
