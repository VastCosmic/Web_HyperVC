using COSXML;
using COSXML.Auth;
using COSXML.Transfer;
using System;
using System.Threading.Tasks;
using System.Web.UI;

namespace Web_HyperVC
{
    public partial class Contact : Page
    {
        string secretId = ""; //"云 API 密钥 SecretId";
        string secretKey = ""; //"云 API 密钥 SecretKey";
        protected void BtnContactSend_Click(object sender, EventArgs e)
        {
            WriteTofile();
            BtnContactSend.Text = "发送成功!";
            TxtBoxContact.Text = string.Empty;
        }

        protected void WriteTofile()
        {
            string text = TxtBoxContact.Text;
            string UpLoadName = "Contact_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
            string UpLoadPath = "D:\\VC_VS_PROJECT\\Web_HyperVC\\Message\\" + UpLoadName;
            System.IO.File.WriteAllText(@UpLoadPath, text);
            SendToCosAsync(UpLoadName, UpLoadPath);
        }

        protected async Task SendToCosAsync(string key, string UpLoadPath)
        {
            //初始化 CosXmlConfig 
            string appid = "1313154504";//设置腾讯云账户的账户标识 APPID
            string region = "ap-shanghai"; //设置一个默认的存储桶地域
            CosXmlConfig config = new CosXmlConfig.Builder()
              .IsHttps(true)  //设置默认 HTTPS 请求
              .SetRegion(region)  //设置一个默认的存储桶地域
              .SetDebugLog(true)  //显示日志
              .Build();  //创建 CosXmlConfig 对象

            long durationSecond = 600;  //每次请求签名有效时长，单位为秒
            QCloudCredentialProvider cosCredentialProvider = new DefaultQCloudCredentialProvider(
              secretId, secretKey, durationSecond);

            CosXml cosXml = new CosXmlServer(config, cosCredentialProvider);

            // 初始化 TransferConfig
            TransferConfig transferConfig = new TransferConfig();

            // 初始化 TransferManager
            TransferManager transferManager = new TransferManager(cosXml, transferConfig);

            String bucket = "hypervc-1313154504"; //存储桶，格式：BucketName-APPID
            String cosPath = key; //对象在存储桶中的位置标识符，即称对象键
            String srcPath = UpLoadPath;//本地文件绝对路径

            // 上传对象
            COSXMLUploadTask uploadTask = new COSXMLUploadTask(bucket, cosPath);
            uploadTask.SetSrcPath(srcPath);

            uploadTask.progressCallback = delegate (long completed, long total)
            {
                Console.WriteLine(String.Format("progress = {0:##.##}%", completed * 100.0 / total));
            };

            try
            {
                COSXML.Transfer.COSXMLUploadTask.UploadTaskResult result = await
                    transferManager.UploadAsync(uploadTask);
                Console.WriteLine(result.GetResultInfo());
                string eTag = result.eTag;
            }
            catch (Exception e)
            {
                Console.WriteLine("CosException: " + e);
            }
        }

    }
}