using System;
using System.Collections.Generic;

#nullable disable

namespace IDA.ServerBL.Models
{
    public partial class User
    {
        public User()
        {
            Costomers = new HashSet<Costomer>();
            Workers = new HashSet<Worker>();
        }

        public string UserName { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserPswd { get; set; }
        public string Adress { get; set; }
        public bool IsWorker { get; set; }

        public virtual ICollection<Costomer> Costomers { get; set; }
        public virtual ICollection<Worker> Workers { get; set; }
    }
}
