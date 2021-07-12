using System;
using System.Collections.Generic;
using System.Text;

namespace Entities
{
    public class Review
    {
        public int Id { get;private set; }
        public Shop Shop { get; private set; }
        public AppUser User { get;private set; }
        public string ReviewText { get;private set; }
        public int Score { get; private set; }
    }
}
