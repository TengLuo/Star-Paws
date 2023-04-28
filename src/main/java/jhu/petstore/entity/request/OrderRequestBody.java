package jhu.petstore.entity.request;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import jhu.petstore.entity.db.Product;

public class OrderRequestBody {
    private final String orderDate;
    private final String userId;
    private final String address;
    private final Product[] products;

    @JsonCreator
    public OrderRequestBody(
            @JsonProperty("user_id") String userId,
            @JsonProperty("order_date") String orderDate,
            @JsonProperty("address") String address,
            @JsonProperty("products") Product[] products

            ) {
        this.userId = userId;
        this.address = address;
        this.orderDate = orderDate;
        this.products = products;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public String getUserId() {
        return userId;
    }

    public String getAddress() {
        return address;
    }

    public Product[] getProducts() {
        return products;
    }
}
