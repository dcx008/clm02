package cn.tedu.springboot.mapper;

import cn.tedu.springboot.pojo.Order;
import cn.tedu.springboot.pojo.Product;
import cn.tedu.springboot.pojo.ReceiveInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by BIG on 2017/10/20.
 */
public interface BackMapper {


    public List<Product> findAllProducts();

    public void savaProduct(Product product);

    public void productDel(String productId);

    public void updateProduct(Product product);

    Product findProductById(String productId);

    public void addProduct(Product product);

    public void productDels(String[] productIds);

    public Integer countProducts();

    public List<Product> findAllSaleList();

    /**
     * 查询所有的订单信息
     * @return
     */
    public List<Order> findOrderList() ;

    /**
     * 删除订单
     * @param orderIds
     */
    public void deleteOrder(String[] orderIds);

    /**
     * 关联删除订单商品表
     * @param orderIds
     */
    public void deleteOrderProduct(String[] orderIds);

    /**
     * 更改支付状态
     * @param state
     * @param orderIds
     */
    public void updateState(@Param("state") int state, @Param("orderIds") String[] orderIds);

    /**
     * 订单数
     * @return
     */
    public int orderTotal();

    /**
     *
     * @param payState
     * @return
     */
    public List<Order> findOrderPayList(int payState);


    public int orderTotal2(Integer payState);

    public Order findOrderByOrderId(String orderId);

    public List<Product> findOrderProducts(String orderId);

    public  List<Product> findOrder();
}
