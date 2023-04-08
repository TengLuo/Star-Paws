package jhu.petstore.entity;


import jakarta.persistence.*;
import lombok.Data;


@Data
@Entity
@Table(name= "User")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column
    private String name;
    @Column
    private String email;

}
