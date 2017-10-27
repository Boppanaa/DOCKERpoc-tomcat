# Installing Java for TOMCAT
FROM rhel7:latest

MAINTAINER boppanasrinivas@yahoo.com

#Step 1: Install JDK 1.7

RUN mkdir /usr/java && cd /usr/java

#ADD http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-i586.tar.gz /usr/java

COPY  /jdk1.7.0_79/* /usr/javaa/

WORKDIR /usr/javaa

#RUN tar -xvf jdk-7u5-linux-x64.tar.gz 

ENV JAVA_HOME=/usr/javaa


RUN export JAV_HOME

RUN PATH=$JAVA_HOME/bin:$PATH

RUN export PATH

#Step 2: Download and Unpack Tomcat 7.0.29 (or latest)



WORKDIR /usr/share/

#Download Tomcat from Apache server

ADD apache-tomcat-7.0.72/ /usr/share/


#RUN tar -xzf apache-tomcat-7.0.29.tar.gz   /usr/share

WORKDIR /etc/init.d/

COPY tomcat /etc/init.d/


RUN chmod +x tomcat 
#&& chkconfig --add tomcat && chkconfig ---level 234 tomcat on 

WORKDIR /usr/share/bin



EXPOSE 8080
EXPOSE 8009

#WORKDIR /usr/share/bin/

CMD /usr/share/bin/startup.sh

















