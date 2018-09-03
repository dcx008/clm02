package cn.tedu.springboot.service;

import cn.tedu.springboot.mapper.ProductMapper1;
import cn.tedu.springboot.pojo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by BIG on 2017/10/19.
 */
@Service
public class ProductServiceImpl1 implements ProductService1{
@Autowired
ProductMapper1 productMapper1;
    @Override
    public List<Product> findAll() {
        return productMapper1.findAll();
    }

    @Override
    public Product findOne() {
        return productMapper1.findOne();
    }

    @Override
    public List<Product> findCategoryAll(String category) {
        return productMapper1.findCategoryAll(category);
    }

    @Override
    public Product findCategoryOne(String category) {
        return productMapper1.findCategoryOne(category);
    }

    @Override
    public List<Product> search(Product product, String minprice, String maxprice) {
        String category = product.getCategory();
        String productName = product.getProductName();
        return productMapper1.search(category,productName,minprice,maxprice);
    }

    @Override
    public Product searchOne(Product product, String minprice, String maxprice) {
        String category = product.getCategory();
        String productName = product.getProductName();
        return productMapper1.searchOne(category,productName,minprice,maxprice);

    }

    @Override
    public List<Product> searchMo(String keyword) {
        return productMapper1.searchMo(keyword);
    }

    @Override
    public Product searchMoOne(String keyword) {
        return productMapper1.searchMoOne(keyword);
    }

    @Override
    public Product findProductById(String productId) {
        return productMapper1.findProductById(productId);
    }

    @Override
    @Transactional
    public void addItemToShoppingCart(String userId, String productId, String buynum) {
        productMapper1.addItemToShoppingCart(userId,productId,buynum);
    }

    @Override
    public List<Product> findAllProductInCartByUserId(String userId) {
        return productMapper1.findAllProductInCartByUserId(userId);
    }

    @Override
    @Transactional
    public void deleteProductInShoopingCartByProductId(String productId,String userId) {
        productMapper1.deleteProductInShoopingCartByProductId(productId,userId);
    }

    @Override
    @Transactional
    public void deleteAllProductInShoppingCartByUserId(String userId) {
        productMapper1.deleteAllProductInShoppingCartByUserId(userId);
    }
}
