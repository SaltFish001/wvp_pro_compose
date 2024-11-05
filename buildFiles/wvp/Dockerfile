FROM node:16 AS front_builder

# ARG gitUrl="https://github.com/648540858/wvp-GB28181-pro"
ARG gitUrl="https://gitee.com/pan648540858/wvp-GB28181-pro.git"

RUN cd /home && \
        git clone "${gitUrl}" -b master && \
        cd wvp-GB28181-pro 

# 构建前端
RUN cd /home/wvp-GB28181-pro/web_src && \
        yarn --registry=http://registry.npmmirror.com/ install && \
        yarn run build && \
        # 删除node_modules, 前端完成Build后不再需要, 减小体积
        rm -rf node_modules


FROM ubuntu:20.04 AS build

COPY --from=front_builder /home/wvp-GB28181-pro/ /home/wvp-GB28181-pro/

COPY sources.list /etc/apt/sources.list

RUN export DEBIAN_FRONTEND=noninteractive &&\
        apt-get update && \
        apt-get install -y --no-install-recommends openjdk-11-jre git maven build-essential &&\
        mkdir -p /opt/wvp/config /opt/wvp/heapdump /opt/wvp/config

COPY settings.xml /usr/share/maven/conf/

# 构建jar
RUN cd /home/wvp-GB28181-pro && \
        mvn clean package -Dmaven.test.skip=true && \
        cp /home/wvp-GB28181-pro/target/*.jar /opt/wvp/ && \
        cp -r /home/wvp-GB28181-pro/src/main/resources/ /opt/wvp/config/ 


FROM openjdk:11-jre-slim-buster AS runner

ENV LC_ALL zh_CN.UTF-8

COPY --from=build /opt /opt

WORKDIR /config

CMD ["sh", "run-wvp.sh"]
