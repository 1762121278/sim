package com.offcn.mapper;

import com.offcn.pojo.Sources;
import com.offcn.pojo.SourcesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @author Today
 */
public interface SourcesMapper {

    /**
     * @description: 查询顶级父菜单
     * @Param:
     * @Return: Souces
     */
    Sources getRootSources();
    /**
     * @description: 查询子菜单
     * @Param:
     * @Return: Sources
     */
    List<Sources> getChildByPid(@Param("pid") int pid);
    /**
     * @description: 插入菜单
     * @Param: [sources]
     * @Return: int
     */
    void addSources(Sources sources);
    /**
     * @description: 查询一级菜单
     * @Param: [roleFk]
     * @Return: java.util.List<com.offcn.pojo.Sources>
     */
    List<Sources> getParentByRoleId(int roleFk);
    /**
     * @description: 查询二级菜单
     * @Param: [list]
     * @Return: java.util.List<com.offcn.pojo.Sources>
     */
    List<Sources> getChildByRoleId(int pid);

    long countByExample(SourcesExample example);

    int deleteByExample(SourcesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Sources record);

    int insertSelective(Sources record);

    List<Sources> selectByExample(SourcesExample example);

    Sources selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Sources record, @Param("example") SourcesExample example);

    int updateByExample(@Param("record") Sources record, @Param("example") SourcesExample example);

    int updateByPrimaryKeySelective(Sources record);

    int updateByPrimaryKey(Sources record);

}