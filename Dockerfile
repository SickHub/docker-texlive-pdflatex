FROM phipsgabler/texlive-minimal

ENV PATH=/usr/local/texlive/bin/x86_64-linuxmusl:$PATH

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
