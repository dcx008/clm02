package cn.tedu.springboot.service;

import cn.tedu.springboot.pojo.Comment;

import java.util.List;

public interface CommentService {

    List<Comment> getAllCommentInOneProduct(String productId);

    void addComment(Comment com);

    boolean checkIfPurchased(String userId, String productId);
}
