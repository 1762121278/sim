package com.offcn.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.pojo.Dept;
import com.offcn.pojo.EmpRole;
import com.offcn.pojo.Employee;
import com.offcn.pojo.Sources;
import com.offcn.service.EmployeeService;
import com.offcn.utils.ExportExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private ExportExcelUtil exportExcelUtil;

    @RequestMapping("/showEmployeeInfo")
    public String showEmployeeInfo(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                   @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                   HttpSession session){
        PageHelper.startPage(pageNum,pageSize);
        List<Employee> employeeList = employeeService.showEmployeeInfo();
        PageInfo<Employee> employeePageInfo = new PageInfo<>(employeeList);
        session.setAttribute("employeePageInfo",employeePageInfo);
        return "redirect:/list-employee.jsp";

    }

    @RequestMapping("/exportExcelUtil")
    @ResponseBody
    public void showEmployeeInfo(HttpServletResponse response) throws Exception {
        List<Employee> employeeList = employeeService.showEmployeeInfo();
        exportExcelUtil.exportExcel(response,employeeList);
    }

    @RequestMapping("/login")
    public String login( String userName,String passWord,HttpSession session)  {

        Employee userInfo = employeeService.getUserInfo(userName,passWord);
        if(userInfo != null){
            session.setAttribute("activeUser",userInfo);
            List<EmpRole> empRoleList = employeeService.getEmpRoleByEid(userInfo.getEid());
            List<Sources> sourcesList = employeeService.getSourcesByRoleId(empRoleList.get(0).getRoleFk());
            session.setAttribute("sources",sourcesList);
            return "redirect:/index.jsp";
        }else {
            return "redirect:/login.jsp";
        }
    }

    @RequestMapping("/selectByEid")
    public String selectByEid(Integer eid,String dname,String rolename,HttpSession session)  {
        System.out.println("1"+eid+dname+rolename);
        Employee employee = employeeService.selectByPrimaryKey(eid);
        Dept dept = new Dept(); dept.setDname(dname);
        employee.setDept(dept);
        employee.setRoleName(rolename);
        session.setAttribute("employee",employee);
        return "redirect:/show-employee.jsp";
    }

}
