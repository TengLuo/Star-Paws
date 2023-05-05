package jhu.petstore.service;

import jhu.petstore.dao.OrderDao;
import jhu.petstore.entity.db.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderDao orderDao;

    public boolean placeOrder(Order order) throws IOException {
        return orderDao.placeOrder(order);
    }

    public List<String> getOrdersByUsers(String userId) throws IOException {
        return orderDao.getOrdersByUserId(userId);
    }

    public List<Order> getOrdersByOrderNumber(String orderNumber) throws IOException {
        return orderDao.getOrdersByOrderNumber(orderNumber);
    }
}
