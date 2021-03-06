package com.offcn.pojo;

import java.util.List;

/**
 * @author Today
 */
public class Employee {
    public Employee() {
    }

    private Integer eid;

    private String ename;

    private String esex;

    private Integer eage;

    private String telephone;

    private String hiredate;

    private String pnum;

    private String username;

    private String password;

    private String remark;

    private Integer dfk;

    private String pic;

    private Dept dept;

    private List<EmpRole> empRoleList;

    private String roleName;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getEsex() {
        return esex;
    }

    public void setEsex(String esex) {
        this.esex = esex;
    }

    public Integer getEage() {
        return eage;
    }

    public void setEage(Integer eage) {
        this.eage = eage;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getHiredate() {
        return hiredate;
    }

    public void setHiredate(String hiredate) {
        this.hiredate = hiredate;
    }

    public String getPnum() {
        return pnum;
    }

    public void setPnum(String pnum) {
        this.pnum = pnum;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getDfk() {
        return dfk;
    }

    public void setDfk(Integer dfk) {
        this.dfk = dfk;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public List<EmpRole> getEmpRoleList() {
        return empRoleList;
    }

    public void setEmpRoleList(List<EmpRole> empRoleList) {
        this.empRoleList = empRoleList;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "eid=" + eid +
                ", ename='" + ename + '\'' +
                ", esex='" + esex + '\'' +
                ", eage=" + eage +
                ", telephone='" + telephone + '\'' +
                ", hiredate='" + hiredate + '\'' +
                ", pnum='" + pnum + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", remark='" + remark + '\'' +
                ", dfk=" + dfk +
                ", pic='" + pic + '\'' +
                ", dept=" + dept +
                ", empRoleList=" + empRoleList +
                '}';
    }
}