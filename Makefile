#!/bin/bash
.PHONY: default
.SILENT:


default:

build-development:
	docker-compose build --force-rm --no-cache

start:
	docker-compose up -d --quiet-pull

stop:
	docker-compose down

remove:
	docker-compose down -v

ps:
	docker-compose ps
