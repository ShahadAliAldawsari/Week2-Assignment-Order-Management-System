import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

//4. Exception Handling
//        ○ Create a custom exception OutOfStockException for when stock is
//            insufficient.
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
//    private HashMap<UUID, Order> userOrderHistory; //to store user order history.
    private HashMap<UUID, List<Order>> userOrderHistory = new HashMap<UUID, List<Order>>(); //to store user order history.


    public OrderManager() {
        orders = new ArrayList<>();
        userOrderHistory = new HashMap<>();
    }


    public void addOrder(Order order) {
        orders.add(order);
            userOrderHistory.computeIfAbsent(order.getUserID(), k -> new ArrayList<>()).add(order);
            System.out.println("Order placed successfully");
    }

    // Get order history for a specific user
    public void getUserOrderHistory(UUID userID) {
        List<Order> userOrders = userOrderHistory.get(userID);
        if (userOrders == null || userOrders.isEmpty()) {
            System.out.println("No orders found for UserID " + userID);
        } else {
            for (Order order : userOrders) {
                System.out.println(order);
            }
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
