package jhu.petstore.dao;

import jhu.petstore.entity.User;

import java.util.List;

public interface UserDao {

    List<User> getAllUser();
}
