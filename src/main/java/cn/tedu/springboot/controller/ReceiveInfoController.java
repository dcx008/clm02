package cn.tedu.springboot.controller;

import cn.tedu.springboot.pojo.ReceiveInfo;
import cn.tedu.springboot.pojo.User;
import cn.tedu.springboot.service.ReceiveInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.UUID;

/**
 * Created by BIG on 2017/10/22.
 */
@Controller
public class ReceiveInfoController extends BaseController{

    @Autowired
    private ReceiveInfoService receiveInfoService;

    @RequestMapping("/addUserNewReceiveInfo")
    public String addUserNewReceiveInfo(HttpSession session, ReceiveInfo receiveInfo){
        User user= (User) session.getAttribute("userINFO");
        String userId=user.getUserId();
        receiveInfo.setUserId(userId);
        receiveInfo.setReceiveInfoId(UUID.randomUUID().toString());
        receiveInfoService.addUserNewReceiveInfo(receiveInfo);
        return "forward:toCheckoutAllProduct";
    }

    @RequestMapping("updateReceiveInfo")
    public String updateReceiveInfo(String receiveInfoId, Model model){
        ReceiveInfo receiveInfo=receiveInfoService.findAllReceiveInfoByReceiveInfoId(receiveInfoId);
        model.addAttribute("receiveInfo",receiveInfo);
        return "updateUserInfo";
    }

    @RequestMapping("updateUserNewReceiveInfo")
    public String updateUserNewReceiveInfo(ReceiveInfo receiveInfo){
        receiveInfoService.updateUserNewReceiveInfo(receiveInfo);
        return "forward:toCheckoutAllProduct";
    }

    @RequestMapping("deleteReceiveInfo")
    public String deleteReceiveInfo(String receiveInfoId){
        receiveInfoService.deleteReceiveInfo(receiveInfoId);
        return "forward:toCheckoutAllProduct";
    }
}
