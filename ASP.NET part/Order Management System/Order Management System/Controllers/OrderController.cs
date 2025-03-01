using Microsoft.AspNetCore.Mvc;
using Order_Management_System.Models;

namespace Order_Management_System.Controllers
{
    public class OrderController : Controller
    {
        public IActionResult PlaceOrder(int productId)
        {
            var order = new Order
            {
                UserId = 1, // For testing purposes, assume UserId = 1
                OrderDate = DateTime.Now,
                Status = "Pending"
            };

            var orderDetails = new OrderDetails
            {
                ProductId = productId,
                Quantity = 1, // Default quantity
                SubTotal = 3500 // You can customize this later
            };

            ViewBag.ProductId = productId; // Pass productId to the view
            return View(orderDetails);
        }

        // POST: /Orders/PlaceOrder
        [HttpPost]
        public IActionResult PlaceOrder(OrderDetails orderDetails)
        {
            if (ModelState.IsValid)
            {
                TempData["Message"] = "Order placed successfully!";
                return RedirectToAction("OrderHistory", new { userId = 1 });
            }
            return View(orderDetails);
        }

        // GET: /Orders/OrderHistory/{userId}
        public IActionResult OrderHistory(int userId)
        {
            var orders = new List<Order>
            {
                new Order { OrderId = 1, UserId = userId, OrderDate = DateTime.Now, Status = "Completed" }
            };

            return View(orders);
        }
    }
}
