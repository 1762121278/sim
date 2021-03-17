package com.offcn;

import com.offcn.mapper.EmployeeMapper;
import com.offcn.pojo.Employee;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml"})
public class Test {

    @Autowired
    private EmployeeMapper employeeMapper;

    @org.junit.Test
    public void test1(){
        Employee employee = employeeMapper.getUserInfo("123","123");
        System.out.println(employee);
    }
}
