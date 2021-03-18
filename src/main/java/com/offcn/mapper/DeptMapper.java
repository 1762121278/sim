package com.offcn.mapper;

import com.offcn.pojo.Dept;
import com.offcn.pojo.DeptExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeptMapper {

    /**
     * @description: 查询所有部门
     * @Param: [example]
     * @Return: java.util.List<com.offcn.pojo.Dept>
     */
    List<Dept> selectByExample(DeptExample example);
    /**
     * @description: 添加部门
     * @Param: [record]
     * @Return: int
     */
    int insert(Dept record);
    /**
     * @description: 修改
     * @Param: [record]
     * @Return: int
     */
    int updateByPrimaryKey(Dept dept);

    /**
     * @description: 删除部门
     * @Param: [deptno]
     * @Return: int
     */
    int deleteByPrimaryKey(Integer deptno);

    long countByExample(DeptExample example);

    int deleteByExample(DeptExample example);

    int insertSelective(Dept record);

    Dept selectByPrimaryKey(Integer deptno);

    int updateByExampleSelective(@Param("record") Dept record, @Param("example") DeptExample example);

    int updateByExample(@Param("record") Dept record, @Param("example") DeptExample example);

    int updateByPrimaryKeySelective(Dept record);

}