FROM debian:buster
LABEL AUTHOR="fdiaz@paloaltonetworks.com"
ENV container secops_ctf
ENV DEBIAN_FRONTEND noninteractive

ADD . /tmp/project
WORKDIR /tmp/project

#RUN make docs
# env stuff
RUN \
apt update;\
apt -y install apt-utils; \
apt -y install make latexmk python3-pip; \
apt install -y texlive-latex-extra latexmk