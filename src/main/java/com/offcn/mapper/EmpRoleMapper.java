package com.offcn.mapper;

import com.offcn.pojo.EmpRole;
import com.offcn.pojo.EmpRoleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @author Today
 */
public interface EmpRoleMapper {

    /**
     * @description: 查询是否存在关联关系
     * @Param: [example]
     * @Return: java.util.List<com.offcn.pojo.EmpRole>
     */
    List<EmpRole> selectByExample(EmpRoleExample example);
    /**
     * @description: 根据员工id获取角色e
     * @Param: [eid]
     * @Return: java.util.List<com.offcn.pojo.EmpRole>
     */
    List<EmpRole> getInfoByEid(@Param("eid") Integer eid);

    long countByExample(EmpRoleExample example);

    int deleteByExample(EmpRoleExample example);

    int deleteByPrimaryKey(Integer erid);

    int insert(EmpRole record);

    int insertSelective(EmpRole record);

    EmpRole selectByPrimaryKey(Integer erid);

    int updateByExampleSelective(@Param("record") EmpRole record, @Param("example") EmpRoleExample example);

    int updateByExample(@Param("record") EmpRole record, @Param("example") EmpRoleExample example);

    int updateByPrimaryKeySelective(EmpRole record);

    int updateByPrimaryKey(EmpRole record);
}