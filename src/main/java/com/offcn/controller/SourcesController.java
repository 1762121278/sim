package com.offcn.controller;

import com.offcn.pojo.Sources;
import com.offcn.service.SourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Today
 */
@Controller
@RequestMapping("/sources")
public class SourcesController {

    @Autowired
    private SourcesService sourcesService;

    @RequestMapping("/showSources")
    @ResponseBody
    public Sources showSources(){
        Sources sources = sourcesService.getRootSources();
        Sources sources1 = getChilds(sources);
        System.out.println(sources1);
        return sources1;
    }

    public Sources getChilds(Sources sources){
        List<Sources> child = sourcesService.getChildByPid(sources.getId());
        if(child.size()>0){
            sources.setChildren(child);
            for (Sources source : child) {
                getChilds(source);
            }
        }
        return sources;
    }

    @RequestMapping("/addSources")
    public String addSources(Sources sources){
        sourcesService.addSources(sources);
       return "redirect:/list-resources.jsp";
    }
}
