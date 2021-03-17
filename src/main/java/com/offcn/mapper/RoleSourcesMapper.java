package com.offcn.mapper;

import com.offcn.pojo.RoleSources;
import com.offcn.pojo.RoleSourcesExample;

import java.util.List;

import com.offcn.pojo.Sources;
import org.apache.ibatis.annotations.Param;

/**
 * @author Today
 */
public interface RoleSourcesMapper {

    /**
     * @description: 添加角色资源关联关系
     * @Param: [list]
     * @Return: int
     */
    void addRoleSources(List<RoleSources> list);
    /**
     * @description: 删除角色资源关联表
     * @Param: [roleid]
     * @Return: int
     */
    int deleteById(int roleid);

    long countByExample(RoleSourcesExample example);

    int deleteByExample(RoleSourcesExample example);

    int deleteByPrimaryKey(Integer rsid);

    int insert(RoleSources record);

    int insertSelective(RoleSources record);

    List<RoleSources> selectByExample(RoleSourcesExample example);

    RoleSources selectByPrimaryKey(Integer rsid);

    int updateByExampleSelective(@Param("record") RoleSources record, @Param("example") RoleSourcesExample example);

    int updateByExample(@Param("record") RoleSources record, @Param("example") RoleSourcesExample example);

    int updateByPrimaryKeySelective(RoleSources record);

    int updateByPrimaryKey(RoleSources record);
}