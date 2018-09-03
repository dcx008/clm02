package cn.tedu.springboot.mapper;

import cn.tedu.springboot.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by BIG on 2017/10/19.
 */
public interface UserMapper {

    void addUser(User user);

    User checkUsername(String username);

    User checkUser(@Param("username") String username, @Param("password") String password);

    User findUserByVerifyCode(String verifycode);

    void changeState(String userId);

    List<String> findPrililegeInfoList(String userId);

    User getUserByUsername(String username);
}
