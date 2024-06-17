FROM ubuntu:20.04   as   build

ARG gitUrl="https://github.com/648540858/wvp-GB28181-pro"

COPY sources.list /etc/apt/sources.list

RUN export DEBIAN_FRONTEND=noninteractive &&\
        apt-get update && \
        apt-get install -y --no-install-recommends openjdk-11-jre git maven nodejs npm build-essential &&\
        mkdir -p /opt/wvp/config /opt/wvp/heapdump /opt/wvp/config

COPY settings.xml /usr/share/maven/conf/

RUN cd /home && \
        git clone "${gitUrl}" -b wvp-28181-2.0 && \
        cd wvp-GB28181-pro &&\
        # 指定Commit, 避免数据库结构不一致
        git checkout 1909c7f71fc1b0e290678a3efe95b62d0b9df75e
# 构建前端
RUN cd /home/wvp-GB28181-pro/web_src && \
        npm --registry=http://registry.npm.taobao.org install && \
        npm run build && \
        # 删除node_modules, 前端完成Build后不再需要, 减小体积
        rm -rf node_modules

# 构建jar
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
        # 安装必须依赖
        apt-get install -y --fix-missing --no-install-recommends openjdk-11-jre curl ca-certificates language-pack-zh-hans && \
        apt-get autoremove -y && \
        apt-get clean -y && \
        rm -rf /var/lib/apt/lists/*dic

COPY --from=build /opt /opt

WORKDIR /config

CMD ["sh", "run-wvp.sh"]
