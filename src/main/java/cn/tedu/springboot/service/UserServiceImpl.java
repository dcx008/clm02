package cn.tedu.springboot.service;

import cn.tedu.springboot.mapper.ReceiveInfoMapper;
import cn.tedu.springboot.mapper.UserInfoMapper;
import cn.tedu.springboot.mapper.UserMapper;
import cn.tedu.springboot.pojo.ReceiveInfo;
import cn.tedu.springboot.pojo.User;
import cn.tedu.springboot.pojo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by BIG on 2017/10/20.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    private ReceiveInfoMapper receiveInfoMapper;

    @Override
    @Transactional
    public void addUser(User user) {
        user.setUserId(UUID.randomUUID().toString());
        user.getUserInfo().setUserInfoId(user.getUserId());
        user.setLevel("USER");
        user.setState(0);//刚刚验证的是不能給开启状态的
        userMapper.addUser(user);
        UserInfo userInfo=user.getUserInfo();
        userInfoMapper.addUserInfo(userInfo);
        ReceiveInfo receiveInfo=new ReceiveInfo();
        receiveInfo.setReceiver(userInfo.getName());
        receiveInfo.setUserId(user.getUserId());
        receiveInfo.setReceiveAddress(userInfo.getAddress());
        receiveInfo.setReceiveTelephone(userInfo.getTelephone());
        receiveInfo.setReceiveInfoId(UUID.randomUUID().toString());
        receiveInfoMapper.addReceiveInfo(receiveInfo);
    }

    @Override
    public boolean checkUsername(String username) {
        return userMapper.checkUsername(username)==null?true:false;
    }

    @Override
    public User checkUser(String username, String password) {
        return userMapper.checkUser(username,password);
    }

    @Override
    public User findUserByVerifyCode(String verifycode) {
        return userMapper.findUserByVerifyCode(verifycode);
    }

    @Override
    @Transactional
    public void changeState(String userId) {
        userMapper.changeState(userId);
    }

    @Override
    public List<String> findPrililegeInfoList(String userId) {
        return userMapper.findPrililegeInfoList(userId);
    }

    @Override
    public User getUserByUsername(String username) {
        return userMapper.getUserByUsername(username);
    }
}
