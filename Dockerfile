FROM centos:7
MAINTAINER Atsuko Kurosawa<a-kurosawa@mi-labo.co.jp>

#ENV TERM $TERM:xterm
ENV TERM xterm

RUN yum -y groupinstall base "development tools" --setopt=group_package_types=mandatory,default,optional
RUN yum install -y \
    bzip2-devel gdbm-devel libffi-devel \
    libuuid-devel ncurses-devel openssl-devel readline-devel \
    sqlite-devel tk-devel wget xz-devel zlib-devel
#RUN yum install -y \
#    gcc gcc-c++ rpm-build autoconf automake libtool xmlto \
#    apr-devel apr-util-devel pcre-devel distcache-devel \
#    libselinux-devel openssl-devel apr-util-ldap libxml2-devel libjpeg-devel \
#    libpng-devel curl-devel libmcrypt libmcrypt-devel \
#    readline icu libicu libicu-devel \
#    openssh-server httpd httpd-devel mysql mysql-server mysql-devel \
#    make epel-release dpkg-devel dpkg-dev ncurses-term

#RUN wget http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz && \
#    tar xzf libiconv-1.14.tar.gz && \
#    cd libiconv-1.14 && \
#    ./configure --prefix=/usr/local && \
#    sed -i -e '/gets is a security/d' ./srclib/stdio.in.h && \
#    make && make install

RUN wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
RUN tar xzf Python-3.7.2.tgz
WORKDIR Python-3.7.2
RUN ./configure --enable-shared
RUN make
RUN make install
RUN ln -s /usr/local/lib/libpython3.7m.so.1.0 /lib64/
RUN pip3 install requests
