
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

//Add the below
using IDA.ServerBL.Models;
using System.IO;

namespace IDA.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Controller : ControllerBase
    {
        IDADBContext context;
        public Controller(IDADBContext context)
        {
            this.context = context;
        }
    }
}
