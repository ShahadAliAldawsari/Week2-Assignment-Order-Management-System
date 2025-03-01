import java.util.Date;
import java.util.UUID;


public class OrderDetails {
    // ○ OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, SubTotal).
    private UUID orderDetailID;
    private UUID orderID;
    private UUID productID;
    private int quantity;
    private double subTotal;


    public OrderDetails(UUID orderID, UUID productID, int quantity, double subTotal, Date orderdate) {
        this.orderDetailID = UUID.randomUUID();
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
        this.subTotal = subTotal;


    }


    @Override
    public String toString() {
        return "Product: " + productID + ", Quantity: " + quantity + ", SubTotal: $" + subTotal;
    }

    public UUID getOrderDetailID() {
        return orderDetailID;
    }

    public UUID getOrderID() {
        return orderID;
    }

    public UUID getProductID() {
        return productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getSubTotal() {
        return subTotal;
    }


}
