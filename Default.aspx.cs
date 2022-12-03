using COSXML.Auth;
using COSXML;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.EnterpriseServices;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;
using COSXML.Common;
using COSXML.Transfer;
using COSXML.Model.Bucket;
using COSXML.Model.Tag;
using COSXML.Model.Object;
using System.Web.Http.Results;

namespace Web_HyperVC
{
    public partial class _Default : Page
    {
        //指定上传文件在服务器上的保存路径
        public string savePath = "D:\\VC_VS_PROJECT\\Web_HyperVC\\MatUploadFile";
        //高光谱图像路径
        public string ImgPath;


        protected void BtnUpImg_Click(object sender, EventArgs e)
        {
            UploadImg();
        }

        protected void CheckBox_Dataset1_CheckedChanged(object sender, EventArgs e)
        {
            CheckedChanged(0);
        }

        protected void CheckBox_Dataset2_CheckedChanged(object sender, EventArgs e)
        {
            CheckedChanged(1);
        }

        protected void CheckBox_Dataset3_CheckedChanged(object sender, EventArgs e)
        {
            CheckedChanged(2);
        }

        protected void BtnStart_Click(object sender, EventArgs e)
        {
            WaitLoading();
        }
        private void UploadImg()    
        {
            //TODO：判断服务器端是否已有文件
            //判断是否上传了文件
            if (fileImgUp.HasFile)
            {
                string fileFormat = fileImgUp.FileName.Substring(fileImgUp.FileName.Length - 4);
                //检查文件格式
                if (fileFormat == ".mat")
                {
                    //检查服务器上是否存在这个物理路径，如果不存在则创建
                    if (!System.IO.Directory.Exists(@savePath))
                    {
                        System.IO.Directory.CreateDirectory(@savePath);
                    }
                    savePath = savePath + "\\" + fileImgUp.FileName;
                    fileImgUp.SaveAs(savePath);//保存文件
                    ImgPath = savePath;
                    lblStatus.Text = "是否正确上传图像：是";
                    lblStatusFormat.Text = "当前文件格式：(.mat)";

                    FileInfo fileInfo = new FileInfo(@savePath);
                    lblImgName.Text = fileInfo.Name;
                    lblImgSize.Text = (fileInfo.Length / 1024).ToString()+" KB";
                    BtnStart.Enabled = true;
                }
                else
                {
                    lblStatusFormat.Text = "当前文件格式：(" + fileFormat + ")" + "  请上传正确格式的图像！";
                }
            }
        }

        private void CheckedChanged(int index)
        {
            if(index == 0 && CheckBox_Dataset1.Checked == true)
            {
                CheckBox_Dataset2.Checked = false;
                CheckBox_Dataset3.Checked = false;
                lblDataSet.Text = CheckBox_Dataset1.Text;
            }
            else if(index == 1 && CheckBox_Dataset2.Checked == true)
            {
                CheckBox_Dataset1.Checked = false;
                CheckBox_Dataset3.Checked = false;
                lblDataSet.Text = CheckBox_Dataset2.Text;
            }
            else if(index == 2 && CheckBox_Dataset3.Checked == true)
            {
                CheckBox_Dataset1.Checked = false;
                CheckBox_Dataset2.Checked = false;
                lblDataSet.Text = CheckBox_Dataset3.Text;
            }
        }
        private void WaitLoading()
        {
            lblLoadingHyperVC.Text = "图像分类中...请耐心等待...";
            CheckFromCOS();
            //ImageOut.ImageUrl = "https://hypervc-1313154504.cos.ap-shanghai.myqcloud.com/output.png";
        }

        /// <summary>
        /// 查询是否已上传分类结果文件，文件上传于腾讯云COS
        /// </summar>
        private void CheckFromCOS()
        {
            //初始化 CosXmlConfig 
            string appid = "1313154504";//设置腾讯云账户的账户标识 APPID
            string region = "ap-shanghai"; //设置一个默认的存储桶地域
            CosXmlConfig config = new CosXmlConfig.Builder()
              .IsHttps(true)  //设置默认 HTTPS 请求
              .SetRegion(region)  //设置一个默认的存储桶地域
              .SetDebugLog(true)  //显示日志
              .Build();  //创建 CosXmlConfig 对象

            string secretId = ""; //"云 API 密钥 SecretId";
            string secretKey = ""; //"云 API 密钥 SecretKey";
            long durationSecond = 600;  //每次请求签名有效时长，单位为秒
            QCloudCredentialProvider cosCredentialProvider = new DefaultQCloudCredentialProvider(
              secretId, secretKey, durationSecond);

            CosXml cosXml = new CosXmlServer(config, cosCredentialProvider);

            //检查图像对象是否存在
            try
            {
                string bucket = "hypervc-1313154504";
                string key = "output.png"; //对象键
                DoesObjectExistRequest request = new DoesObjectExistRequest(bucket, key);
                //执行请求
                bool exist = cosXml.DoesObjectExist(request);
                //请求成功
                Console.WriteLine("object exist state is: " + exist);
                
                if(exist== true)    //分类已经完成，对象存在
                {
                    lblLoadingHyperVC.Text = "分类已经完成，即将跳转分类结果页面...（若长时间未跳转请点击网页顶部手动跳转）";
                    Response.Redirect("~/Result.aspx");
                }
            }
            catch (COSXML.CosException.CosClientException clientEx)
            {
                //请求失败
                Console.WriteLine("CosClientException: " + clientEx);
            }
            catch (COSXML.CosException.CosServerException serverEx)
            {
                //请求失败
                Console.WriteLine("CosServerException: " + serverEx.GetInfo());
            }
        }


        
    }
}