package jhu.petstore.service;

import jhu.petstore.dao.OrderDao;
import jhu.petstore.entity.db.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class OrderService {

    @Autowired
    private OrderDao orderDao;

    public boolean placeOrder(Order order) throws IOException {
        return orderDao.placeOrder(order);
    }
}
