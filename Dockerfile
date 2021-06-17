FROM docker:20.10.7 AS builder
RUN apk --no-cache add make

FROM php:8.0.7-cli-alpine3.13 AS builder-php
# extra stuff PHP needs here

FROM node:16.3.0-alpine3.13 AS builder-javascript
# extra stuff node needs here
