import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

class OutOfStockException extends Exception {
    // Default constructor
    public OutOfStockException() {
        super("Product is out of stock.");
    }

    // Constructor with custom message
    public OutOfStockException(String message) {
        super(message);
    }
}

public class OrderManager {
    //3. Uses Java Collections
    //        ○ Store orders in an ArrayList<Order>.
    //        ○ Use a HashMap<UUID, Order> to store user order history.

    private List<Order> orders; // List to store orders
    private HashMap<UUID, Order> userOrderHistory; //to store user order history.


    public OrderManager() {
        orders = new ArrayList<Order>();
        userOrderHistory = new HashMap<UUID, Order>();
    }

    //4. Exception Handling
    //        ○ Create a custom exception OutOfStockException for when stock is
    //            insufficient.
    public void addOrder(Order order, Product product, int quantity) {
        try {
            // Check if enough stock is available
            product.checkStock(quantity);

            // Reduce stock if order is successful
            product.reduceStock(quantity);

            orders.add(order);
            userOrderHistory.put(order.getUserID(), order);
            System.out.println("Order placed successfully for " + quantity + " units of " + product.getName());

        } catch (OutOfStockException e) {
            // Handle the custom exception
            System.out.println("Order failed: " + e.getMessage());
        }

    }

    // Get order history for a specific user
    public void getUserOrderHistory(int userID) {
        Order userOrder = userOrderHistory.get(userID);
        if (userOrder != null) {
            System.out.println("Order History for UserID " + userID + ":");
            System.out.println(userOrder);
        } else {
            System.out.println("No orders found for UserID " + userID);
        }
    }

    // Display all orders
    public void displayAllOrders() {
        for (Order order : orders) {
            System.out.println(order);
        }
    }

    public List<Order> getOrders() {
        return orders;
    }

    public Order getOrder(int orderID) {
        for (Order order : orders) {
            if (order.getOrderID().equals(orderID)) {
                return order;
            }
        }
        System.out.println("Order not found: " + orderID);
        return null;
    }



}
