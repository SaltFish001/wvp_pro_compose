# wvp_pro_compose
基于本人踩坑出来的WVP配置
## 如何使用
  step 0: 找教程安装Docker及docker-compose

  step 1: 复制一份``.env.example`` 到根目录， 并改名``.env``

  step 2: 必须修改``WVP_IP`` 变量， 对应到宿主机IP

  step 3: 根据描述， 按需修改各项变量， 特别注意[config.ini](./wvp/config/config.ini) 文件的 [http].port需要手动修改，且要与``MEDIA_PORT``保持一致

  step 4: 执行

      docker-compose up -d