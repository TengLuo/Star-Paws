package jhu.petstore.util;

public class OrderItem {
    private int productId;
    private int productQuant;
    private String productName;
    private double productPrice;
    private double totalPrice;

    public OrderItem(int productId, int productQuant, String productName, double productPrice){
        this.productId = productId;
        this.productQuant = productQuant;
        this.productName = productName;
        this.productPrice = productPrice;
        this.totalPrice = productPrice * productQuant;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getProductQuant() {
        return productQuant;
    }

    public void setProductQuant(int productQuant) {
        this.productQuant = productQuant;
    }
}
