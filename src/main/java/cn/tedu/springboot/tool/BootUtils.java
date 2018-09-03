package cn.tedu.springboot.tool;

import cn.tedu.springboot.exception.MyException;
import cn.tedu.springboot.pojo.User;

/**
 * Created by BIG on 2017/10/20.
 */
public class BootUtils {

    public static void checkUserInfo(User user,String password2,String valicode,String agree) throws MyException{
        if(null==user.getUsername()||"".equals(user.getUsername().trim())){
            throw new MyException("用户名不能为空");
        }
        if(null==user.getPassword()||"".equals(user.getPassword().trim())){
            throw new MyException("密码不能为空");
        }
        if(null==password2||"".equals(password2.trim())){
            throw new MyException("确认密码不能为空");
        }
        if(null==valicode||"".equals(valicode.trim())){
            throw new MyException("验证码不能为空");
        }
        if(null==agree||"".equals(agree.trim())){
            throw new MyException("必须遵守我们的协议");
        }
        if(null==user.getUserInfo().getGender()||"".equals(user.getUserInfo().getGender())){
            throw new MyException("性别不能为空");
        }
        if (!user.getPassword().equals(password2)) {
            throw new MyException("两次密码不一致!");
        }
        if (!user.getUserInfo().getEmail().matches("^\\w+@\\w+(\\.\\w+)+$")) {
            throw new MyException("邮箱格式不正确!");
        }
        if(!user.getUserInfo().getTelephone().matches("^1[0-9]{10}$")){
            throw new MyException("手机号码格式不正确!");
        }
        if(!user.getUserInfo().getAge().matches("^\\d+$")){
            throw new MyException("年龄输入格式不正确!");
        }
        if(Integer.parseInt(user.getUserInfo().getAge())<=0||Integer.parseInt(user.getUserInfo().getAge())>200){
            throw new MyException("年龄必须在0-200岁之间!");
        }

    }
}
