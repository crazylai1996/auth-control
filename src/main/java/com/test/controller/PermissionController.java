package com.test.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.entity.Permission;
import com.test.service.PermissionService;

@Controller
@RequestMapping("/perm")
public class PermissionController {
	@Autowired
	private PermissionService permissionService;
	
	@RequiresPermissions("perm:list")
	@RequestMapping("/list")
	public ModelAndView showRoleList(){
		List<Permission> list=permissionService.getAllPermissions();
		
		ModelAndView mav=new ModelAndView("permission-list");
		mav.addObject("perms", list);
		
		return mav;
	}
	
	@RequiresPermissions("perm:add")
	@RequestMapping("/add")
	@ResponseBody
	public Permission addPermission(Permission permission){
		permissionService.addPermission(permission);
		return permission;
	}
	
	@RequiresPermissions("perm:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public void deletePermission(Long permId){
		permissionService.deletePermission(permId);
	}
	
	@RequiresPermissions("perm:delete")
	@RequestMapping("/deletemore")
	@ResponseBody
	public void deleteMorePerms(Long...permIds){
		permissionService.deleteMorePermissions(permIds);
	}
	
	@RequiresPermissions("perm:update")
	@RequestMapping("/getperm")
	@ResponseBody
	public Permission getPermById(Long permId){
		return permissionService.findById(permId);
	}
	
	@RequiresPermissions("perm:update")
	@RequestMapping("/update")
	@ResponseBody
	public void updatePermission(Permission permission){
		permissionService.updatePermission(permission);
	}
}
