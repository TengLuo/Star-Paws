package jhu.petstore.dao;

import jhu.petstore.entity.db.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    public User getUserById(String user_id) {
        Session session = sessionFactory.openSession();
        User user = session.get(User.class, user_id);
        return user;
    }
}
