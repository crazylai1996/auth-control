package com.test.service;

import java.util.List;

import com.test.entity.Role;

public interface RoleService {
	Long addRole(Role role,Long...permissionIds);
	void deleteRole(Long roleId);
	void deleteMoreRoles(Long...roleIds);
	Role getRoleById(Long roleId);
	List<Role> getRolesByUserName(String userName);
	List<Role> getAllRoles();
	void updateRole(Role role,Long...permIds);
	
	void addRolePermissions(Long roleId,Long...permissionIds);
}
