package jhu.petstore.service;

import jakarta.annotation.Resource;
import jhu.petstore.dao.UserDao;
import jhu.petstore.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;
    @Override
    public List<User> getAllUser() {
        return userDao.getAllUser();
    }
}
