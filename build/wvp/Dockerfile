FROM ubuntu:20.04   as   build

ARG gitUrl="https://gitee.com/pan648540858"

COPY sources.list /etc/apt/sources.list

RUN export DEBIAN_FRONTEND=noninteractive &&\
        apt-get update && \
        apt-get install -y --no-install-recommends openjdk-11-jre git maven nodejs npm build-essential &&\
        mkdir -p /opt/wvp/config /opt/wvp/heapdump /opt/wvp/config

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
        cp -r /home/wvp-GB28181-pro/src/main/resources/wvpssl.jks /opt/wvp/config/wvpssl.jks


FROM ubuntu:20.04


ENV LC_ALL zh_CN.UTF-8

COPY sources.list /etc/apt/sources.list

RUN export DEBIAN_FRONTEND=noninteractive &&\
        apt-get update && \
        apt-get install -y --fix-missing --no-install-recommends openjdk-11-jre ca-certificates language-pack-zh-hans && \
        apt-get autoremove -y && \
        apt-get clean -y && \
        rm -rf /var/lib/apt/lists/*dic

COPY --from=build /opt /opt
WORKDIR /config
CMD ["sh", "run-wvp.sh"]
