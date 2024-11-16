using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;

namespace Negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailService() 
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("tcarrasquero82@gmail.com", "qznb trck ptvn dxua");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }

        public void armarMail(string emailDestino, string paciente, string doctor, DateTime fecha, TimeSpan hora)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@clinicafrgp.com");
            email.To.Add(emailDestino);
            email.Subject = "";
            email.IsBodyHtml = true;
            email.Body = "<h1>Hola " + paciente + "</h1>" + "<b><h2>Tu turno ha sido registrado<b><h3>Feha: " + fecha + "</h3><h3>Hora: " + hora + "</h3><h3>Especialista: " + doctor + "</h3><br><p>De no poder concurrir, rogamos notificar con anticipación</p><p> Mail generado automaticamento. No responder</p>";
        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {
                Console.WriteLine("No se pudo enviar email");
            }
        }

    }
}
