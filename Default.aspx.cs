using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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


        private void UploadImg()
        {
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
            }
            else if(index == 1 && CheckBox_Dataset2.Checked == true)
            {
                CheckBox_Dataset1.Checked = false;
                CheckBox_Dataset3.Checked = false;
            }
            else if(index == 2 && CheckBox_Dataset3.Checked == true)
            {
                CheckBox_Dataset1.Checked = false;
                CheckBox_Dataset2.Checked = false;
            }
        }
    }
}