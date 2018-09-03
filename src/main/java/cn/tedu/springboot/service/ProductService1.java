package cn.tedu.springboot.service;

import cn.tedu.springboot.pojo.Product;

import java.util.List;

/**
 * Created by BIG on 2017/10/19.
 */
public interface ProductService1 {

    List<Product> findAll();

    Product findOne();

    List<Product> findCategoryAll(String category);

    Product findCategoryOne(String category);

    List<Product> search(Product product, String minprice, String maxprice);

    Product searchOne(Product product, String minprice, String maxprice);

    List<Product> searchMo(String keyword);

    Product searchMoOne(String keyword);

    Product findProductById(String productId);

    void addItemToShoppingCart(String userId, String productId, String buynum);

    List<Product> findAllProductInCartByUserId(String userId);

    void deleteProductInShoopingCartByProductId(String productId,String userId);

    void deleteAllProductInShoppingCartByUserId(String userId);
}
