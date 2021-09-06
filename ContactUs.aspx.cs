using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SendEmail_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();


            mailMessage.To.Add("contact@14Blink.com");
            mailMessage.From = new MailAddress(Email.Text, Name.Text);
            mailMessage.Subject = subject.Text;
            mailMessage.Body = Message.Text;
            SmtpClient smtpClient = new SmtpClient("14Blink.com");
            mailMessage.Priority = MailPriority.High;
            smtpClient.Send(mailMessage);
            Labelsent.Visible = true;
            Message.Text= string.Empty;
            Email.Text = string.Empty;
            Name.Text = string.Empty;
            subject.Text = string.Empty;

           




        }
        catch (Exception ex)
        {
            subject.Text = ("Could not send the e-mail - error: ");
            
        }

       
    }

    
}