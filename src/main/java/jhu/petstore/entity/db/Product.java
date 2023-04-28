package jhu.petstore.entity.db;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;

@Data
@Entity
@Table(name = "products")
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Product implements Serializable {
    @Id
    @Column(name = "product_id")
    @JsonProperty("product_id")
    int id;
    @Column(name = "product_name")
    @JsonProperty("product_name")
    String name;
    @Column(name = "product_img")
    @JsonProperty("product_img")
    String img;
    @Column(name = "product_price")
    @JsonProperty("product_price")
    double price;
    @Column(name = "product_category")
    @JsonProperty("product_category")
    String category;
    @Transient
    int quantity;


    public Product() {

    }

    public Product(int product_id, String product_name, String product_img, double product_price, String product_category, int product_quantity) {
        this.id = product_id;
        this.name = product_name;
        this.img = product_img;
        this.price = product_price;
        this.category = product_category;
        this.quantity = product_quantity;
    }


}