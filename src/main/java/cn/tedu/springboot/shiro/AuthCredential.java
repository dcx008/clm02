package cn.tedu.springboot.shiro;

import java.util.Arrays;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

public class AuthCredential extends SimpleCredentialsMatcher{
	
	
	//[a, d, m, i, n]
	//String password1 = Arrays.toString(loginToken.getPassword());
	//System.out.println(password1);

	//重新加密处理
	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {

		return super.doCredentialsMatch(token, info);
	}
}
