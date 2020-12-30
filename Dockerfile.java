FROM c:latest
ENV container docker

RUN pacman -S jdk11-openjdk --noconfirm \
    && export JAVA_HOME=/usr/lib/jvm/default-runtime

COPY pkgs/java/eclipse.jdt.ls /opt/eclipse.jdt.ls
RUN mkdir -p /opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository
ADD pkgs/java/jdt-language-server-latest.tar.gz /opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository

RUN pacman -S maven --noconfirm

RUN cd /opt &&  wget https://github.com/google/google-java-format/releases/download/google-java-format-1.9/google-java-format-1.9-all-deps.jar
RUN echo "java -jar /opt/google-java-format-1.9-all-deps.jar -r \$@" > /usr/bin/google-java-format && chmod +x /usr/bin/google-java-format

#RUN cd /opt \
    #&& git clone https://github.com/eclipse/eclipse.jdt.ls.git 

#RUN cd /opt/eclipse.jdt.ls \
    #&& ./mvnw clean verify
   
