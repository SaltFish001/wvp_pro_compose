# wvp_pro_compose
基于本人踩坑出来的WVP配置
#如何使用

## 从git远程下载wvp pro源码
  step -1： ``请一定仔细阅读配置的各项说明``
  
  step 0: 找教程安装Docker及docker-compose

  step 1: 复制一份``.env.example`` 到根目录， 并改名``.env``

  step 2: 必须修改``SIP_IP`` 以及 ``STREAM_HOST`` 变量

  step 3: 根据描述， 按需修改各项变量， 特别注意[config.ini](./wvp/config/config.ini) 文件的 [http].port需要手动修改，且要与``MEDIA_PORT``保持一致

  step 4: 执行

      docker-compose up -d
  
  step 5: 遇到问题可以在WVP-PRO官方交流群找咸鱼(SaltFish)管理员
  
## 基于wvp pro项目的jar包
  step -1：wvp文件夹：Dockerfile修改为Dockerfile_remote,Dockerfile_local修改为Dockerfile
  step -2: jar文件放在wvp文件夹内
  step -3：其余步骤和上面相同

## 离线环境下使用wvp_pro_compose
  step -1：互联网环境下，按照上面步骤将wvp_pro_compose程序运行起来
  step -2：互联网环境下，将镜像文件打包。 ``docker save -o wvp.tar mysql:8 redis:6.2-rc3-alpine3.13  wvp_pro_compose-main_wvp:latest`` 
  step -3：离线环境下，安装好docker、docker-compose。
  step -4：离线环境下，导入镜像文件。``docker load < wvp.tar``
  step -5: 将wvp_pro_compose部署到离线环境服务器。修改根目录下docker-compose.yaml为docker-compose-remote.yaml，docker-compose - local.yaml修改为docker-compose.yaml
  step -6: wvp_pro_compose根目录下执行``docker-compose up -d``
