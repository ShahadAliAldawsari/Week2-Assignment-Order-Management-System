import java.util.UUID;

public class Product {
    // ○ Product (ProductID, Name, Category, Price, StockQuantity).
    protected UUID productID;
    protected String name;
    protected String category;
    protected double price;
    protected int stockQuantity;

    protected Product(String name, String category, double price, int stockQuantity) {
        productID = UUID.randomUUID();
        this.name = name;
        this.category = category;
        this.price = price;
        this.stockQuantity = stockQuantity;
    }

    // Check stock availability
    public void checkStock(int requestedQuantity) throws OutOfStockException {
        if (requestedQuantity > stockQuantity) {
            throw new OutOfStockException("Insufficient stock for " + name + ". Available: " + stockQuantity);
        }
    }

    // Update stock after successful order
    public void reduceStock(int quantity) {
        stockQuantity -= quantity;
    }

    public UUID getProductID() {
        return productID;
    }
    public void setName(String newName) {
        name = newName;
    }
    public String getName() {
        return name;
    }
    public void setCategory(String newCategory) {
        category = newCategory;
    }
    public String getCategory() {
        return category;
    }
    public void setPrice(double newPrice) {
        price = newPrice;
    }
    public double getPrice() {
        return price;
    }
    public void setStockQuantity(int newStockQuantity) {
        stockQuantity = newStockQuantity;
    }
    public int getStockQuantity() {
        return stockQuantity;
    }

    @Override
    public String toString() {
        return "Product ID: " + productID + ", Name: " + name + ", Price: $" + price + ", Stock: " + stockQuantity;
    }

}
    //2. Implements Object-Oriented Programming (OOP) Principles
    //        ○ Use Inheritance: Extend Product into Electronics and Clothing classes
    //            with additional properties.
    //        ○ Use Polymorphism: Override a calculateDiscount() method in different
    //            product types.

    class Electronics extends Product {
        private int voltage;
        private boolean rechargeable;
        private boolean RequiresBattery;

        public Electronics(String name, String category, double price, int stockQuantity, int voltage, boolean rechargeable, boolean RequiresBattery) {
            super(name, category, price, stockQuantity);
            this.voltage = voltage;
            this.rechargeable = rechargeable;
            this.RequiresBattery = RequiresBattery;
        }

        public void calculateDiscount() {
            price *= 0.1;
            System.out.println("The device price became " + price);
        }

        public void setVoltage(int newVoltage) {
            voltage = newVoltage;
        }
        public int getVoltage() {
            return voltage;
        }
        public void setRechargeable(boolean newRechargeable) {
            rechargeable = newRechargeable;
        }
        public boolean getRechargeable() {
            return rechargeable;
        }
        public void setRequiresBattery(boolean newRequiresBattery) {
            RequiresBattery = newRequiresBattery;
        }
        public boolean getRequiresBattery() {
            return RequiresBattery;
        }

    }

    class Clothing extends Product {
        private String targetedGender;
        private String size;
        private String material;

        public Clothing(String name, String category, double price, int stockQuantity, String targetedGender, String size, String material) {
            super(name, category, price, stockQuantity);
            this.targetedGender = targetedGender;
            this.size = size;
            this.material = material;
        }

        public void calculateDiscount() {
            price *= 0.15;
            System.out.println("The clothing price became " + price);
        }

        public void setTargetedGender(String newGender) {
            targetedGender = newGender;
        }
        public String getTargetedGender() {
            return targetedGender;
        }
        public void setSize(String newSize) {
            size = newSize;
        }
        public String getSize() {
            return size;
        }
        public void setMaterial(String newMaterial) {
            material = newMaterial;
        }


    }