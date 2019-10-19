# metabase-docker

## Build

```
docker build -t metabase-docker .
```

## Run

```
docker run -it -d --name metabase-${RANDOM} -p 3000:3000  metabase-docker
```

Immediately browse localhost:3000.
