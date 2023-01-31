const restana = require('restana');
// 用于标识命令执行完成的http服务器
const service = restana()
service.all('/', (req,res)=>{
  res.send('OK !',200)
})
service.start('80')