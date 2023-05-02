package jhu.petstore.dao;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jhu.petstore.entity.db.Product;
import jhu.petstore.entity.db.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDao {

    @Autowired
    private SessionFactory sessionFactory;

    public List<Product> getAll() {
        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
        criteriaQuery.select(criteriaQuery.from(Product.class));
        List<Product> product = session.createQuery(criteriaQuery).getResultList();
        session.close();
        return product;
    }

    public Product getProductById(int product_id) {
        Session session = sessionFactory.openSession();
        Product product = session.get(Product.class, product_id);
        return product;
    }
}
