using System;

namespace Web_HyperVC
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ImgName = Request.QueryString["key"];
            string PictureUrl = "https://hypervc-1313154504.cos.ap-shanghai.myqcloud.com/" + ImgName;
            ImageOut.ImageUrl = PictureUrl;
            if(PictureUrl!= "https://hypervc-1313154504.cos.ap-shanghai.myqcloud.com/")
                ImageLoad.Enabled = true;
        }

        protected void ImageLoad_Click(object sender, EventArgs e)
        {
            string ImgName = Request.QueryString["key"];
            string PictureUrl = "https://hypervc-1313154504.cos.ap-shanghai.myqcloud.com/" + ImgName;
            System.Diagnostics.Process.Start(PictureUrl);
        }
    }
}