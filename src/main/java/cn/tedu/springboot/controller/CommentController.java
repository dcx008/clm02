package cn.tedu.springboot.controller;

import cn.tedu.springboot.pojo.Comment;
import cn.tedu.springboot.pojo.User;
import cn.tedu.springboot.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/addCommentByUser/{productId}")
    public String addCommentByUser(HttpSession session, @PathVariable String productId, String comment,Model model){
        User user= (User) session.getAttribute("userINFO");
        String userId=user.getUserId();

        session.removeAttribute("errorMesg");

        boolean flag=commentService.checkIfPurchased(userId,productId);

        if(!flag){
            session.setAttribute("errorMesg","没买过就别瞎逼逼，滚！！！！");
            return "redirect:/toproductdetail?productId="+productId;
        }

        Comment com=new Comment();
        com.setProductId(productId);
        com.setComment(comment);
        com.setUserId(userId);
        com.setCommentTime(new Date());
        commentService.addComment(com);
        return "redirect:/toproductdetail?productId="+productId;
    }
}
