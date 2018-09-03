package cn.tedu.springboot.service;

import cn.tedu.springboot.pojo.Order;
import cn.tedu.springboot.pojo.Product;

import java.util.List;
import java.util.Map;

public interface OrderService {

    Map<Order,List<Product>> generateOrder(String receiveInfoId,String userId);

    Map<Order,List<Product>> lookingForOrder(String userId);

    void deleteOrderByOrderId(String orderId);
}
