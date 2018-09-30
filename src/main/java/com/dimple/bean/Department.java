package com.dimple.bean;

public class Department {
    private Integer deptId;

    private String deptName;

    private Double deptSalary;

    private String deptNote;

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public Double getDeptSalary() {
        return deptSalary;
    }

    public void setDeptSalary(Double deptSalary) {
        this.deptSalary = deptSalary;
    }

    public String getDeptNote() {
        return deptNote;
    }

    public void setDeptNote(String deptNote) {
        this.deptNote = deptNote == null ? null : deptNote.trim();
    }
}