package cn.tedu.springboot.service;

import cn.tedu.springboot.pojo.Order;
import cn.tedu.springboot.pojo.Product;
import cn.tedu.springboot.pojo.ReceiveInfo;

import java.util.List;

/**
 * Created by BIG on 2017/10/20.
 */
public interface BackService {

    public List<Product> findProductList();

    public void savaProduct(Product product);

    public void productDel(String productId);

    public void updateProduct(Product product);

    public Product findProductById(String productId);

    public void addProduct(Product product);

    public void productDels(String[] productIds);

    public Integer countProducts();

    public List<Product> findAllSaleList();


    /**
     * 查询所有的订单信息
     * @return
     */
    List<Order> findOrderList();

    /**
     * 删除订单
     * @param orderIds
     */
    public void deleteOrder(String[] orderIds);

    /**
     * 更改支付状态
     * @param state
     * @param orderIds
     */
    public void updateState(int state, String[] orderIds);

    /**
     * 订单总数
     * @return
     */
    public int orderTotal();

    /**
     *
     * @param payState
     * @return
     */
    public List<Order> findOrderPayList(int payState);


    /**
     *
     * @param payState
     * @return
     */
    public int orderTotal2(Integer payState);

    public Order findOrderByOrderId(String orderId);

    public List<Product> findOrderProducts(String orderId);

    /**
     *查询各个商品种类购买的数量
     */
    public  List<Product> findOrder();
}
