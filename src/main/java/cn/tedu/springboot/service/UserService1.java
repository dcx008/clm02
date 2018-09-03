package cn.tedu.springboot.service;

import cn.tedu.springboot.pojo.User;

import java.util.List;

/**
 * Created by BIG on 2017/10/20.
 */
public interface UserService1 {
    List<User> findAllUser();

    void save(User user);


    void memberDelete(String userId);

    void memberDeleteAll(String[] arrays);

    List<User> searchMo(String keyword);

    User memberShow(String idd);

    User memberEdit(String idd);

    void memberUpdate(User user);
}
