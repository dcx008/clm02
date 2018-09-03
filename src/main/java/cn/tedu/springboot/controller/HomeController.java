package cn.tedu.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by BIG on 2017/10/19.
 */
@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(){
        return "index";
    }

    @RequestMapping("login")
    public String login(){
        return "login";
    }

    @RequestMapping("regist")
    public String regist(){
        return "regist";
    }

    @RequestMapping("/shoppingcart")
    public String shoppingcart(){
        return "shoppingcart";
    }

    @RequestMapping("/orderInfo")
    public String orderInfo(){
        return "orderInfo";
    }

    @RequestMapping("/productdetail")
    public String productdetail(){
        return "productdetail";
    }

    @RequestMapping("/checkout")
    public String checkout(){
        return "checkout";
    }

    @RequestMapping("/addInfo")
    public String addInfo(){
        return "addInfo";
    }


    @RequestMapping("/products")
    public String products(){
        return "redirect:/productss";
    }
}
