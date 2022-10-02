#!/bin/bash
.PHONY: default
.SILENT:


default:

build-development:
	docker-compose build --force-rm --no-cache --pull

start:
	docker-compose up -d --quiet-pull

stop:
	docker-compose down

ps:
	docker-compose ps
