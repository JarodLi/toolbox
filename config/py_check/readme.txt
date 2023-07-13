1. python工程需要在项目root目录下放置pyrightconfig.json，配置root目录, 否则unittest中import无法自动识别
{                                                         
  "executionEnvironments": [{ "root": "." }]                                                           
}                                                         
