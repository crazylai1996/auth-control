package com.test.entity;

import java.io.Serializable;

public class Permission implements Serializable{
	private Long permissionId;
	private String permissionDesc;
	private String url;
	private int isNavi;
	private String permissionCode;
	
	public Long getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(Long permissionId) {
		this.permissionId = permissionId;
	}
	public String getPermissionDesc() {
		return permissionDesc;
	}
	public void setPermissionDesc(String permissionDesc) {
		this.permissionDesc = permissionDesc;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getIsNavi() {
		return isNavi;
	}
	public void setIsNavi(int isNavi) {
		this.isNavi = isNavi;
	}
	public String getPermissionCode() {
		return permissionCode;
	}
	public void setPermissionCode(String permissionCode) {
		this.permissionCode = permissionCode;
	}
}
