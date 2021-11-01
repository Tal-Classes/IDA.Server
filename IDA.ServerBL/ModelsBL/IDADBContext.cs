using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDA.ServerBL.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace IDA.ServerBL.Models
{
    public partial class IDADBContext : DbContext
    {
        public User Login(string email, string pswd)
        {
            return this.Users.Where(u => u.Email == email && u.UserPswd == pswd).FirstOrDefault();

        }
    }
}
