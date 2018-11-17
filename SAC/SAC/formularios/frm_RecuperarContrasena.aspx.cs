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
    public partial class frm_RecuperarContrasena : System.Web.UI.Page
    {
        String[] vector =  {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9"};
        metodos.metodos_login entrar = new metodos.metodos_login();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_enviar_Click(object sender, EventArgs e)
        {
            String aleatorio = "";
            Random rnd = new Random();
            if (entrar.Estausuario(txt_usuario.Value) == true)
            {
                String correo = entrar.Correo(txt_usuario.Value);
                if (correo == txt_correo.Value)
                {
                    for (int i = 0; i <= 14; i++)
                    {
                        int j = rnd.Next(0,62);
                        aleatorio = aleatorio + vector[j];
                    }
                    entrar.TemporalC(txt_usuario.Value, aleatorio);

                    //Configuración del Mensaje
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                    //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
                    mail.From = new MailAddress("clinicadental.alinacamacho@gmail.com");
                    //Aquí ponemos el asunto del correo
                    mail.Subject = "Restauración de contraseña";
                    //Aquí ponemos el mensaje que incluirá el correo
                    mail.Body = "Este es un mensaje para restaurar su contraseña.\n" +
                        "Su usuario es: "+txt_usuario.Value+".\n" +
                        "Su contraseña es: "+aleatorio+".\n" +
                        "Clínica Dental Alina Camacho";
                    //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
                    mail.To.Add(txt_correo.Value);


                    //Configuracion del SMTP
                    SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
                                           //Especificamos las credenciales con las que enviaremos el mail
                    SmtpServer.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    SmtpServer.Credentials = new System.Net.NetworkCredential("clinicadental.alinacamacho@gmail.com", "SAC-corredores.2018");
                    SmtpServer.EnableSsl = true;
                    SmtpServer.Send(mail);
                    string script = @"<script type='text/javascript'>
                    alert('Se ha enviado a su correo una contraseña nueva. Por seguridad se le recomienda cambiarla lo más pronto posible!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
                else
                {
                    string script = @"<script type='text/javascript'>
                    alert('Este correo no se encuentra registrado!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
            else
            {
                string script = @"<script type='text/javascript'>
                    alert('Este usuario no se encuentra registrado!');
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }
    }
}