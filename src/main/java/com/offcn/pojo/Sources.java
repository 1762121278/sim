package com.offcn.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * @author Today
 */
public class Sources implements Serializable {
    private Integer id;

    private String name;

    private String url;

    private String remark;

    private Integer pid;

    private String icon;
    private List<Sources> children;

    @Override
    public String toString() {
        return "Sources{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", remark='" + remark + '\'' +
                ", pid=" + pid +
                ", icon='" + icon + '\'' +
                ", children=" + children +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public List<Sources> getChildren() {
        return children;
    }

    public void setChildren(List<Sources> children) {
        this.children = children;
    }
}