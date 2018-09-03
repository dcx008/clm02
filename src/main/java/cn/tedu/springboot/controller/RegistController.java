package cn.tedu.springboot.controller;

import cn.tedu.springboot.exception.MyException;
import cn.tedu.springboot.pojo.User;
import cn.tedu.springboot.service.UserService;
import cn.tedu.springboot.tool.BootUtils;
import cn.tedu.springboot.tool.MD5Utils;
import cn.tedu.springboot.tool.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;

/**
 * Created by BIG on 2017/10/20.
 */
@Controller
public class RegistController {

    @Autowired
    private UserService userService;

    @RequestMapping("/ToRegist")
    public String addUser(User user, String password2, String valicode, String agree, Model model,HttpSession session){
        try{
            BootUtils.checkUserInfo(user,password2,valicode,agree);
            String realCode= (String) session.getAttribute("verifyCode");
            if(!realCode.equalsIgnoreCase(valicode)){
                throw new MyException("验证码错误");
            }
        }catch (MyException e){
            model.addAttribute("errorMesg",e.getMessage());
            model.addAttribute("user",user);
            model.addAttribute("password2",password2);
            model.addAttribute("agree",agree);
            return "/regist";
        }
        user.setVerifycode(MD5Utils.md5(user.getUserInfo().getEmail()));//以用户的邮箱进行MD5加密后设置到用户的数据库，以便后续邮箱验证用
        userService.addUser(user);
        model.addAttribute("user",user);
        return "forward:/toEmail";
    }

    @RequestMapping("/toEmail")
    public void toMail(User user, HttpServletResponse response) throws IOException, MessagingException {

        String email=user.getUserInfo().getEmail();
        String emailsuffix=email.split("@")[1];

        final String from = "yanglingxiao2009@163.com";//发件人的email
        final String pwd = "13003665386";//发件人密码


        Properties props = new Properties();
        // 发送服务器需要身份验证
        props.setProperty("mail.smtp.auth", "true");
        // 设置邮件服务器主机名
        props.setProperty("mail.host", "smtp.163.com");
        // 发送邮件协议名称
        props.setProperty("mail.transport.protocol", "25");
        //设置端口号
        /*props.put("mail.smtp.port", port);//设置端口*/

        Session session = Session.getInstance(props, new Authenticator() {
            // 在session中设置账户信息，Transport发送邮件时会使用
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pwd);
            }
        });


        ///邮件的内容
        StringBuffer sb=new StringBuffer("点击下面链接激活账号，请尽快激活！</br>");
        sb.append("<a href=\"http://localhost:8090/verifyFromEmail/"+MD5Utils.md5(user.getUserInfo().getEmail())+"/\">click here</a>");


        // 创建邮件对象
        Message msg = new MimeMessage(session);
        // 发件人
        msg.setFrom(new InternetAddress("yanglingxiao2009@163.com"));
        // 多个收件人
        msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
        // 主题
        msg.setSubject("撑了么网站帐号激活");
        // HTML内容
        msg.setContent(sb.toString(), "text/html;charset=utf-8");

        // 连接邮件服务器、发送邮件、关闭连接，全干了
        Transport.send(msg);

        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("<h2 style='color:red;text-align:center'>恭喜您完成注册成功，但需要通过邮箱验证后激活, 3秒之后将会自动跳转到您的邮箱登录主页...</h2>");
        response.setHeader("refresh", "3;url=http://mail."+emailsuffix);
    }

    @RequestMapping("/verifyFromEmail/{verifycode}/")
    public String toVerifyFromEmail(@PathVariable String verifycode,Model model){
        User user=userService.findUserByVerifyCode(verifycode);
        if(user!=null){
            userService.changeState(user.getUserId());
            return "forward:/verifySuccess";
        }else{
            model.addAttribute("errorMesg","邮箱验证码被篡改");
            return "/login";
        }
    }

    @RequestMapping("/verifySuccess")
    public void verifySuccess(HttpServletResponse resposne) throws IOException {
        resposne.setContentType("text/html;charset=utf-8");
        resposne.getWriter().write("<h2 style='color:red;text-align:center'>恭喜您完成邮箱验证, 3秒之后将会自动跳转到您的登录主页...</h2>");
        resposne.setHeader("refresh", "3;url=http://localhost:8090/login");
    }


    @RequestMapping("/checkUsername")
    @ResponseBody
    public String checkUsername(String username){
        boolean flag=userService.checkUsername(username);
        return String.valueOf(flag);
    }

    @RequestMapping("/valicodeImg")
    public void valiCodeImg(HttpServletResponse response, HttpSession session) throws IOException {
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires",0);
        VerifyCode verifyCode=new VerifyCode();
        verifyCode.drawImage(response.getOutputStream());
        session.setAttribute("verifyCode",verifyCode.getCode());
    }
}
