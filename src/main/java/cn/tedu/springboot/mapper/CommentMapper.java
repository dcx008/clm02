package cn.tedu.springboot.mapper;

import cn.tedu.springboot.pojo.Comment;
import cn.tedu.springboot.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {

    public List<Comment> getAllCommentInOneProduct(String productId);

    void addComment(Comment com);

    Order checkIfPurchased(@Param("userId") String userId,@Param("productId") String productId);
}
