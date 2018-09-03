package cn.tedu.springboot.service;

import cn.tedu.springboot.mapper.CommentMapper;
import cn.tedu.springboot.pojo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> getAllCommentInOneProduct(String productId) {
        return commentMapper.getAllCommentInOneProduct(productId);
    }

    @Override
    public void addComment(Comment com) {
        commentMapper.addComment(com);
    }

    @Override
    public boolean checkIfPurchased(String userId, String productId) {
        return commentMapper.checkIfPurchased(userId,productId)==null?false:true;
    }
}
