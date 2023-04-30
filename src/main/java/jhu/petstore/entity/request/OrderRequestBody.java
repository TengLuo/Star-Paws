package jhu.petstore.entity.request;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import jhu.petstore.entity.db.Product;

public class OrderRequestBody {
    private final String orderDate;
    private final String address;
    private final String email;
    private final String firstName;
    private final String lastName;



    @JsonCreator
    public OrderRequestBody(
            @JsonProperty("order_date") String orderDate,
            @JsonProperty("address") String address,
            @JsonProperty("email") String email,
            @JsonProperty("first_name") String firstName,
            @JsonProperty("last_name") String lastName
            ) {
        this.address = address;
        this.orderDate = orderDate;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }
}
