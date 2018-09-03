package cn.tedu.springboot.controller;

import cn.tedu.springboot.pojo.ReceiveInfo;
import cn.tedu.springboot.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by BIG on 2017/10/22.
 */
@Controller
public class UserContactController {

    @RequestMapping("/addNewReceiveInfo")
    public String addNewReceiveInfo(){
        return "addInfo";
    }
}
