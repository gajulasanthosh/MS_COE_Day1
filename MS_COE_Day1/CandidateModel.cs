using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MS_COE_Day1
{
    public class CandidateModel
    {
        private readonly SQLRepository _sqlRepository;
        public CandidateModel(SQLRepository sqlRepository)
        {
            _sqlRepository = sqlRepository;
        }

        public void AddCandidate(string name, string email)
        {
            _sqlRepository.AddCandidate(name, email);
        }
    }
}