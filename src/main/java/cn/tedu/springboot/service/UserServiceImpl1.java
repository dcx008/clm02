package cn.tedu.springboot.service;

import cn.tedu.springboot.mapper.UserMapper1;
import cn.tedu.springboot.pojo.User;
import cn.tedu.springboot.pojo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * Created by BIG on 2017/10/20.
 */
@Service
public class UserServiceImpl1 implements UserService1{
    @Autowired
    UserMapper1 userMapper1;

    @Override
    public List<User> findAllUser() {
        return userMapper1.findAllUser();
    }

    @Override
    public void save(User user) {
        UserInfo userInfo = user.getUserInfo();
        user.setUserId(UUID.randomUUID().toString());
        userInfo.setUserInfoId(user.getUserId());
        userMapper1.saveUserInfo(userInfo);
        userMapper1.save(user);

    }

    @Override
    public void memberDelete(String userId) {
        userMapper1.memberDelete(userId);
        userMapper1.memberDeleteUserInfo(userId);
    }

    @Override
    public void memberDeleteAll(String[] arrays) {
        userMapper1.memberDeleteAll(arrays);
        userMapper1.memberDeleteAllUserInfo(arrays);
    }

    @Override
    public List<User> searchMo(String keyword) {
        return userMapper1.searchMo(keyword);
    }

    @Override
    public User memberShow(String idd) {
        return userMapper1.memberShow(idd);
    }

    @Override
    public User memberEdit(String idd) {
        return userMapper1.memberShow(idd);
    }

    @Override
    public void memberUpdate(User user) {
        UserInfo userInfo = user.getUserInfo();
        userMapper1.memberUpdate(user);
        userMapper1.memberUpdateUserInfo(userInfo);
    }


}
