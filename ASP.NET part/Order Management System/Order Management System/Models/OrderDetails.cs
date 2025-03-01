using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Order_Management_System.Models
{
    public class OrderDetails
    {
        [Key]
        public int OrderDetailId { get; set; }

        [Required, ForeignKey("Order")]
        public int OrderId { get; set; }

        [Required, ForeignKey("Product")]
        public int ProductId { get; set; }

        [Required, Range(1, int.MaxValue, ErrorMessage = "Quantity must be at least 1")]
        public int Quantity { get; set; }

        [Required]
        public decimal SubTotal { get; set; }

        // Navigation Properties
        public Order? Order { get; set; }
        public Product? Product { get; set; }
    }

}
