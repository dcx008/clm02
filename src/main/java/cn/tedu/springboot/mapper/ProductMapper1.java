package cn.tedu.springboot.mapper;

import cn.tedu.springboot.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by BIG on 2017/10/19.
 */
public interface ProductMapper1 {


    List<Product> findAll();

    Product findOne();

    List<Product> findCategoryAll(String category);

    Product findCategoryOne(String category);

    List<Product> search(@Param("category") String category, @Param("productName") String productName, @Param("minprice") String minprice, @Param("maxprice") String maxprice);

    Product searchOne(@Param("category") String category, @Param("productName") String productName, @Param("minprice") String minprice, @Param("maxprice") String maxprice);

    List<Product> searchMo(String keyword);

    Product searchMoOne(String keyword);

    Product findProductById(String productId);

    void addItemToShoppingCart(@Param("userId") String userId, @Param("productId") String productId, @Param("buynum") String buynum);

    List<Product> findAllProductInCartByUserId(String userId);

    void deleteProductInShoopingCartByProductId(@Param("productId") String productId,@Param("userId") String userId);

    void deleteAllProductInShoppingCartByUserId(String userId);

    List<Product> findAllProductsByOrderId(String orderId);
}
