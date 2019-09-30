ARG ALPINE_VERSION=latest
FROM frolvlad/alpine-glibc:$ALPINE_VERSION

# credits to https://github.com/phipsgabler/docker-texlive-minimal
COPY texlive-profile.txt /tmp/
RUN apk add --no-cache wget perl xz && \
    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -xzf install-tl-unx.tar.gz && \
    install-tl-20*/install-tl --profile=/tmp/texlive-profile.txt && \
    rm -rf install-tl-*

ENV PATH=/usr/local/texlive/bin/x86_64-linux:/usr/local/texlive/bin/x86_64-linuxmusl:$PATH

# standard latex collection, European standard classes and languages
RUN tlmgr update --self && \
    tlmgr install collection-latex collection-fontsrecommended koma-script ntgclass && \
    tlmgr install \
      babel-basque \
      babel-belarusian \
      babel-bosnian \
      babel-breton \
      babel-bulgarian \
      babel-catalan \
      babel-croatian \
      babel-czech \
      babel-danish \
      babel-dutch \
      babel-english \
      babel-estonian \
      babel-finnish \
      babel-french \
      babel-german \
      babel-greek \
      babel-hungarian \
      babel-icelandic \
      babel-irish \
      babel-italian \
      babel-latvian \
      babel-norsk \
      babel-polish \
      babel-portuges \
      babel-romanian \
      babel-scottish \
      babel-serbian \
      babel-slovak \
      babel-slovenian \
      babel-spanish \
      babel-swedish \
      babel-ukrainian

# mount your .tex files here
VOLUME ["/data"]

CMD ["pdflatex"]
