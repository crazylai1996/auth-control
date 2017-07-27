package com.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.entity.Permission;
import com.test.mapper.PermissionMapper;

@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionMapper permissionMapper;
	
	@Override
	public Long addPermission(Permission permission) {
		permissionMapper.addPermission(permission);
		return permission.getPermissionId();
	}

	@Override
	public void deletePermission(Long permissionId) {
		permissionMapper.deleteRolePermission(permissionId);
		permissionMapper.deletePermission(permissionId);
	}

	@Override
	public void deleteMorePermissions(Long... permIds) {
		if(permIds!=null&&permIds.length>0){
			for(Long permId:permIds){
				deletePermission(permId);
			}
		}
	}

	@Override
	public Permission findById(Long permId) {
		return permissionMapper.findById(permId);
	}

	@Override
	public List<Permission> getPermissionsByRoleId(Long roleId) {
		return permissionMapper.findPermissionsByRoleId(roleId);
	}

	@Override
	public List<Permission> getAllPermissions() {
		return permissionMapper.findAllPermissions();
	}

	@Override
	public void updatePermission(Permission permission) {
		permissionMapper.updatePermission(permission);
	}

}
