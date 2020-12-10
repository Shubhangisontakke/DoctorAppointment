using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Text;

namespace DoctorAppointment
{
    public partial class DoctorAppointment : System.Web.UI.Page
    {
        string strconn = ConfigurationManager.ConnectionStrings["DoctorAppointmentCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

         private void AddAppointment()
        {
            try
            {
                string filepath = "~/PatientReport/";
                string filename = Path.GetFileName(FileUploadReport.PostedFile.FileName);
                FileUploadReport.PostedFile.SaveAs(Server.MapPath("~/PatientReport/" + filename));
                filepath = "~/PatientReport/" + filename;


                SqlConnection con = new SqlConnection(strconn);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string strinsert = "insert into tblPatientDetails(PatientName,PatientAge,PatientDOB,PatientBloodGroup,PatientMobileNo,PatientEmail,PatientDOA,PatientReport,PatientAddress) " +
                    "values (@PatientName,@PatientAge,@PatientDOB,@PatientBloodGroup,@PatientMobileNo,@PatientEmail,@PatientDOA,@PatientReport,@PatientAddress)";
                SqlCommand cmd = new SqlCommand(strinsert, con);

                cmd.Parameters.AddWithValue("@PatientName", txtName.Text);
                cmd.Parameters.AddWithValue("@PatientAge", txtAge.Text);
                cmd.Parameters.AddWithValue("@PatientDOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@PatientBloodGroup", txtBloodGroup.Text);
                cmd.Parameters.AddWithValue("@PatientMobileNo", txtMobileNumber.Text);
                cmd.Parameters.AddWithValue("@PatientEmail", txtEmail.Text);
                cmd.Parameters.AddWithValue("@PatientDOA", txtDOA.Text);
                cmd.Parameters.AddWithValue("@PatientReport", filepath);
                cmd.Parameters.AddWithValue("@PatientAddress", txtAddress.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Patient details submitted Successfully');</script>");

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');" +
                    "</script>");

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           AddAppointment();
            
            this.SendMail();
        }

        private void SendMail()
        {
            string to = txtEmail.Text; //To address    
            string from = "doctorappointment642@gmail.com";  //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = " Helle '"+ txtName.Text +"' <br><br> Your Appointment has been submitted successfully with details you filled in form ";
            message.Subject = " Doctor's Appointment Confirmation mail ";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential("doctorappointment642@gmail.com", "Doctor@12345");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}