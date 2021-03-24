using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Crm.Controllers
{
    public class RegistroController : Controller
    {
        private List<Crm.Models.usuario> listUser;

        // GET: Registro
        public ActionResult Index()
        {
            try
            {
                using (var dbContext = new Models.UsersEntities())
                {
                    var User = (dbContext.usuarios);
                    listUser = User.AsEnumerable().Select(p => new Crm.Models.usuario
                    {
                        apellido = p.apellido,
                        nombre = p.nombre,
                        rol = p.rol,
                        idusr = p.idusr,
                        usuario1 = p.usuario1
                    }).ToList();


                }
            }
            catch (Exception exception)
            {

                return RedirectToAction("Index");
            }

            return View("Index", listUser);
        }

        // GET: Registro/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Registro/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Registro/Save
        [HttpPost]
        public ActionResult Save(FormCollection collection, Crm.Models.usuario usuario)
        {



            try
            {
                Crm.Models.UsersEntities db = new Models.UsersEntities();

                ObjectParameter Output = new ObjectParameter("r", typeof(Int32));

                var clave = this.Encriptar(collection["clave"], "SeguridadMd5Root");

                db.sp_insert_usuario(collection["usuario1"], clave, collection["nombre"], collection["apellido"], Output);
                db.usuarios.Create();

                usuario.LoginErrorMessage = Output.Value.ToString();


            }
            catch (Exception e)
            {
                usuario.LoginErrorMessage = e.Message.ToString();

            }

            return View("Save", usuario);
        }

        // GET: Registro/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Registro/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Registro/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Registro/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        // POST: Registro/Participantes
        [HttpPost]
        public ActionResult Participantes(FormCollection collection) {

            var msg = "";
            var success = 0;
            int pais = 0;
            int localidad = 0;
            try
            {
                Crm.Models.UsersEntities db = new Models.UsersEntities();

                ObjectParameter Output = new ObjectParameter("r", typeof(Int32));

                var clave = this.Encriptar(collection["clave"], "SeguridadMd5Root");

                Int32.TryParse(collection["pais"], out pais);
                Int32.TryParse(collection["pais"], out localidad);

                db.sp_registro_participantes(collection["nombre"], collection["apellidos"], collection["dni"], collection["email"], pais, localidad, clave, Output);
                db.usuarios.Create();

                msg = Output.Value.ToString();
                success = 1;

            }
            catch (Exception e)
            {
                msg = e.Message.ToString();
                success = 0;
            }

            return Json(new {success=success,msg=msg });
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
    }
}
