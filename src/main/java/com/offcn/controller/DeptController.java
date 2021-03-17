package com.offcn.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.pojo.Dept;
import com.offcn.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping("/showDeptInfo")
    public String showDeptInfo(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                               @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                               HttpSession session) {
        PageHelper.startPage(pageNum, pageSize);
        List<Dept> deptList = deptService.showDeptInfo();
        PageInfo<Dept> pageDeptInfo = new PageInfo<>(deptList);
        session.setAttribute("pageDeptInfo", pageDeptInfo);
        return "redirect:/list-dept.jsp";
    }

    @RequestMapping("/addDept")
    public String addDept(Dept dept) {
        boolean flag = deptService.addDept(dept);
        System.out.println("flag:"+flag);
        return "redirect:/dept/showDeptInfo";
    }
}
