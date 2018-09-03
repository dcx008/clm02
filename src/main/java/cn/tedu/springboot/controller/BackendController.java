package cn.tedu.springboot.controller;


import cn.tedu.springboot.pojo.Order;
import cn.tedu.springboot.pojo.Product;
import cn.tedu.springboot.pojo.User;
import cn.tedu.springboot.service.BackService;
import cn.tedu.springboot.service.UserService1;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.tedu.springboot.tool.TimeTool;

import java.util.List;

/**
 * Created by BIG on 2017/10/20.
 */
@Controller
public class BackendController extends TimeTool{

    @Autowired
    private BackService backService;

    @Autowired
    private UserService1 userService1;

    @RequestMapping("backend")
    public String backend(){
       return "backend/index";
    }

    @RequestMapping("welcome")
    public String welcome(){
        return "backend/welcome";
    }

    /**
     * 产品管理
     * @return
     */
    @RequestMapping("product-list")
    public String productList(Model model){
        Integer count = backService.countProducts();
        model.addAttribute("count",count);
        List<Product> productList = backService.findProductList();
        model.addAttribute("productList",productList);
        return "backend/product-list";
    }

    @RequestMapping("product-add")
    public String productAdd(String productId){

        return "backend/product-add";
    }

    @RequestMapping("toadd")
    public String toAddProduct(Product product){
        backService.addProduct(product);
        return "redirect:product-list";
    }

    @RequestMapping("product-edit")
    public String productEdit(String productId,Model model){
        Product product = backService.findProductById(productId);
        model.addAttribute("product",product);
        return "backend/product-edit";
    }

    @RequestMapping("toupdate")
    public String updateProduct(Product product){
        backService.updateProduct(product);
        return "redirect:product-list";
    }

    @RequestMapping("product-del")
    @ResponseBody
    public String productDel(String productId){
        backService.productDel(productId);
        return "true";
    }

    @RequestMapping("product-dels")
    public String productDels(@RequestParam("productId") String[] productIds){
        backService.productDels(productIds);
        return "redirect:product-list";
    }

    /**
     * 销售榜单
     * @return
     */
    @RequestMapping("sale-list")
    public String saleList(Model model){
        Integer count = backService.countProducts();
        model.addAttribute("count",count);
        List<Product> saleList = backService.findAllSaleList();
        model.addAttribute("saleList",saleList);
        return "backend/sale-list";
    }
    /**
     * 订单列表
     * @return
     */
    @RequestMapping("order-list")
    public  String orderList(Model model){

        List<Order> orderList = backService.findOrderList();

        int num = backService.orderTotal();

        model.addAttribute("num",num);

        model.addAttribute("orderList",orderList);

        return "backend/order-list";
    }

    @RequestMapping("order-paystate")
    public String orderPayList(Integer payState,Model model){

        List<Order> orderList = backService.findOrderPayList(payState);

        int num = backService.orderTotal2(payState);

        model.addAttribute("num",num);

        model.addAttribute("orderList",orderList);
        return "backend/order-list";
     }

    /**
     * 订单删除
     * @param orderIds
     * @return
     */
    @RequestMapping("order-delete")
    @ResponseBody
    public String orderDelete(@RequestParam("orderId")String[] orderIds){
        backService.deleteOrder(orderIds);
        return "true";
    }

    @RequestMapping("orders-delete")
    public String ordersDelete(@RequestParam("orderId")String[] orderIds,Model model){


        backService.deleteOrder(orderIds);
        return "redirect:order-list";
    }


    /**
     * 订单支付状态
     * @param orderIds
     * @return
     */
    @RequestMapping("stop")
    public String toStop(@RequestParam("orderId")String[] orderIds){

        int state = 0;
        backService.updateState(state,orderIds);
        return "redirect:order-list";
    }

    @RequestMapping("start")
    public String toStart(@RequestParam("orderId")String[] orderIds){

        int state = 1;
        backService.updateState(state,orderIds);
        return "redirect:order-list";
    }

    /**
     * 订单详细信息
     * @return
     */
    @RequestMapping("order-show")
    public String orderShow(String orderId,Model model){

        //System.out.println(orderId);

        Order order = backService.findOrderByOrderId(orderId);

        List<Product> products = backService.findOrderProducts(orderId);


        //System.out.println(order.toString());
        model.addAttribute("order",order);
        model.addAttribute("products",products);

        return "backend/order-show";
    }

    /**
     * 用户管理
     * @return
     */
    @RequestMapping("member-list")
    public String memberList(Model model){
        List<User> list = userService1.findAllUser();
        model.addAttribute("userList",list);
        return "backend/member-list";
    }

    @RequestMapping("member-add")
    public String memberAdd(){


        return "backend/member-add";
    }
    @RequestMapping("/member-edit")
    public String memberEdit(Model model,String idd){
        User user = userService1.memberEdit(idd);
        model.addAttribute("user",user);
        return "/backend/member-edit";
    }
    @RequestMapping("/member-update")
    public String memberUpdate(User user){
        userService1.memberUpdate(user);

        return "redirect:/member-list";
    }
    @RequestMapping("/member-delete")
    @ResponseBody
    public String memberDelete(String userId){
        userService1.memberDelete(userId);

        return "true";
    }

    @RequestMapping("/member-show")
    public String memberShow(Model model,String idd){
        User user = userService1.memberShow(idd);
        model.addAttribute("user",user);
        return "backend/member-show";
    }
    @RequestMapping("/searchMoUser")
    public String searchMo(String keyword,Model model){
        List<User> list = userService1.searchMo(keyword);

        model.addAttribute("userList",list);
        return "/backend/member-list";
    }
    @RequestMapping("/member-save")
    public String memberSave(User user){
        userService1.save(user);
        return "redirect:/member-list";

    }
    @RequestMapping("/member-deleteAll")
    @ResponseBody
    public String memberDeleteAll(@RequestParam("array") String[] arrays){
        userService1.memberDeleteAll(arrays);

        return "true";
    }



    /**
     * 数据分析
     * @return
     */
    @RequestMapping("charts-7")
    public String charts7(Model model) throws JsonProcessingException {
        List<Product> orderList = backService.findOrder();

        ObjectMapper objectMapper = new ObjectMapper();
        String mapJSON = objectMapper.writeValueAsString(orderList);


        System.out.println(mapJSON+"999999999");
        model.addAttribute("mapJSON",mapJSON);

        return "backend/charts-7";



    }


}
