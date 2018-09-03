package cn.tedu.springboot.mapper;

import cn.tedu.springboot.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {

    void addOrderIdAndProductId(@Param("orderId") String orderId, @Param("productId") String productId, @Param("buynum") int buynum);

    void addOrderInfo(Order order);

    List<Order> findOrdersByUserId(String userId);

    void deleteOrderByOrderId(String orderId);

    void deleteOrderProductByOrderId(String orderId);
}
