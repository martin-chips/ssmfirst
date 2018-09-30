package com.dimple.bean;

/**
 * Created by Dimple on 2018/6/29/10:11
 */
public class CustomSalary {
    /**
     * SELECT sala_id,sala_empId,sala_baseSalary,sala_performanceSalary,sala_attendance,sala_station,emp_name,gender,dept_name
     * FROM tbl_emp,tbl_dept,tbl_salay WHERE tbl_salay.sala_empId=tbl_emp.emp_id and tbl_emp.d_id=tbl_dept.dept_id
     */
    private Integer sala_id;
    private Integer sala_empId;
    private double sala_baseSalary;
    private double sala_performanceSalary;
    private double sala_attendance;
    private double sala_station;
    private String emp_name;
    private String gender;
    private String dept_name;

    public Integer getSala_id() {
        return sala_id;
    }

    public void setSala_id(Integer sala_id) {
        this.sala_id = sala_id;
    }

    public Integer getSala_empId() {
        return sala_empId;
    }

    public void setSala_empId(Integer sala_empId) {
        this.sala_empId = sala_empId;
    }

    public double getSala_baseSalary() {
        return sala_baseSalary;
    }

    public void setSala_baseSalary(double sala_baseSalary) {
        this.sala_baseSalary = sala_baseSalary;
    }

    public double getSala_performanceSalary() {
        return sala_performanceSalary;
    }

    public void setSala_performanceSalary(double sala_performanceSalary) {
        this.sala_performanceSalary = sala_performanceSalary;
    }

    public double getSala_attendance() {
        return sala_attendance;
    }

    public void setSala_attendance(double sala_attendance) {
        this.sala_attendance = sala_attendance;
    }

    public double getSala_station() {
        return sala_station;
    }

    public void setSala_station(double sala_station) {
        this.sala_station = sala_station;
    }

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }
}
