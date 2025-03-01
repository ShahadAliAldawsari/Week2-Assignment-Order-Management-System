import java.util.Date;
import java.util.List;
import java.util.UUID;

public class Order {
    // ○ Order (OrderID, UserID, List of OrderDetails).
    private UUID orderID;
    private UUID userID;
    private Date orderDate;
    private List<OrderDetails> orderDetails;

    //3. Uses Java Collections
    //        ○ Store orders in an ArrayList<Order>.
    //        ○ Use a HashMap<Integer, Order> to store user order history.

    public Order(UUID userID, List<OrderDetails> orderDetails) {
        this.orderID = UUID.randomUUID();
        this.userID = userID;
        this.orderDate = new Date();
        this.orderDetails = orderDetails;
    }

    @Override
    public String toString() {
        return "Order ID: " + orderID + ", User ID: " + userID + ", Date: " + orderDate + ", Details: " + orderDetails;
    }

    public UUID getOrderID() {
        return orderID;
    }

    public UUID getUserID() {
        return userID;
    }
    public void setUserID(UUID userID) {
        this.userID = userID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public List<OrderDetails> getOrderDetails() {
        return orderDetails;
    }
}
