FROM alpine:latest
RUN apk add git

WORKDIR /app
COPY . .

RUN git init && \
    git config user.email "docker@image.com" && \
    git config user.name "image" && \
    git add -A && \
    git commit -m "difference" || true

CMD [ "sh", "-c", "printf 'This is an AI Review'; git diff | head -c 100" ]