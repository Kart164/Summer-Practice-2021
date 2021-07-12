using System;
using System.Collections.Generic;
using System.Text;

namespace Entities
{
    public class Shop
    {
        public int Id { get; private set; }
        public StoreChain StoreChain { get; private set; }
        public ShopType ShopType { get;private set; }
        public Adress Adress { get;private set; }
        public float AvgRating { get; private set; }
    }
}
