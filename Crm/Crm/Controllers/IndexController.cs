using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Crm.Controllers
{
    public class IndexController : Controller
    {


        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Welcome()
        {
            return View();
        }
        public ActionResult Sorteo()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Authorize(Crm.Models.usuario userModel)
        {
            using (Models.UsersEntities db = new Models.UsersEntities())
            {

                var userDetails = db.usuarios.Where(x => x.usuario1 == userModel.usuario1).FirstOrDefault();
                if (userDetails == null)
                {
                    userModel.LoginErrorMessage = "Usuario no exite";
                    return View("Login", userModel);
                }
                else
                {
                    var clave_registrada = userDetails.clave;
                    var clave_enviada = this.Encriptar(userModel.clave, "SeguridadMd5Root");

                    if (clave_enviada != clave_registrada)
                    {
                        userModel.LoginErrorMessage = "Clave incorrecta";
                        return View("Login", userModel);
                    }

                    if (userDetails.rol == "anonimo") {
                        userModel.LoginErrorMessage = "No tiene permisos para acceder";
                        return View("Login", userModel);
                    }
                    //HttpContext.Session.Add("UserID", userDetails.idusr );
                    HttpContext.Session.Add("Nombre", userDetails.nombre);
                    HttpContext.Session.Add("Rol", userDetails.rol);
                    return RedirectToAction("Index", "Dashboard");
                }
            }
                return View(); 
        }
        public ActionResult LogOut()
        {
            //int userId = (int)Session["userID"];
            HttpContext.Session.Abandon();
            return RedirectToAction("Login", "Index");
        }
        private string Encriptar(string pValor, string Key)
        {
            try
            {
                Crm.Controllers.Seguridad obj = new Crm.Controllers.Seguridad();
                return obj.Encriptar(pValor, Key);
            }
            catch (Exception exception)
            {

                return null;
            }
        }
        private string Desencriptar(string pValor, string Key)
        {
            try
            {
                Crm.Controllers.Seguridad obj = new Crm.Controllers.Seguridad();
                return obj.Desencriptar(pValor, Key);
            }
            catch (Exception exception)
            {

                return null;
            }
        }
    }
}