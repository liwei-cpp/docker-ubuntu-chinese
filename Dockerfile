FROM ubuntu:latest
USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install --assume-yes apt-utils

# confige chinese language
RUN apt-get -qqy install locales \
  && /usr/share/locales/install-language-pack zh_CN \
  && locale-gen zh_CN.UTF-8 \
  && dpkg-reconfigure --frontend noninteractive locales \
  && apt-get -qqy install language-pack-zh-hans

# install chinese fonts
RUN apt-get -qqy install \
      fonts-ipafont-gothic \
      xfonts-100dpi \
      xfonts-75dpi \
      xfonts-cyrillic \
      xfonts-scalable \
      ttf-wqy-microhei \
  && ln /etc/fonts/conf.d/65-wqy-microhei.conf /etc/fonts/conf.d/69-language-selector-zh-cn.conf

ENV LANGUAGE=zh_CN.UTF-8 \
    LANG=zh_CN.UTF-8




