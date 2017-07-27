package com.test.service;

import java.util.List;
import java.util.Set;

import com.test.entity.Navigation;
import com.test.entity.User;

public interface UserService {
	void addUser(User user,Long...roleIds);//添加用户
	void deleteUser(Long userId);//删除用户
	void deleteMoreUsers(Long...userIds);//批量删除用户
	User getUserByUserName(String userName);//根据用户名获取用户
	List<User> getAllUsers();//获取所有用户
	
	void updateUserRoles(Long userId,Long...roleIds);//添加用户角色关联
	
	Set<String> findRolesByUserName(String userName);//根据用户名获取用户所有角色
	Set<String> findPermissionsByUserName(String userName);//根据用户名获取用户所有权限
	
	List<Navigation> getNavigationBar(String userName);//获取导航栏内容
}
