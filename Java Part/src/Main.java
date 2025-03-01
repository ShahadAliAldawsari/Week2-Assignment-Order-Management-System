import java.util.*;

public class Main {

    private static Scanner scanner = new Scanner(System.in);
    private static OrderManager orderManager = new OrderManager();
    private static List<Product> products = new ArrayList<>();
    private static UUID currentUserID = UUID.randomUUID(); // Simulating logged-in user

    public static void main(String[] args) {

    //    5. Bonus (Optional)
    //        ○ Implement a simple CLI menu to allow users to place orders and view order
    //          history.
        // Adding sample products
        products.add(new Electronics("Laptop", "Electronics", 1200.0, 10, 220, true, false));
        products.add(new Clothing("T-Shirt", "Clothing", 25.0, 50, "Unisex", "M", "Cotton"));

        while (true) {
            System.out.println("\n--- Order Management System ---");
            System.out.println("1. View Products");
            System.out.println("2. Place Order");
            System.out.println("3. View Order History");
            System.out.println("4. Exit");
            System.out.print("Choose an option: ");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    viewProducts();
                    break;
                case 2:
                    placeOrder();
                    break;
                case 3:
                    viewOrderHistory();
                    break;
                case 4:
                    System.out.println("Exiting...");
                    return;
                default:
                    System.out.println("Invalid choice. Try again.");
            } // switch end
        } // while loop end


    }// main end

    private static void viewProducts() {
        System.out.println("\n--- Available Products ---");
        for (int i = 0; i < products.size(); i++) {
            System.out.println((i + 1) + ". " + products.get(i));
        }
    }

    private static void placeOrder() {
        List<OrderDetails> orderDetails = new ArrayList<>();
        while (true) {
            System.out.println("\nEnter product number to order (or 0 to finish): ");
            int productIndex = scanner.nextInt() - 1;

            if (productIndex == -1) break;

            if (productIndex < 0 || productIndex >= products.size()) {
                System.out.println("Invalid product selection.");
                continue;
            }

            System.out.print("Enter quantity: ");
            int quantity = scanner.nextInt();

            Product product = products.get(productIndex);

            try {
                product.checkStock(quantity); // Ensure stock availability
                double subTotal = product.getPrice() * quantity;
                orderDetails.add(new OrderDetails(UUID.randomUUID(), product.getProductID(), quantity, subTotal, new Date()));
                product.reduceStock(quantity); // Update stock

            } catch (OutOfStockException e) {
                System.out.println("Error: " + e.getMessage());
            }
        } // while end

        if (!orderDetails.isEmpty()) {
        Order order = new Order(currentUserID, orderDetails);
        orderManager.addOrder(order);
        } else {
            System.out.println("No products were ordered.");
        }

    }
    private static void viewOrderHistory() {
        System.out.println("\n--- Your Order History ---");
        orderManager.getUserOrderHistory(currentUserID);
    }

} // class end


//1. Defines Classes
//        ○ Product (ProductID, Name, Category, Price, StockQuantity).
//        ○ Order (OrderID, UserID, List of OrderDetails).
//        ○ OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, SubTotal).

//2. Implements Object-Oriented Programming (OOP) Principles
//        ○ Use Inheritance: Extend Product into Electronics and Clothing classes
//            with additional properties.
//        ○ Use Polymorphism: Override a calculateDiscount() method in different
//            product types.

//3. Uses Java Collections
//        ○ Store orders in an ArrayList<Order>.
//        ○ Use a HashMap<Integer, Order> to store user order history.

//4. Exception Handling
//        ○ Create a custom exception OutOfStockException for when stock is
//            insufficient.

//5. Bonus (Optional)
//        ○ Implement a simple CLI menu to allow users to place orders and view order
//            history.
