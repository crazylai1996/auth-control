package com.test.entity;

import java.io.Serializable;

public class UserRole implements Serializable{
	private Long userId;
	private Long roleId;
	
	public UserRole(Long userId,Long roleId){
		this.userId=userId;
		this.roleId=roleId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
}
