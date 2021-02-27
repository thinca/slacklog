FROM thinca/vim:latest-full-ubuntu

RUN apt-get -y update
RUN apt-get -y install curl git
RUN curl -fsSL https://deno.land/x/install/install.sh | sh
ENV PATH $PATH:/root/.deno/bin

RUN mkdir -p ~/.vim/pack/tmp/start
RUN git clone --depth=1 https://github.com/vim-denops/denops.vim ~/.vim/pack/tmp/start/denops.vim
RUN git clone --depth=1 https://github.com/vim-denops/denops-helloworld.vim ~/.vim/pack/tmp/start/denops-helloworld.vim
RUN echo packloadall! > ~/.vim/vimrc