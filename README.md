# [Docker image: texlive-pdflatex](https://hub.docker.com/r/drpsychick/texlive-pdflatex/)

[![DockerHub build status](https://img.shields.io/docker/build/drpsychick/texlive-pdflatex.svg)](https://hub.docker.com/r/drpsychick/texlive-pdflatex/builds/) [![DockerHub build](https://img.shields.io/docker/automated/drpsychick/texlive-pdflatex.svg)](https://hub.docker.com/r/drpsychick/texlive-pdflatex/)

Minimal texlive auto-building alpine image including pdflatex, European standard classes and languages

* https://hub.docker.com/r/drpsychick/texlive-pdflatex/
* based on https://hub.docker.com/r/frolvlad/alpine-glibc (inspired by https://github.com/phipsgabler/docker-texlive-minimal)
* includes pdftex/pdflatex https://en.wikipedia.org/wiki/PdfTeX
* adds koma-script https://ctan.org/pkg/koma-script
* adds ntgclass https://ctan.org/pkg/ntgclass
* adds european babel languages: english, german, french, spanish, polish, italian, portugues, ... (see [Dockerfile](Dockerfile))

## Manually build a PDF from tex

Use `\usepackage[german]{babel}` in your TeX document

```
docker run -it --rm -v $PWD:/data drpsychick/texlive-pdflatex pdflatex /data/myletter.tex
ls -la myletter.pdf
```

## Automate builds with GitLab-CI

Simple `.gitlab-ci.yml` file to automate building of PDFs and making them available as artifacts

```
image: drpsychick/texlive-pdflatex

build:
  script:
    - find . -name \*.tex -exec pdflatex {} ';'
    # fail if number .tex files does not match number of .pdf files
    - if [ $(find . -name \*.tex |wc -l) -gt $(find . -name \*.pdf |wc -l) ]; then exit 1; fi
  artifacts:
    paths:
      - "*.pdf"
    expire_in: 1 day
```
