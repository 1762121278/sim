package com.offcn.service;

import com.offcn.mapper.EmpRoleMapper;
import com.offcn.mapper.RoleMapper;
import com.offcn.mapper.RoleSourcesMapper;
import com.offcn.mapper.SourcesMapper;
import com.offcn.pojo.*;
import jdk.nashorn.internal.runtime.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

@Service
public class RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RoleSourcesMapper roleSourcesMapper;

    @Autowired
    private EmpRoleMapper empRoleMapper;

    @Autowired
    private SourcesMapper sourcesMapper;

    public List<Role> showRoleInfo(){
        return roleMapper.showRoleInfo();
    }

    @Transactional(rollbackFor = Exception.class)
    public void addRole(int[] ids,Role role){
        int a = roleMapper.insert(role);
        System.out.println(role);
        if(a > 0){
            List<RoleSources> list =new ArrayList<>();
            for(int i=0;i<ids.length;i++){
                RoleSources roleSources = new RoleSources();
                roleSources.setResourcesFk(ids[i]);
                roleSources.setRoleFk(role.getRoleid());
                list.add(roleSources);
            }
            roleSourcesMapper.addRoleSources(list);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Logger
    public boolean deleteRole(int roleid){
        EmpRoleExample example = new EmpRoleExample();
        EmpRoleExample.Criteria criteria = example.createCriteria();
        criteria.andRoleFkEqualTo(roleid);
        List<EmpRole> empRoleList = empRoleMapper.selectByExample(example);
        if(empRoleList.size()>0){
            return false;
        }else {
            roleSourcesMapper.deleteById(roleid);
            roleMapper.deleteByPrimaryKey(roleid);
            return true;
        }
    }

    /**
     * @description: 根据角色ID查询资源树集合
     * @Param: [roleid]
     * @Return: java.util.List<com.offcn.pojo.Sources>
     */
    public List<Sources> selectSourcesByRoleId(int roleid){
        List<Sources> firstDirList = sourcesMapper.selectFirstDir(roleid);
        for (Sources sources : firstDirList) {
            List<Sources> secondDirList = sourcesMapper.selectSecondDir(sources.getId());
            sources.setChildren(secondDirList);
        }
        return firstDirList;
    }
}
