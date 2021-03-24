using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.IO;

namespace Crm.Controllers
{
    public class Seguridad
    {
        private bool Disposing;

        /// <summary>
        /// Funcion que permite encriptar 
        /// </summary>
        /// <param name="strValor">Dato a encriptar</param>
        /// <returns>dato encriptado</returns>
        public string Encriptar(string strValor, string KEY)
        {
            try
            {
                TripleDESCryptoServiceProvider SerProDesc = new TripleDESCryptoServiceProvider();
                SerProDesc.IV = new byte[8];
                PasswordDeriveBytes PASSDerByte = new PasswordDeriveBytes(KEY, new byte[0]);
                SerProDesc.Key = PASSDerByte.CryptDeriveKey("RC2", "MD5", 128, new byte[8]);
                MemoryStream MemoriaStream = new MemoryStream((strValor.Length * 2) - 1);
                CryptoStream EncStream = new CryptoStream(MemoriaStream, SerProDesc.CreateEncryptor(), CryptoStreamMode.Write);
                byte[] PlainBytes = Encoding.UTF8.GetBytes(strValor);
                EncStream.Write(PlainBytes, 0, PlainBytes.Length);
                EncStream.FlushFinalBlock();
                byte[] EncryptedBytes = new byte[Convert.ToInt32(MemoriaStream.Length - 1) + 1];
                MemoriaStream.Position = 0;
                MemoriaStream.Read(EncryptedBytes, 0, Convert.ToInt32(MemoriaStream.Length));
                EncStream.Close();
                return Convert.ToBase64String(EncryptedBytes);
            }
            catch (Exception ex)
            {
                return string.Concat("Error: ", ex.Message.ToString());
            }
        }

        /// <summary>
        /// Funcion que permite desencriptar 
        /// </summary>
        /// <param name="strValor">dato a desencriptar</param>
        /// <returns>dato desencriptado</returns>
        public string Desencriptar(string strValor, string KEY)
        {
            try
            {
                TripleDESCryptoServiceProvider SerProDesc = new TripleDESCryptoServiceProvider();
                SerProDesc.IV = new byte[8];
                PasswordDeriveBytes PASSDerByte = new PasswordDeriveBytes(KEY, new byte[0]);
                SerProDesc.Key = PASSDerByte.CryptDeriveKey("RC2", "MD5", 128, new byte[8]);
                byte[] EncryptedBytes = Convert.FromBase64String(strValor);
                MemoryStream MemoriaStream = new MemoryStream(strValor.Length);
                CryptoStream DecStream = new CryptoStream(MemoriaStream, SerProDesc.CreateDecryptor(), CryptoStreamMode.Write);
                DecStream.Write(EncryptedBytes, 0, EncryptedBytes.Length);
                DecStream.FlushFinalBlock();
                byte[] PlainBytes = new byte[Convert.ToInt32(MemoriaStream.Length - 1) + 1];
                MemoriaStream.Position = 0;
                MemoriaStream.Read(PlainBytes, 0, Convert.ToInt32(MemoriaStream.Length));
                DecStream.Close();
                return Encoding.UTF8.GetString(PlainBytes);
            }
            catch (Exception ex)
            {
                return string.Concat("Error: ", ex.Message.ToString());
            }
        }

        #region IDisposable Members

        public void Dispose()
        {
            Dispose(true);
        }
        protected virtual void Dispose(bool b)
        {
            // Si no se esta destruyendo ya…
            if (!Disposing)
            {
                Disposing = true;
                GC.SuppressFinalize(this);
                // … libero los recursos… 
            }
        }
        ~Seguridad()
        {
            Dispose(true);
        }
        #endregion
    }
}