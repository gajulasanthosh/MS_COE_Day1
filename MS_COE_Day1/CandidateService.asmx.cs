using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace MS_COE_Day1
{
    /// <summary>
    /// Summary description for CandidateService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class CandidateService : System.Web.Services.WebService
    {
        static List<Candidate> Candidates = new List<Candidate>();

        //private CandidateModel _candidateModel;
        //public CandidateService(CandidateModel candidateModel)
        //{
        //    _candidateModel = candidateModel;
        //}

        [WebMethod]
        public string AddCandidate(string name, string email)
        {
            Candidate candidate = new Candidate()
            {
                Name = name,
                Email = email,
                ID = Candidates.Count + 1
            };
            //_candidateModel.AddCandidate(name, email);
            Candidates.Add(candidate);
            return candidate.Name + " data added";
        }

        [WebMethod]
        public List<Candidate> GetCandidates()
        {
            return Candidates;
        }

        [WebMethod]
        public void DeleteCandidatesById(int CID)
        {
            var candidate = Candidates.FirstOrDefault(p => p.ID == CID); 
            if(candidate != null)
            {
                Candidates.Remove(candidate);
                //return candidate.Name + " data is deleted";
            }
            //return "Candidate not found";
        }
    }

    public class Candidate
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
    }
}
