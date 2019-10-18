FROM alpine:3.5

WORKDIR /app/

RUN apk --no-cache add \
        libc6-compat \
        curl \
        tar \
        dbus \
        gtk+3.0 \
        xauth \
        xhost && \
    apk add --no-cache --virtual build-deps \
        build-base \
        gtk+3.0-dev \
        pkgconfig

RUN ln -s /lib /lib64

ENV FILENAME code-browser-6.6-linux-x64
RUN curl "http://tibleiz.net/download/$FILENAME.tar.gz" --output $FILENAME.tar.gz
RUN tar -xzf $FILENAME.tar.gz && rm $FILENAME.tar.gz
RUN cp -r $FILENAME/usr /

CMD code-browser
