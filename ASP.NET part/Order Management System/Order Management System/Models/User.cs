using System.ComponentModel.DataAnnotations;

namespace Order_Management_System.Models
{
    public class User
    {
        [Key] // Marks this as the primary key
        public int UserId { get; set; }

        [Required, StringLength(100)]
        public string Name { get; set; }

        [Required, EmailAddress]
        public string Email { get; set; }

        [Required, DataType(DataType.Password)]
        public string Password { get; set; }

        // Navigation Property (Optional - If you want to fetch user orders)
        public List<Order>? Orders { get; set; }
    }
}
