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
        public IHttpActionResult UserSignin(string Email, string Password)
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

        [Route("api/AppController/UpdateAccount")]
        [HttpPost]
        public IHttpActionResult UpdateAccount(UserAccount user)
        {
            try
            {
                int result = Database.Database.UpdateAccount(user);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/ChangePassword")]
        [HttpPost]
        public IHttpActionResult ChangePassword(UserAccount user)
        {
            try
            {
                int result = Database.Database.ChangePassword(user);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetStudyTopicByTopicID")]
        [HttpGet]
        public IHttpActionResult GetStudyTopicByTopicID(int TopicID)
        {
            try
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("TopicID", TopicID);
                DataTable result = Database.Database.ReadTable("[Proc_GetStudyTopicByTopicID]", param);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetUserByEmail")]
        [HttpGet]
        public IHttpActionResult GetUserByEmail(string Email)
        {
            try
            {
                UserAccount result = Database.Database.GetUserByEmail(Email);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetAllStudyTopic")]
        [HttpGet]
        public IHttpActionResult GetAllStudyTopic()
        {
            try
            {
                DataTable result = Database.Database.ReadTable("Proc_GetAllStudyTopic");
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetAllStudyLessonByTopic")]
        [HttpGet]
        public IHttpActionResult GetAllStudyLessonByTopic(int TopicID)
        {
            try
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("TopicID", TopicID);
                DataTable result = Database.Database.ReadTable("Proc_GetAllStudyLessonByTopic", param);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetContentByLesson")]
        [HttpGet]
        public IHttpActionResult GetContentByLesson(int TopicID, int LessonID)
        {
            try
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("TopicID", TopicID);
                param.Add("LessonID", LessonID);
                DataTable result = Database.Database.ReadTable("Proc_GetContentByLesson", param);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetDetailContentLessonByID")]
        [HttpGet]
        public IHttpActionResult GetDetailContentLessonByID(int TopicID, int LessonID, int ID)
        {
            try
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("TopicID", TopicID);
                param.Add("LessonID", LessonID);
                param.Add("ID", ID);
                DataTable result = Database.Database.ReadTable("Proc_GetDetailContentLessonByID", param);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/StudyLessonFinished")]
        [HttpGet]
        public IHttpActionResult StudyLessonFinished(int TopicID, int LessonID)
        {
            try
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("TopicID", TopicID);
                param.Add("LessonID", LessonID);
                DataTable result = Database.Database.ReadTable("Proc_StudyLessonFinished", param);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/AddToHistory")]
        [HttpPost]
        public IHttpActionResult AddToHistory(SearchHistory word)
        {
            try
            {
                int kq = Database.Database.AddToHistory(word);
                return Ok(kq);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/GetListHistoryByUserID")]
        [HttpGet]
        public IHttpActionResult GetListHistory(int UserID)
        {
            try
            {
                DataTable result = Database.Database.GetListHistoryByUserID(UserID);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }

        [Route("api/AppController/DeleteFromHistory")]
        [HttpPost]
        public IHttpActionResult DeleteFromHistory(SearchHistory word)
        {
            try
            {
                int result = Database.Database.DeleteFromHistory(word);
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
        }
    }
}
