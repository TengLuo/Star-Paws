package jhu.petstore.service;

import jhu.petstore.dao.ProductDao;
import jhu.petstore.dao.UserDao;
import jhu.petstore.entity.db.Product;
import jhu.petstore.entity.db.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProductService {
    @Autowired
    private ProductDao productDao;

    public List<Product> getAll() {
        return this.productDao.getAll();
    }

    public Product getProductById(int product_id) {
        return this.productDao.getProductById(product_id);
    }
}
