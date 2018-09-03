package cn.tedu.springboot.service;

import cn.tedu.springboot.pojo.User;

import java.util.List;

/**
 * Created by BIG on 2017/10/20.
 */
public interface UserService {
    void addUser(User user);
    boolean checkUsername(String username);
    User checkUser(String username,String password);

    User findUserByVerifyCode(String verifycode);

    void changeState(String userId);

    List<String> findPrililegeInfoList(String userId);

    User getUserByUsername(String username);
}
