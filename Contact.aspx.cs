using System;
using System.Web.UI;

namespace Web_HyperVC
{
    public partial class Contact : Page
    {
        protected void BtnContactSend_Click(object sender, EventArgs e)
        {
            BtnContactSend.Text = "发送成功!";
        }
    }
}