package com.offcn.pojo;

public class EmpRole {

    private Role role;

    private Integer erid;

    private Integer roleFk;

    private Integer empFk;

    private String erdis;

    @Override
    public String toString() {
        return "EmpRole{" +
                "role=" + role +
                ", erid=" + erid +
                ", roleFk=" + roleFk +
                ", empFk=" + empFk +
                ", erdis='" + erdis + '\'' +
                '}';
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Integer getErid() {
        return erid;
    }

    public void setErid(Integer erid) {
        this.erid = erid;
    }

    public Integer getRoleFk() {
        return roleFk;
    }

    public void setRoleFk(Integer roleFk) {
        this.roleFk = roleFk;
    }

    public Integer getEmpFk() {
        return empFk;
    }

    public void setEmpFk(Integer empFk) {
        this.empFk = empFk;
    }

    public String getErdis() {
        return erdis;
    }

    public void setErdis(String erdis) {
        this.erdis = erdis;
    }
}