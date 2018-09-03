package cn.tedu.springboot.controller;

import cn.tedu.springboot.pojo.*;
import cn.tedu.springboot.service.CommentService;
import cn.tedu.springboot.service.OrderService;
import cn.tedu.springboot.service.ProductService1;
import cn.tedu.springboot.service.ReceiveInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by BIG on 2017/10/19.
 */
@Controller
public class ProductController1 {
    @Autowired
    private ProductService1 productService1;

    @Autowired
    private ReceiveInfoService receiveInfoService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CommentService commentService;

    @RequestMapping("/productss")
    public String proList(Model model){

        Product product = productService1.findOne();
        List<Product> list = productService1.findAll();
        model.addAttribute("title","缤纷菜肴");
        model.addAttribute("pro",product);
        model.addAttribute("productList",list);
        return "/products";
    }
    @RequestMapping("/category")
    public String proCategory(Model model,String category){

        List<Product> list = productService1.findCategoryAll(category);
        Product product = productService1.findCategoryOne(category);
        model.addAttribute("pro",product);
        model.addAttribute("productList",list);

        return "/products";
    }
    @RequestMapping("/search")
    public String search(Product product,String minprice, String maxprice,Model model){
            String min=minprice;
            String max=maxprice;
            if(!minprice.matches("\\d+")||minprice==null){minprice="0";}
            if(!maxprice.matches("\\d+")||maxprice==null){maxprice=String.valueOf(Integer.MAX_VALUE);}
            int minP=Integer.parseInt(minprice);
            int maxP=Integer.parseInt(maxprice);
            if(minP<=0){minP=0;}
            if(maxP<=minP){maxP=minP;}
            minprice=String.valueOf(minP);
            maxprice=String.valueOf(maxP);

        List<Product> list = productService1.search(product,minprice,maxprice);
        Product pro =  productService1.findOne();
        model.addAttribute("title","缤纷菜肴");
        model.addAttribute("productName",product.getProductName());
        model.addAttribute("category",product.getCategory());
        model.addAttribute("maxprice",max);
        model.addAttribute("minprice",min);
        model.addAttribute("pro",pro);
        model.addAttribute("productList",list);
        return "/products";
    }
    @RequestMapping("/searchMo")
    public String searchMo(Model model,String keyword){
        List<Product> list = productService1.searchMo(keyword);
        Product pro = productService1.searchMoOne(keyword);

        model.addAttribute("title","缤纷菜肴");
        model.addAttribute("pro",pro);
        model.addAttribute("productList",list);
        return "/products";
    }

    @RequestMapping("/toproductdetail")
    public String productDetail(String productId,Model model){
        Product pro=productService1.findOne();
        Product product=productService1.findProductById(productId);
        model.addAttribute("product",product);
        model.addAttribute("pro",pro);
        List<Comment> commentList = commentService.getAllCommentInOneProduct(productId);
        model.addAttribute("commentList",commentList);
        return "/productdetail";
    }



    @RequestMapping("/toShoppingCart")
    public String toShopingCart(String productId, String buynum, HttpSession session,Model model){
        User user= (User) session.getAttribute("userINFO");
        String userId=user.getUserId();
        if(buynum!=null||productId!=null){
            productService1.addItemToShoppingCart(userId,productId,buynum);
        }
        List<Product> productList=productService1.findAllProductInCartByUserId(userId);
        model.addAttribute("productList",productList);
        return "/shoppingcart";
    }

    @RequestMapping("/deleteProductInShoopingCart")
    @ResponseBody
    public String deleteProductInShoopingCart(String productId,HttpSession session){
        User user= (User) session.getAttribute("userINFO");
        String userId=user.getUserId();
        productService1.deleteProductInShoopingCartByProductId(productId,userId);
        return "true";
    }

    /**
     * 提交订单
     */
    @RequestMapping("/toCheckoutAllProduct")
    public String toCheckoutAllProduct(HttpSession session,Model model){
        User user= (User) session.getAttribute("userINFO");
        String userId=user.getUserId();
        List<ReceiveInfo> receiveInfoList = receiveInfoService.findAllReceiveInfoByUserId(userId);
        model.addAttribute("receiveInfoList",receiveInfoList);
        return "checkout";
    }

    /**
     * 生成订单
     */
    @RequestMapping("/generateOrder")
    public String generateOrder(String receiveInfoId,HttpSession session,Model model){
        User user= (User) session.getAttribute("userINFO");
        String userId=user.getUserId();
        Map<Order,List<Product>> orderMap=orderService.generateOrder(receiveInfoId,userId);
        model.addAttribute("orderMap",orderMap);
        return "orderInfo";
    }

    /**
     * 查看订单
     */
    @RequestMapping("/checkoutOrder")
    public String checkoutOrder(HttpSession session,Model model){
        User user= (User) session.getAttribute("userINFO");
        String userId=user.getUserId();
        Map<Order,List<Product>> orderMap=orderService.lookingForOrder(userId);
        model.addAttribute("orderMap",orderMap);
        return "orderInfo";
    }

    /**
     * 删除订单操作
     */
    @RequestMapping("deleteOrderByOrderId")
    @ResponseBody
    public String deleteOrderByOrderId(String orderId){
        orderService.deleteOrderByOrderId(orderId);
        return "true";
    }

}
