using Microsoft.AspNetCore.Mvc;
using Order_Management_System.Models;
using System.Collections.Generic;

namespace Order_Management_System.Controllers
{
    public class ProductController : Controller
    {
        private List<Product> GetDummyProducts()
        {
            return new List<Product>
            {
                new Product { ProductId = 1, Name = "iPhone 14", Category = "Electronics", Price = 3500, StockQuantity = 10 },
                new Product { ProductId = 2, Name = "Samsung Galaxy S23", Category = "Electronics", Price = 3200, StockQuantity = 8 },
                new Product { ProductId = 3, Name = "Dell XPS 13", Category = "Laptops", Price = 6000, StockQuantity = 5 },
                new Product { ProductId = 4, Name = "AirPods Pro", Category = "Accessories", Price = 900, StockQuantity = 20 }
            };
        }

        public IActionResult Index()
        {
            var products = GetDummyProducts();
            if (products == null)
            {
                return View(new List<Product>()); // Ensure non-null model
            }
            return View(products);
        }
    }
}