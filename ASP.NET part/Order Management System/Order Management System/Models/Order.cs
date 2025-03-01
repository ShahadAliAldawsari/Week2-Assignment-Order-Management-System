using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Order_Management_System.Models
{
    public class Order
    {
        [Key]
        public int OrderId { get; set; }

        [Required, ForeignKey("User")]
        public int UserId { get; set; }

        [Required]
        public DateTime OrderDate { get; set; } = DateTime.Now;

        [Required]
        public string Status { get; set; } = "Pending";

        // Navigation Properties
        public User? User { get; set; }
        public List<OrderDetails>? OrderDetails { get; set; }
    }
}
