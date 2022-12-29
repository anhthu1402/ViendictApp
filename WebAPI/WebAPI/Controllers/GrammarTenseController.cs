using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data;
using System.Data.SqlClient;

namespace WebAPI.Controllers
{
    public class GrammarTenseController : ApiController
    {
        [Route("api/GrammarTenseController/GetAllGrammarTitle")]
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

        [Route("api/GrammarTenseController/GetAllWishTypes")]
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

        [Route("api/GrammarTenseController/GetAllGrammarTenses")]
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

        [Route("api/GrammarTenseController/GetGrammarTenseByTenseID")]
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
        [Route("api/GrammarTenseController/GetAllVocabTopic")]
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

        [Route("api/GrammarTenseController/GetVocabByTopic")]
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
    }
}
