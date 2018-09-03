package cn.tedu.springboot.controller;

import cn.tedu.springboot.pojo.Product;
import cn.tedu.springboot.pojo.User;
import cn.tedu.springboot.service.ProductService1;
import cn.tedu.springboot.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;

/**
 * Created by BIG on 2017/10/20.
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService1 productService1;

    @RequestMapping("/toLogin")
    public String login(Model model, String username, String password, HttpSession session) {

        UsernamePasswordToken token = new UsernamePasswordToken();
        token.setUsername(username);
        token.setPassword(password.toCharArray());
        Subject subject = SecurityUtils.getSubject();

        try {
            subject.login(token);
            User user = (User) subject.getPrincipal();
            if (user.getState() == 0) {
                model.addAttribute("errorMesg", "您的账号还未被激活");
                return "login";
            }
            User u=userService.checkUser(username,password);
            session.setAttribute("userINFO", u);
            Product pro = productService1.findOne();
            session.setAttribute("pro", pro);

            return "redirect:/";
        } catch (AuthenticationException e) {
                model.addAttribute("errorMesg", "用户名或密码错误");
                return "login";
        }

    }
}
