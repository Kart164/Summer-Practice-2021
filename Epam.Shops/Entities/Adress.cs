using System;
using System.Collections.Generic;
using System.Text;

namespace Entities
{
    public class Adress
    {
        public int Id { get;private set; }
        public string Country { get; private set; }
        public string City { get; private set; }
        public string Street { get; private set; }
        public string Building { get;private set; }
    }
}
