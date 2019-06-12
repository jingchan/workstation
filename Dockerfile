FROM ubuntu:latest

RUN apt-get update && apt-get -y upgrade \
    && apt-get install -y mosh curl openssh-server

RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY ./dotfiles /usr/home


# SSH Server
RUN mkdir /run/sshd
RUN echo 'root:jingchan' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd


ENV LANG=en_US.UTF-8

#              ssh  mosh
EXPOSE 80 8080 22   60001-60010/udp

#ENTRYPOINT ["mosh-server"]

CMD ["/usr/sbin/sshd", "-D"]

