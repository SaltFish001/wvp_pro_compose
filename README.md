# wvp_pro_compose
基于本人踩坑出来的WVP配置
## 如何使用
  step -1： ``请一定仔细阅读配置的各项说明``
  
  step 0: 找教程安装Docker及docker-compose

  step 1: 复制一份``.env.example`` 到根目录， 并改名``.env``

  step 2: 必须修改``SIP_IP`` 以及 ``STREAM_HOST`` 变量

  step 3: 根据描述， 按需修改各项变量， 特别注意[config.ini](./wvp/config/config.ini) 文件的 [http].port需要手动修改，且要与``MEDIA_PORT``保持一致

  step 4: 执行

      docker-compose up -d
  
  step 5: 遇到问题可以在WVP-PRO官方交流群找咸鱼(SaltFish)管理员
