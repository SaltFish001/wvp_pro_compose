FROM ubuntu:20.04   as   build

ARG assistGitUrl="https://github.com/648540858/wvp-pro-assist.git"
ARG zlmGitUrl="https://github.com/ZLMediaKit/ZLMediaKit.git"

COPY sources.list /etc/apt/sources.list

RUN apt-get update && \
        DEBIAN_FRONTEND="noninteractive" \
        apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        curl \
        vim \
        wget \
        ca-certificates \
        tzdata \
        libssl-dev \
        libmysqlclient-dev \
        libx264-dev \
        libfaac-dev \
        gcc \
        g++ \
        libavcodec-dev libavutil-dev libswscale-dev libresample-dev \
        libsdl-dev libusrsctp-dev \
        openjdk-11-jre \
        maven \
        gdb && \
        apt-get autoremove -y && \
        apt-get clean -y && \
        rm -rf /var/lib/apt/lists/* && \
        mkdir -p /opt/assist/config /opt/assist/heapdump /opt/media/www/record

COPY settings.xml /usr/share/maven/conf/

# 构建wvp-pro-assist, 录像助手
RUN cd /home && \
        git clone "${assistGitUrl}" && cd wvp-pro-assist &&\
        git checkout 6a8b3ffb005547ad59afe22af15e0008e3fdf58c

RUN cd /home/wvp-pro-assist && \
        mvn clean package -Dmaven.test.skip=true && \
        cp /home/wvp-pro-assist/target/*.jar /opt/assist/ 
# 构建ZLMediaKit
RUN cd /home && \
        git clone "${zlmGitUrl}" && cd ZLMediaKit && \
        git checkout 861be27ef89e0fac562324a7765f136d983131a6

RUN cd /home/ZLMediaKit && \
        git submodule update --init --recursive && \
        mkdir -p build release/linux/Release/ &&\
        cd build && \
        cmake -DCMAKE_BUILD_TYPE=Release .. && \
        make -j4 && \
        rm -rf ../release/linux/Release/config.ini && \
        cp -r ../release/linux/Release/* /opt/media


FROM ubuntu:20.04

ENV LC_ALL zh_CN.UTF-8

COPY sources.list /etc/apt/sources.list
RUN apt-get update && \
        DEBIAN_FRONTEND="noninteractive" \
        apt-get install -y --no-install-recommends \
        vim \
        wget \
        ca-certificates \
        tzdata \
        curl \
        libssl-dev \
        libx264-dev \
        libfaac-dev \
        ffmpeg \
        gcc \
        openjdk-11-jre \
        g++ \
        libavcodec-dev libavutil-dev libswscale-dev libresample-dev \
        libsdl-dev libusrsctp-dev \
        gdb && \
        apt-get autoremove -y && \
        apt-get clean -y && \
        rm -rf /var/lib/apt/lists/*
COPY --from=build /opt /opt
WORKDIR /config
CMD ["sh", "run-zlm.sh"]
