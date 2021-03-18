package com.offcn.mapper;

import com.offcn.pojo.Employee;
import com.offcn.pojo.EmployeeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @author Today
 */
public interface EmployeeMapper {
    /**
     * @description: 查询所有员工
     * @Param: [example]
     * @Return: java.util.List<com.offcn.pojo.Employee>
     */
    List<Employee> selectAll();

    /**
     * @description: 根据用户名和密码查询用户有关信息
     * @Param: [example]
     * @Return: long
     */
    Employee getUserInfo(@Param("userName") String userName,@Param("passWord")String passWord);

    /**
     * @description: eid查询员工信息
     * @Param: [example]
     * @Return: long
     */
    Employee selectByPrimaryKey(Integer eid);

    long countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);

    int deleteByPrimaryKey(Integer eid);

    int insert(Employee record);

    int insertSelective(Employee record);

    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}