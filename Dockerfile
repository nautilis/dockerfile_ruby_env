FROM ubuntu:16.04

COPY vimrc  /root/.vimrc 
RUN mkdir ~/.ssh
COPY ssh/* /root/.ssh/ 
RUN apt update && \
    apt install -y curl && \
    apt-get install xz-utils && \
	apt install -y npm && \
    npm install npm@latest -g && \
    cd ~ && \
    curl "https://nodejs.org/dist/v8.11.1/node-v8.11.1-linux-x64.tar.xz" > node.tar.xz && \
    tar xvf node.tar.xz && \
    ln -s /root/node-v8.11.1-linux-x64/bin/node /usr/local/bin/node && \
    rm node.tar.xz && \
    cd ~ 
 
RUN apt-get update && \
      apt install -y openssl  && \
      apt install -y libssl-dev  && \
      apt install -y git && \
	  apt install -y vim && \
      apt install -y make && \
      git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
      apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
RUN curl "https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.gz" > ruby.tar.gz && \
    tar zxvf ruby.tar.gz && \
    cd ruby-2.3.7  && \
    ./configure && make && make install && \
    cd ~
RUN rm ruby.tar.gz && \
    rm -rf ruby-2.3.7
RUN echo "gem: --no-document" > ~/.gemrc

EXPOSE 3000
EXPOSE 3001
ExPOSE 3002


CMD ["/bin/bash"]
