package com.offcn.service;

import com.offcn.mapper.DeptMapper;
import com.offcn.pojo.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptService {

    @Autowired
    private DeptMapper deptMapper;

    /**
     * @description: 查询所有部门
     * @Param: []
     * @Return: java.util.List<com.offcn.pojo.Dept>
     */
    public List<Dept> showDeptInfo() {
        return deptMapper.selectByExample(null);
    }

    /**
     * @description: 新增部门
     * @Param: [dept]
     * @Return: boolean
     */
    public boolean addDept(Dept dept) {
        return deptMapper.insert(dept) > 0;
    }

}
