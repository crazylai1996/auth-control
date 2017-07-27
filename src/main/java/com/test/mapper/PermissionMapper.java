package com.test.mapper;

import java.util.List;

import com.test.entity.Permission;

public interface PermissionMapper {
	void addPermission(Permission permission);
	void deletePermission(Long permissionId);
	Permission findById(Long permId);
	List<Permission> findNavisByRoleId(Long roleId);
	List<Permission> findPermissionsByRoleId(Long roleId);
	List<Permission> findAllPermissions();
	void updatePermission(Permission permission);
	
	void deleteRolePermission(Long permissionId);
}
