package cn.tedu.springboot.service;

import cn.tedu.springboot.mapper.BackMapper;
import cn.tedu.springboot.pojo.Order;
import cn.tedu.springboot.pojo.Product;
import cn.tedu.springboot.pojo.ReceiveInfo;
import cn.tedu.springboot.service.BackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by BIG on 2017/10/20.
 */
@Service
public class BackServiceImpl implements BackService{

    @Autowired
    private BackMapper backMapper;


    @Override
    public List<Product> findProductList() {
        return backMapper.findAllProducts();
    }

    @Override
    public void savaProduct(Product product) {
        backMapper.savaProduct(product);
    }

    @Override
    public void productDel(String productId) {
        backMapper.productDel(productId);
    }

    @Override
    public void updateProduct(Product product) {

        product.setImgurl("images/tu/"+product.getImgurl());


        backMapper.updateProduct(product);
    }

    @Override
    public Product findProductById(String productId) {
        return backMapper.findProductById(productId);
    }

    @Override
    public void addProduct(Product product) {
        backMapper.addProduct(product);
    }

    @Override
    public void productDels(String[] productIds) {
        backMapper.productDels(productIds);
    }

    @Override
    public Integer countProducts() {
        return backMapper.countProducts();
    }

    @Override
    public List<Product> findAllSaleList() {
        return backMapper.findAllSaleList();
    }


    @Override
    public List<Order> findOrderList() {
        return backMapper.findOrderList();
    }

    @Override
    public void deleteOrder(String[] orderIds) {
        backMapper.deleteOrderProduct(orderIds);
        backMapper.deleteOrder(orderIds);
    }

    @Override
    public void updateState(int state, String[] orderIds) {
        backMapper.updateState(state,orderIds);
    }

    @Override
    public int orderTotal() {
        return backMapper.orderTotal();
    }

    @Override
    public List<Order> findOrderPayList(int payState) {
        return backMapper.findOrderPayList(payState);
    }

    @Override
    public int orderTotal2(Integer payState) {
        return backMapper.orderTotal2(payState);
    }

    @Override
    public Order findOrderByOrderId(String orderId) {
        return backMapper.findOrderByOrderId(orderId);
    }

    @Override
    public List<Product> findOrderProducts(String orderId) {
        return backMapper.findOrderProducts(orderId);
    }

    @Override
    public  List<Product> findOrder() { return backMapper.findOrder(); }
}
