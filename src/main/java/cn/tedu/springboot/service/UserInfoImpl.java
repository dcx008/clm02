package cn.tedu.springboot.service;

import cn.tedu.springboot.mapper.UserInfoMapper;
import cn.tedu.springboot.pojo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by BIG on 2017/10/20.
 */
@Service
public class UserInfoImpl implements UserInfoService {

    @Autowired
    private UserInfoMapper userInfoMapper;


    @Override
    @Transactional
    public void addUserInfo(UserInfo userInfo) {userInfoMapper.addUserInfo(userInfo);
    }
}
