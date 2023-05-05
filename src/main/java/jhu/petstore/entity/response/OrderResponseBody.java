package jhu.petstore.entity.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty;

public class OrderResponseBody {
    @JsonProperty("user_id")
    private final String userId;

    @JsonProperty("order_number")
    private final String orderNumber;

    public OrderResponseBody(String userId, String orderNumber) {
        this.userId = userId;
        this.orderNumber = orderNumber;
    }

    public String getUserId() {
        return userId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }
}
