package jhu.petstore.entity.db;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;


import java.io.Serializable;

@Entity
@Table(name = "orders")
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Order implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "order_number")
    @JsonProperty("order_number")
    private float orderNumber;

    @Column(name = "order_date")
    @JsonProperty("order_date")
    private String orderDate;

    @Column(name = "user_id")
    @JsonProperty("user_id")
    private String userId;

    @Column(name = "product_id")
    @JsonProperty("product_id")
    private int productId;

    @Column(name = "product_quant")
    @JsonProperty("product_quant")
    private int productQuant;

    @Column(name = "address")
    @JsonProperty("address")
    private String address;

    @Column(name = "first_name")
    @JsonProperty("first_name")
    private String firstName;

    @Column(name = "last_name")
    @JsonProperty("last_name")
    private String lastName;

    public Order(
            float orderNumber,
            String orderDate,
            String userId,
            int productId,
            int productQuant,
            String address,
            String firstName,
            String lastName
            ) {
        this.orderNumber = orderNumber;
        this.orderDate = orderDate;
        this.userId = userId;
        this.productId = productId;
        this.productQuant = productQuant;
        this.address = address;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public Order() {

    }

    public float getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(float orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}
