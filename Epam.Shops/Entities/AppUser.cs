using System;

namespace Entities
{
    public class AppUser
    {
        public string Username { get; private set; }
        public string Password { get; private set; }
        public string Email { get; private set;}
        public Role Role { get; private set; }
    }
}
