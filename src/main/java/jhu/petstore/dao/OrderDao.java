package jhu.petstore.dao;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import jhu.petstore.entity.db.Order;
import jhu.petstore.entity.db.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jakarta.persistence.*;

import java.util.List;

@Repository
public class OrderDao {

    @Autowired
    private SessionFactory sessionFactory;

    public boolean placeOrder(Order order) {
        Session session = null;

        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            session.save(order);
            session.getTransaction().commit();
        } catch (PersistenceException | IllegalStateException ex) {
            // if hibernate throws this exception, it means the user already be register
            ex.printStackTrace();
            session.getTransaction().rollback();
            return false;
        } finally {
            if (session != null) session.close();
        }
        return true;
    }

    public List<String> getOrdersByUserId(String userId) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaQuery<String> query = criteriaBuilder.createQuery(String.class);
            Root<Order> root = query.from( Order.class );
            query.select( root.get( "orderNumber" ) );
            query.where( criteriaBuilder.equal( root.get( "userId" ) , userId ) );
            query.groupBy(root.get( "orderNumber" ));
            List<String> orders = session.createQuery(query).getResultList();
            session.close();
            return orders;
        } catch (PersistenceException | IllegalStateException ex) {
            // if hibernate throws this exception, it means the user already be register
            ex.printStackTrace();
            session.getTransaction().rollback();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    public List<Order> getOrdersByOrderNumber(String orderNumber) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaQuery<Order> query = criteriaBuilder.createQuery(Order.class);

            Root<Order> root = query.from( Order.class );
            query.where( criteriaBuilder.equal( root.get( "orderNumber" ) , orderNumber ) );
            List<Order> orders = session.createQuery(query).getResultList();
            session.close();
            return orders;
        } catch (PersistenceException | IllegalStateException ex) {
            // if hibernate throws this exception, it means the user already be register
            ex.printStackTrace();
            session.getTransaction().rollback();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }
}
