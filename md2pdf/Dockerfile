FROM alpine:3.8

LABEL PROJECT=md2pdf
ARG VERSION=2.3.1

RUN apk upgrade --no-cache --update && \
    apk add --no-cache texlive-xetex librsvg && \
    wget https://github.com/jgm/pandoc/releases/download/$VERSION/pandoc-$VERSION-linux.tar.gz && \
    tar xf pandoc-$VERSION-linux.tar.gz -C /usr --strip 1 && \
    rm pandoc-$VERSION-linux.tar.gz

ENTRYPOINT ["pandoc", "--pdf-engine=xelatex"]

# Example args: file.md --pdf-engine=xelatex -o file.pdf"
