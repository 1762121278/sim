package com.offcn.pojo;

import java.io.Serializable;

/**
 * @author Today
 */
public class Dept implements Serializable {
    private Integer deptno;

    private String dname;

    private String local;

    public Dept() {
    }

    public Dept(Integer deptno, String dname, String local) {
        this.deptno = deptno;
        this.dname = dname;
        this.local = local;
    }

    public Integer getDeptno() {
        return deptno;
    }

    public void setDeptno(Integer deptno) {
        this.deptno = deptno;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    @Override
    public String toString() {
        return "Dept{" +
                "deptno=" + deptno +
                ", dname='" + dname + '\'' +
                ", local='" + local + '\'' +
                '}';
    }
}