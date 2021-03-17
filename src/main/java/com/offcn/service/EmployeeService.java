package com.offcn.service;

import com.offcn.mapper.*;
import com.offcn.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Today
 */
@Service
public class EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Autowired
    private DeptMapper deptMapper;

    @Autowired
    private EmpRoleMapper empRoleMapper;

    @Autowired
    private SourcesMapper sourcesMapper;

    @Autowired
    private RoleSourcesMapper roleSourcesMapper;

    /**
     * @description: 查询所有员工
     * @Param: []
     * @Return: java.util.List<com.offcn.pojo.Employee>
     */
    public List<Employee> showEmployeeInfo(){
        return employeeMapper.selectAll();
    }

    /**
     * @description: 登录信息，登陆后获取部门信息和员工信息
     * @Param: [username, password]
     * @Return: com.offcn.pojo.Employee
     */
    public Employee getUserInfo(String userName,String passWord){
        Employee userInfo = employeeMapper.getUserInfo(userName,passWord);
        System.out.println(userInfo);
        if(userInfo != null){
            Dept dept = deptMapper.selectByPrimaryKey(userInfo.getDfk());
            userInfo.setDept(dept);
        }
        return userInfo;
    }

    //获取到角色列表
    public List<EmpRole> getEmpRoleByEid(int eid){
        //获取到该用户所有的角色集合
        List<EmpRole> empRoleList= empRoleMapper.getInfoByEid(eid);
        System.out.println(empRoleList);
        return empRoleList;
    }

    /**
     * @description: 根据roleFk查询资源列表
     * @Param: [roleFk]
     * @Return: java.util.List<com.offcn.pojo.EmpRole>
     */
    public List<Sources> getSourcesByRoleId(int roleFk){
        //获取一级菜单
        List<Sources> parent= sourcesMapper.getParentByRoleId(roleFk);
        for (Sources sources : parent) {
            //获取二级菜单
            List<Sources> child = sourcesMapper.getChildByRoleId(sources.getId());
            sources.setChildren(child);
        }
        return parent;
    }

}
