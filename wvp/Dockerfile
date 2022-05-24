FROM ubuntu:20.04   as   build

ARG gitUrl="https://gitee.com/pan648540858"
ARG zlmGitUrl="https://gitee.com/xia-chu/ZLMediaKit"

COPY sources.list /etc/apt/sources.list

RUN export DEBIAN_FRONTEND=noninteractive &&\
        apt-get update && \
        apt-get install -y --no-install-recommends openjdk-11-jre git libssl-dev libsdl-dev libavcodec-dev libavutil-dev maven nodejs npm build-essential \
        cmake ca-certificates openssl ffmpeg &&\
        mkdir -p /opt/wvp/config /opt/wvp/heapdump /opt/wvp/config /opt/assist/config /opt/assist/heapdump /opt/media/www/record

RUN cd /home && \
        git clone "${gitUrl}/maven.git" && \
        cp maven/settings.xml /usr/share/maven/conf/

RUN cd /home && \
        git clone "${gitUrl}/wvp-GB28181-pro.git"

RUN cd /home/wvp-GB28181-pro/web_src && \
        npm --registry=http://registry.npm.taobao.org install && \
        npm run build

RUN cd /home/wvp-GB28181-pro && \
        mvn clean package -Dmaven.test.skip=true && \
        cp /home/wvp-GB28181-pro/target/*.jar /opt/wvp/ && \
        cp -r /home/wvp-GB28181-pro/src/main/resources/banner.txt /opt/wvp/config/banner.txt && \
        # cp -r /home/wvp-GB28181-pro/src/main/resources/logback-spring-local.xml /opt/wvp/config/logback-spring-local.xml && \
        cp -r /home/wvp-GB28181-pro/src/main/resources/wvpssl.jks /opt/wvp/config/wvpssl.jks


RUN cd /home && \
        git clone "${gitUrl}/wvp-pro-assist.git"

RUN cd /home/wvp-pro-assist && \
        mvn clean package -Dmaven.test.skip=true && \
        cp /home/wvp-pro-assist/target/*.jar /opt/assist/ 

RUN cd /home && \
        git clone --depth=1 "${zlmGitUrl}"

RUN cd /home/ZLMediaKit && \
        git submodule update --init --recursive && \
        mkdir -p build release/linux/Release/ &&\
        cd build && \
        cmake -DCMAKE_BUILD_TYPE=Release .. && \
        make -j4 && \
        rm -rf ../release/linux/Release/config.ini && \
        cp -r ../release/linux/Release/* /opt/media


FROM ubuntu:20.04

# EXPOSE 18080/tcp
# EXPOSE 5060/tcp
# EXPOSE 5060/udp
# EXPOSE 6379/tcp
# EXPOSE 18081/tcp
# EXPOSE 80/tcp
# EXPOSE 1935/tcp
# EXPOSE 554/tcp
# EXPOSE 554/udp
# EXPOSE 30000-30500/tcp
# EXPOSE 30000-30500/udp

ENV LC_ALL zh_CN.UTF-8

COPY sources.list /etc/apt/sources.list

RUN export DEBIAN_FRONTEND=noninteractive &&\
        apt-get update && \
        apt-get install -y --fix-missing --no-install-recommends openjdk-11-jre ca-certificates openssl ffmpeg language-pack-zh-hans && \
        apt-get autoremove -y && \
        apt-get clean -y && \
        rm -rf /var/lib/apt/lists/*dic

COPY --from=build /opt /opt
WORKDIR /opt/wvp
CMD ["sh", "run.sh"]
