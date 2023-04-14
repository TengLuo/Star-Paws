package jhu.petstore.dao;

import jakarta.annotation.Resource;
import jhu.petstore.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @Resource
    private SessionFactory sessionFactory;

    private Session currentSession(){
        return this.sessionFactory.openSession();
    }
    @Override
    public List<User> getAllUser() {
        System.out.println("Result of getAllUser query: " + currentSession().createQuery("from jhu.petstore.entity.User").list());
        return currentSession().createQuery("from jhu.petstore.entity.User").list();
    }
}
