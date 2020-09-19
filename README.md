# Dockerfile for rsvg-convert 2.50.0

libRSVG (https://wiki.gnome.org/Projects/LibRsvg) based on Alpine docker image

## Build

```
docker build -t rsvg-convert .
```

## Help

```
docker run rsvg-convert --help
```

## Convert SVG to PNG

```
docker run -v $(pwd):/app rsvg-convert file.svg > file.png
```
