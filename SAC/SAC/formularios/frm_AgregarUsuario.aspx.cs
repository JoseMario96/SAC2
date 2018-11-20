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
    public partial class frm_AgregarUsuario : System.Web.UI.Page
    {
        String[] vector = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };
        metodos.metodos_login entrar = new metodos.metodos_login();
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_usuario.Focus();
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            if (txt_usuario.Text.Contains("'") || txt_usuario.Text.Contains("="))
            {
                txt_usuario.Text = "";
                string script = @"<script type='text/javascript'>
                    alert('No se permite usar valores como ' o =');</script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            else
            {
                int tipo = 1;
                String aleatorio = "";
                String tipousuario = "Asistente";
                Random rnd = new Random();
                Boolean validar = false;
                for (int i = 0; i <= 14; i++)
                {
                    int j = rnd.Next(0, 62);
                    aleatorio = aleatorio + vector[j];
                }
                if (admin.Checked)
                {
                    tipo = 0;
                    validar = true;
                }
                else if (asist.Checked)
                {
                    tipo = 1;
                    validar = true;
                }
                else
                {
                    string scriptt = @"<script type='text/javascript'>
                    alert('Seleccione un tipo de usuario!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptt, false);
                }
                if (validar == true)
                {
                    entrar.AgregarUsuario(txt_usuario.Text, aleatorio, txt_correo.Value, tipo);
                    if (tipo == 0)
                    {
                        tipousuario = "Administrador";
                    }
                    //Configuración del Mensaje
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                    //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
                    mail.From = new MailAddress("clinicadental.alinacamacho@gmail.com");
                    //Aquí ponemos el asunto del correo
                    mail.Subject = "Usuario nuevo";
                    //Aquí ponemos el mensaje que incluirá el correo
                    mail.Body = "Se ha creado un usuario en el sitio web de la Clinica Dental Alina Camacho. Estos son sus credenciales para iniciar sesión.\n" +
                        "Su usuario es: " + txt_usuario.Text + "\n" +
                        "Su contraseña es: " + aleatorio + "\n" +
                        "Tipo de usuario: " + tipousuario + ".\n" +
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
                    alert('Se guardó la información con éxito!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
            txt_usuario.Text = "";
            txt_correo.Value = "";
        }

        protected void txt_usuario_TextChanged(object sender, EventArgs e)
        {
            if (entrar.Estausuario(txt_usuario.Text) == true)
            {
                txt_usuario.Text = "";
                string script = @"<script type='text/javascript'>
                    alert('Este usuario ya existe!');
                    </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                txt_usuario.Focus();
            }
        }
    }
}