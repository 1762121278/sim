package com.offcn.service;

import com.offcn.mapper.SourcesMapper;
import com.offcn.pojo.Sources;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SourcesService {

    @Autowired
    private SourcesMapper sourcesMapper;

    public Sources getRootSources(){
       return sourcesMapper.getRootSources();
    }

    public List<Sources> getChildByPid(int pid){
        return sourcesMapper.getChildByPid(pid);
    }

    public void addSources(Sources sources){
        sourcesMapper.addSources(sources);
    }
}
