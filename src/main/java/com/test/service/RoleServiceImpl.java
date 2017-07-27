package com.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.entity.Role;
import com.test.entity.RolePermission;
import com.test.mapper.RoleMapper;

@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public Long addRole(Role role, Long... permissionIds) {
		roleMapper.addRole(role);
		if(permissionIds!=null&&permissionIds.length>0){
			for(Long permissionId:permissionIds){
				roleMapper.addRolePermission(new RolePermission(role.getRoleId(),permissionId));
			}
		}
		return role.getRoleId();
	}

	@Override
	public void deleteRole(Long roleId) {
		roleMapper.deleteUserRole(roleId);
		roleMapper.deleteRolePermission(roleId);
		roleMapper.deleteRole(roleId);
	}

	@Override
	public void deleteMoreRoles(Long... roleIds) {
		if(roleIds!=null&&roleIds.length>0){
			for(Long roleId:roleIds){
				deleteRole(roleId);
			}
		}
	}

	@Override
	public Role getRoleById(Long roleId) {
		return roleMapper.findById(roleId);
	}

	@Override
	public List<Role> getRolesByUserName(String userName) {
		return roleMapper.findRolesByUserName(userName);
	}

	@Override
	public List<Role> getAllRoles() {
		return roleMapper.findAllRoles();
	}

	@Override
	public void updateRole(Role role,Long...permIds) {
		roleMapper.updateRole(role);
		roleMapper.deleteRolePermission(role.getRoleId());
		addRolePermissions(role.getRoleId(),permIds);
	}

	@Override
	public void addRolePermissions(Long roleId, Long... permissionIds) {
		if(permissionIds!=null&&permissionIds.length>0){
			for(Long permissionId:permissionIds){
				roleMapper.addRolePermission(new RolePermission(roleId,permissionId));
			}
		}
	}

}
