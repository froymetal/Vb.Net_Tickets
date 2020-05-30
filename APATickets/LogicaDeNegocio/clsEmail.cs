using System;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Threading;
using System.ComponentModel;

namespace APATickets.LogicaDeNegocio
{
    public class clsEmail
    {
        public void Enviacorreo(string mail, string asunto, string mensaje)
        {

            string superior = @"<table width='700' border='0' cellpadding='2' cellspacing='2'>
                              <tr><td><img src='http://alfredoparedesyasociados.com/download/soporte/banner_soporte.jpg' alt='graf' name='grafico'  align='top'></td></tr>
                              <tr><td>";
            string inferior = @"</td></tr><tr>
                              <td><img src='http://alfredoparedesyasociados.com/download/soporte/banner_inf1.jpg' alt='graf' name='grafico'  align='top'></td>
                              </tr></table>";

            SmtpClient client = new SmtpClient("mail.apaconsultores.com");
            client.Port = 25;
            //client.EnableSsl = false;
            client.UseDefaultCredentials = false;

            NetworkCredential credentials = new NetworkCredential("tickets@apaconsultores.com", "4QuQl@lmkJZXBmR.");
            client.Credentials = credentials;

            MailMessage Mensaje = new MailMessage();

            Mensaje.To.Add(new MailAddress(mail));
            Mensaje.Subject = asunto;
            Mensaje.Body = superior + mensaje + inferior;

            //Mensaje.To.Add(new MailAddress("software@alfredoparedesyasociados.com"));
            //Mensaje.CC.Add(new MailAddress("software@alfredoparedesyasociados.com"));
            Mensaje.From = new MailAddress("tickets@apaconsultores.com");
            //Mensaje.Subject = "Prueba";
            Mensaje.IsBodyHtml = true;
            //Mensaje.Body = "Saludos desde visual studio 2012!";
            Mensaje.Priority = MailPriority.High;

            try
            {
                client.Send(Mensaje);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error:" + ex.ToString());
            }
            Console.WriteLine("Envio realizado.");
        }
    }
}