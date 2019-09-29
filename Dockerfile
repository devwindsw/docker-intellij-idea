FROM adoptopenjdk/openjdk8

RUN  \
  apt-get update && apt-get install --no-install-recommends -y \
  gcc git openssh-client less \
  libxtst-dev libxext-dev libxrender-dev libfreetype6-dev \
  libfontconfig1 libgtk2.0-0 libxslt1.1 libxxf86vm1 \
  && rm -rf /var/lib/apt/lists/* \
  && useradd -ms /bin/bash devwindsw

ARG idea_version=2019.2
#ARG idea_source=https://download.jetbrains.com/idea/ideaIC-192.5728.98.tar.gz
ARG idea_source=https://download.jetbrains.com/idea/ideaIC-$idea_version.tar.gz
ARG idea_local_dir=.IdeaIC$idea_version

WORKDIR /opt/idea

RUN curl -fsSL $idea_source -o /opt/idea/installer.tgz \
  && tar --strip-components=1 -xzf installer.tgz \
  && rm installer.tgz

RUN apt-get update && apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module \
  && rm -rf /var/lib/apt/lists/*

USER devwindsw
ENV HOME /home/devwindsw

RUN mkdir /home/devwindsw/.Idea \
  && ln -sf /home/devwindsw/.Idea /home/devwindsw/$idea_local_dir

CMD [ "/opt/idea/bin/idea.sh" ]

