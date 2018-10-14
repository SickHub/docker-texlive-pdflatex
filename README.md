# [Docker image: texlive-pdflatex](https://hub.docker.com/r/drpsychick/texlive-pdflatex/)

[![DockerHub build status](https://img.shields.io/docker/build/drpsychick/texlive-pdflatex.svg)](https://hub.docker.com/r/drpsychick/texlive-pdflatex/builds/) [![DockerHub build](https://img.shields.io/docker/automated/drpsychick/texlive-pdflatex.svg)](https://hub.docker.com/r/drpsychick/texlive-pdflatex/)

Minimal texlive alpine image including pdflatex, European standard classes and languages

* https://hub.docker.com/r/drpsychick/texlive-pdflatex/
* based on https://github.com/phipsgabler/docker-texlive-minimal
* adds pdftex/pdflatex https://en.wikipedia.org/wiki/PdfTeX
* adds koma-script https://ctan.org/pkg/koma-script
* adds ntgclass https://ctan.org/pkg/ntgclass
* adds european babel languages: english, german, french, spanish, polish, italian, portugues, ... (see Dockerfile)

## Build PDF from tex

Use `\usepackage[german]{babel}` in your TeX document

```
docker run -it --rm -v $PWD:/data drpsychick/texlive-pdflatex pdflatex /data/myletter.tex
ls -la myletter.pdf
```

