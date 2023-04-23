package jhu.petstore.service;

import jhu.petstore.dao.UserDao;
import jhu.petstore.entity.db.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProfileService {
    @Autowired
    private UserDao userDao;

    public User getUserById(String user_id) {
        return this.userDao.getUserById(user_id);
    }
}
