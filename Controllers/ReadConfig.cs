using System;
using System.IO;
using System.Web;
using YamlDotNet.Serialization;

namespace Web_HyperVC.Controllers
{
    public class ReadConfig
    {
        public string secretId;  //云 API 密钥 SecretId
        public string secretKey; //云 API 密钥 SecretKey
        public string bucket;    //云存储桶名称 
        public string appid;     //设置腾讯云账户的账户标识 APPID
        public string region;    //设置一个默认的存储桶地域

        public void LoadYaml()
        {
            var configFromFile = new Object();

            Configs config = new Configs();

            using (TextReader reader = File.OpenText(HttpContext.Current.Server.MapPath("~/") + "/HyperVC_Setting.yaml"))
            {
                Deserializer deserializer = new Deserializer();
                config = deserializer.Deserialize<Configs>(reader);
            }
            secretId = config.secretId;
            secretKey = config.secretKey;
            bucket = config.bucket;
            appid = config.appid;
            region = config.region;
        }
    }

}