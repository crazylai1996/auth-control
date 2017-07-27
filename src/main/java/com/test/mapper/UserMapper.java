package com.test.mapper;

import java.util.List;

import com.test.entity.User;
import com.test.entity.UserRole;

public interface UserMapper {
	void addUser(User user);
	void deleteUser(Long userId);
	User findUserByUserName(String userName);
	List<User> findAllUsers();
	
	void deleteUserRole(Long userId);
	void addUserRole(UserRole userRole);
	
	List<String> findRolesByUserName(String userName);
	List<String> findPermissionsByUserName(String userName);
}
