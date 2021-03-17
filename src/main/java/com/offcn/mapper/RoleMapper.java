package com.offcn.mapper;

import com.offcn.pojo.Role;
import com.offcn.pojo.RoleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @author shu
 */
public interface RoleMapper {

    /**
     * @description: 查询所有角色
     * @Param: []
     * @Return: java.util.List<com.offcn.pojo.Role>
     */
    List<Role> showRoleInfo();
    /**
     * @description: 插入角色
     * @Param: [record]
     * @Return: int
     */
    int insert(Role record);
    /**
     * @description: 删除角色
     * @Param: [roleid]
     * @Return: int
     */
    int deleteByPrimaryKey(Integer roleid);

    Role getRoleByPK(@Param("rolefk") int roleid);

    long countByExample(RoleExample example);

    int deleteByExample(RoleExample example);

    int insertSelective(Role record);

    List<Role> selectByExample(RoleExample example);

    Role selectByPrimaryKey(Integer roleid);

    int updateByExampleSelective(@Param("record") Role record, @Param("example") RoleExample example);

    int updateByExample(@Param("record") Role record, @Param("example") RoleExample example);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}