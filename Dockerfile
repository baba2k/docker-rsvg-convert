FROM alpine as compile-librsvg

RUN apk add curl build-base cargo pkgconfig cairo-dev gdk-pixbuf-dev \
                 harfbuzz-dev libxml2-dev pango-dev gobject-introspection-dev

RUN curl -L https://download.gnome.org/sources/librsvg/2.50/librsvg-2.50.0.tar.xz -o librsvg-2.50.0.tar.xz \
                 && tar -xvJf librsvg-2.50.0.tar.xz

WORKDIR /librsvg-2.50.0
RUN ./configure && make && make install

FROM alpine

RUN apk add cairo-dev pango gdk-pixbuf

COPY --from=compile-librsvg /usr/local/bin/rsvg-convert /usr/local/bin/rsvg-convert
COPY --from=compile-librsvg /usr/local/lib/librsvg-2.so.2 /usr/local/lib/librsvg-2.so.2

WORKDIR /app

ENTRYPOINT ["rsvg-convert"]
CMD ["--help"]
