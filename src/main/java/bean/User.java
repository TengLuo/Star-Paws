package bean;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;


@Data
public class User {
    private String name;
    private String email;

}
