package cn.tedu.springboot.mapper;

import cn.tedu.springboot.pojo.User;
import cn.tedu.springboot.pojo.UserInfo;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

/**
 * Created by BIG on 2017/10/20.
 */
public interface UserMapper1 {
    List<User> findAllUser();

    void save(User user);

    void saveUserInfo(UserInfo userInfo);
@Delete(value = "delete from user where user_id=#{userId}")
    void memberDelete(String userId);
@Delete(value = "delete from user_info where user_info_id=#{userId}")
    void memberDeleteUserInfo(String userId);

    void memberDeleteAll(String[] arrays);

    void memberDeleteAllUserInfo(String[] arrays);

    List<User> searchMo(String keyword);

    User memberShow(String idd);


    void memberUpdate(User user);

    void memberUpdateUserInfo(UserInfo userInfo);
}
