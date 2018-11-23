using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net.Mail;
using System.Net;

namespace SAC.formularios
{
    public partial class frm_CambiarContrasena : System.Web.UI.Page
    {
        metodos.metodos_login entrar = new metodos.metodos_login();
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_usuario.Focus();
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            if (entrar.Login(txt_usuario.Value.ToString(), txt_contraAnte.Value.ToString()) == true)
            {
                if (txt_contraNueva.Value == txt_contraNueva2.Value)
                {
                    entrar.TemporalC(txt_usuario.Value, txt_contraNueva.Value);
                    //Configuración del Mensaje
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                    //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
                    mail.From = new MailAddress("clinicadental.alinacamacho@gmail.com");
                    //Aquí ponemos el asunto del correo
                    mail.Subject = "Cambio de contraseña";
                    //Aquí ponemos el mensaje que incluirá el correo
                    mail.Body = "Se ha registrado un cambio de su contraseña, si no ha sido usted, por favor comuníquese con los administradores del sitio web.\n" +
                        "Su usuario es: " + txt_usuario.Value + ".\n" +
                        "Su contraseña nueva es: " + txt_contraNueva.Value + ".\n" +
                        "Clínica Dental Alina Camacho";
                    //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
                    mail.To.Add(entrar.Correo(txt_usuario.Value));


                    //Configuracion del SMTP
                    SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
                                           //Especificamos las credenciales con las que enviaremos el mail
                    SmtpServer.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    SmtpServer.Credentials = new System.Net.NetworkCredential("clinicadental.alinacamacho@gmail.com", "Citas.2018-Alina");
                    SmtpServer.EnableSsl = true;
                    SmtpServer.Send(mail);
                    txt_usuario.Value = "";
                    string script = @"<script type='text/javascript'>
                    alert('Contraseña actualizada!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
                else
                {
                    string script = @"<script type='text/javascript'>
                    alert('La contraseña nueva y su confirmación no coinciden!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
            else
            {
                string script = @"<script type='text/javascript'>
                    alert('Usuario o contraseña actual incorrecta!');
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }
    }
}