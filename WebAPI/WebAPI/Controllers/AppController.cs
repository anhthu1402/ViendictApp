using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebAPI.Database;
using System.Data;
using System.Data.SqlClient;

namespace WebAPI.Controllers
{
    public class AppController : ApiController
    {
        [Route("api/AppController/GetAllGrammarTitle")]
        [HttpGet]
        public IHttpActionResult GetAllGrammarTitle()
        {
            try
            {
                DataTable result = Database.Database.ReadTable("Proc_GetAllGrammarTitle");
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetAllWishTypes")]
        [HttpGet]
        public IHttpActionResult GetAllWishTypes()
        {
            try
            {
                DataTable result = Database.Database.ReadTable("Proc_GetAllWishTypes");
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetAllGrammarTenses")]
        [HttpGet]
        public IHttpActionResult GetAllGrammarTenses()
        {
            try
            {
                DataTable result = Database.Database.ReadTable("Proc_GetAllGrammarTenses");
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetGrammarTenseByTenseID")]
        [HttpGet]
        public IHttpActionResult GetGrammarTenseByTenseID(int TenseID)
        {
            try
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("TenseID", TenseID);
                DataTable result = Database.Database.ReadTable("Proc_GetGrammarTenseByTenseID", param);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }
        [Route("api/AppController/GetAllVocabTopic")]
        [HttpGet]
        public IHttpActionResult GetAllVocabTopic()
        {
            try
            {
                DataTable result = Database.Database.ReadTable("Proc_GetAllVocabTopic");
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetVocabByTopic")]
        [HttpGet]
        public IHttpActionResult GetVocabByTopic(int TopicID)
        {
            try
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("TopicID", TopicID);
                DataTable result = Database.Database.ReadTable("Proc_GetVocabByTopic", param);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetWishSentence")]
        [HttpGet]
        public IHttpActionResult GetWishSentence(int ID)
        {
            try
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("ID", ID);
                DataTable result = Database.Database.ReadTable("Proc_GetWishSentence", param);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetConditionalSentenceTypes")]
        [HttpGet]
        public IHttpActionResult GetConditionalSentenceTypes(int ID)
        {
            try
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("ID", ID);
                DataTable result = Database.Database.ReadTable("Proc_GetConditionalSentenceTypes", param);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/UserSignup")]
        [HttpPost]
        public IHttpActionResult UserSignup(UserAccount user)
        {
            try
            {
                UserAccount result = Database.Database.UserSignup(user);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/UserSignin")]
        [HttpGet]
        public IHttpActionResult DangNhap(string Email, string Password)
        {
            try
            {
                UserAccount result = Database.Database.UserSignin(Email, Password);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/AddToFavorite")]
        [HttpPost]
        public IHttpActionResult AddToFavorite(Favorite favorite)
        {
            try
            {
                int kq = Database.Database.AddToFavorite(favorite);
                return Ok(kq);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetListFavorite")]
        [HttpGet]
        public IHttpActionResult GetListFavorite()
        {
            try
            {
                DataTable result = Database.Database.ReadTable("Proc_GetListFavorite");
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }
    }
}
