FROM node:18.12.0-alpine3.16

RUN mkdir /project

# 复制文件
COPY . /project
WORKDIR /project/

# 安装依赖
RUN npm install

# # 执行Prisma migrate deploy, 必须要 --DATABASE_URL-- 环境变量!
# RUN npm run deploy

# 暴露端口
EXPOSE 80
# 启动命令
# 增加对sourceMap的支持,更好的查看错误堆栈
CMD ["npm", "run", "start"]