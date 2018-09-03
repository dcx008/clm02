package cn.tedu.springboot.service;

import cn.tedu.springboot.mapper.OrderMapper;
import cn.tedu.springboot.mapper.ProductMapper1;
import cn.tedu.springboot.mapper.ReceiveInfoMapper;
import cn.tedu.springboot.mapper.UserMapper;
import cn.tedu.springboot.pojo.Order;
import cn.tedu.springboot.pojo.Product;
import cn.tedu.springboot.pojo.ReceiveInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private ProductMapper1 productMapper1;

    @Autowired
    private ReceiveInfoMapper receiveInfoMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Override
    @Transactional
    public Map<Order, List<Product>> generateOrder(String receiveInfoId,String userId) {
        List<Product> productList = productMapper1.findAllProductInCartByUserId(userId);
        productMapper1.deleteAllProductInShoppingCartByUserId(userId);


        Order order=new Order();
        order.setOrderId(UUID.randomUUID().toString());
        int sum=0;
        for(Product product:productList){
            sum+=product.getProductPrice()*product.getBuynum();
        }
        order.setMoney(sum);
        order.setOrderTime(new Date());
        order.setPaystate(0);
        ReceiveInfo receiveInfo=receiveInfoMapper.findAllReceiveInfoByReceiveInfoId(receiveInfoId);
        order.setReceiveInfo(receiveInfo);
        order.setUserId(userId);


        for (Product product:productList) {
            int buynum=product.getBuynum();
            String productId=product.getProductId();
            String orderId=order.getOrderId();
            orderMapper.addOrderIdAndProductId(orderId,productId,buynum);
        }

        orderMapper.addOrderInfo(order);

        Map<Order, List<Product>> orderMap=new HashMap<>();

        List<Order> orderList=orderMapper.findOrdersByUserId(userId);

        for (Order o:orderList) {
            String orderId=o.getOrderId();
            List<Product> pList = productMapper1.findAllProductsByOrderId(orderId);
            orderMap.put(o,pList);
        }

        return orderMap;
    }

    @Override
    public Map<Order, List<Product>> lookingForOrder(String userId) {
        Map<Order, List<Product>> orderMap=new HashMap<>();

        List<Order> orderList=orderMapper.findOrdersByUserId(userId);

        for (Order o:orderList) {
            String orderId=o.getOrderId();
            List<Product> pList = productMapper1.findAllProductsByOrderId(orderId);
            orderMap.put(o,pList);
        }

        return orderMap;
    }

    @Override
    @Transactional
    public void deleteOrderByOrderId(String orderId) {
        orderMapper.deleteOrderByOrderId(orderId);
        orderMapper.deleteOrderProductByOrderId(orderId);
    }

}
