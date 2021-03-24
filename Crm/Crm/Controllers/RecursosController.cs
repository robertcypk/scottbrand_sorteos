using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Crm.Controllers
{
    public class RecursosController : Controller
    {
        private List<Crm.Models.tbl_paises> Listapaises;
        private List<Crm.Models.tbl_localidad> Listalocalidad;
        // GET : Registro/Paises
        public ActionResult Paises()
        {
            try
            {
                Crm.Models.UsersEntities db = new Models.UsersEntities();

                using (var dbContext = new Models.UsersEntities())
                {
                    var User = (dbContext.tbl_paises);
                    Listapaises = User.AsEnumerable().Select(p => new Crm.Models.tbl_paises
                    {
                        id = p.id,
                        pais = p.pais,
                        estatus = p.estatus
                    }).ToList();


                }
                if (Listapaises != null)
                {
                    return Json(Listapaises, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception e)
            {
                return Json(new { err = e.Message.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }
        // GET : Registro/Localidades/0
        public ActionResult Localidades(int id)
        {
            if ( id.ToString() == null) {
                return Json(new { }, JsonRequestBehavior.AllowGet);
            }
            try
            {
                Crm.Models.UsersEntities db = new Models.UsersEntities();

                using (var dbContext = new Models.UsersEntities())
                {
                    var User = (dbContext.tbl_localidad);
                    Listalocalidad = User.AsEnumerable().Where(x => x.idpais ==id).Select(p => new Crm.Models.tbl_localidad
                    {
                        id = p.id,
                        idpais = p.idpais,
                        localidad = p.localidad
                    }).ToList();


                }
                if (Listalocalidad != null)
                {
                    return Json(Listalocalidad, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception e)
            {
                return Json(new { err = e.Message.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }
        // GET: Recursos
        public ActionResult Index()
        {
            return View();
        }

        // GET: Recursos/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Recursos/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Recursos/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Recursos/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Recursos/Edit/5
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

        // GET: Recursos/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Recursos/Delete/5
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
    }
}
