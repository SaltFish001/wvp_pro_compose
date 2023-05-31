# wvp_pro_compose

[wvp-GB28181-pro](https://github.com/648540858/wvp-GB28181-pro) && [ZLMediaKit](https://github.com/ZLMediaKit/ZLMediaKit) Docker-compose 部署方案

## 本仓库为独立部署ZLM和WVP

  从该版本开始，不在使用Gitee镜像，如有需要建议自行复制源并替换相关配置

  从该版本开始，部分设置会直接写死，如有修改需要请自行阅读各仓库wiki

## 部分说明

- sqlManager 服务是用来维护数据库变更的,如果需要自行维护数据库, 建议不使用
- 如果需要对sqlManager做自定义开发,请参考[Prisma.io](https://prisma.io)
~~- config/gateway/keys是证书放置位置,使用参考gateway说明~~
~~- 都嫌弃我的 Gateway 不好用，我去掉了！！！！！！！！！！下个版本移除相关文件~~
- `注意，本次变更较大，尤其是数据库，建议仔细阅读`

## 如何使用

  step -1： ``请一定仔细阅读配置的各项说明``
  
  step 0: 找教程安装``最新版``Docker及docker-compose

  step 1: 复制一份``.env.example`` 到根目录， 并改名``.env``

  step 2: 必须修改 ``STREAM_HOST`` 变量

  step 3: 根据描述， 按需修改各项变量， 特别注意如要修改 zlm 端口 [application.yml](./config/wvp/application.yml) 的 `media.http-port`& [config.ini](./config/zlm/config.ini) 文件的 `[http].port` 需要手动修改
  ~~step 4: 根据自己需求，替换``config/gateway``下证书，修改routes.json~~

  step 4: 执行

  ```shell
    git submodule init && git submodule update && \
    docker-compose build && docker-compose up -d
  ```
  
  step 5: 遇到问题可以在[知识星球](https://t.zsxq.com/0dpu05aPO)找咸鱼(SaltFish)
  
  <img decoding="async" src="./CopyRight.jpg" width="50%">

## 已知问题

~~- 使用``docker-compose build``构建镜像时，可能会出现``zlm``构建失败。使用``docker-compose build zlm``单独构建即可~~

- ~~gateway下websocket暂不可用，已向fast-gateway仓库提交PR。待通过~~
