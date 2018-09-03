package cn.tedu.springboot.shiro;

import cn.tedu.springboot.mapper.UserMapper;
import cn.tedu.springboot.pojo.User;
import cn.tedu.springboot.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MyShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        //通过userId查询当前用户的所有模块名称
        List<String> priList = userService.findPrililegeInfoList(user.getUserId());

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //为info对象赋值用户权限列表
        info.addStringPermissions(priList);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        UsernamePasswordToken loginToken = (UsernamePasswordToken) authenticationToken;

        String username=loginToken.getUsername();

        User user=userService.getUserByUsername(username);

        SimpleAuthenticationInfo info=new SimpleAuthenticationInfo(user,user.getPassword(),getName());

        return info;
    }
}
