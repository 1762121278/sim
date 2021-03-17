package com.offcn.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.pojo.Role;
import com.offcn.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.rmi.runtime.Log;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Today
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/showRoleInfo")
    public String showRoleInfo(@RequestParam(value = "pageNum",defaultValue = "1" ) int pageNum,
                               @RequestParam(value = "pageSize",defaultValue = "5") int pageSize,
                               HttpSession session){
        PageHelper.startPage(pageNum,pageSize);
        List<Role> roleList= roleService.showRoleInfo();
        PageInfo<Role> pageInfo = new PageInfo<>(roleList);
        System.out.println(pageInfo);
        session.setAttribute("pageInfo",pageInfo);
        return "redirect:/list-role.jsp";
    }

    @RequestMapping("/showRoleInfoList")
    @ResponseBody
    public Role showRoleInfoList(){
        Role role = new Role();
        List<Role> roleList= roleService.showRoleInfo();
        role.setRoleid(1);
        role.setRolename("角色树");
        role.setRoleList(roleList);
        System.out.println(role);
        return role;
    }

    /**
     * @description: 添加角色
     * @Param: [ids, role]
     * @Return: java.lang.String
     */
    @RequestMapping("/addRole")
    public String addRole(int[] ids,Role role){
        roleService.addRole(ids,role);
        System.out.println("完成");
        return "redirect:/role/showRoleInfo";
    }

    @RequestMapping("/deleteRole")
    @ResponseBody
    public boolean deleteRole(@RequestParam("roleid") int roleid){
        System.out.println(roleid);
        Log.getLog("获取到角色roleid为{}","删除角色",roleid);
        return roleService.deleteRole(roleid);
    }

}
