FROM ubuntu:20.04   as   build

ARG gitUrl="https://gitee.com/pan648540858"
ARG zlmGitUrl="https://gitee.com/xia-chu/ZLMediaKit"

COPY sources.list /etc/apt/sources.list

RUN export DEBIAN_FRONTEND=noninteractive &&\
        apt-get update && \
        apt-get install -y --no-install-recommends openjdk-11-jre git libssl-dev libsdl-dev libavcodec-dev libavutil-dev ffmpeg maven build-essential \
        cmake ca-certificates openssl ffmpeg &&\
        mkdir -p /opt/assist/config /opt/assist/heapdump /opt/media/www/record

RUN cd /home && \
        git clone "${gitUrl}/wvp-pro-assist.git" && cd wvp-pro-assist &&\
        git checkout a3d583e3b09f3cac9604d09dcd106e5491eb68b9

RUN cd /home/wvp-pro-assist && \
        mvn clean package -Dmaven.test.skip=true && \
        cp /home/wvp-pro-assist/target/*.jar /opt/assist/ 

RUN cd /home && \
        git clone --depth=1 "${zlmGitUrl}" && cd ZLMediaKit && \
        git checkout c8d95617a0aa7a2caf66e8cd924b6c23e695f0ed

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

RUN export DEBIAN_FRONTEND=noninteractive &&\
        apt-get update && \
        apt-get install -y --fix-missing --no-install-recommends openjdk-11-jre ca-certificates openssl ffmpeg language-pack-zh-hans && \
        apt-get autoremove -y && \
        apt-get clean -y && \
        rm -rf /var/lib/apt/lists/*dic

COPY --from=build /opt /opt
WORKDIR /config
CMD ["sh", "run-zlm.sh"]
