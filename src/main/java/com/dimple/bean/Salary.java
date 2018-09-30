package com.dimple.bean;

public class Salary {
    private Integer salaId;

    private Integer salaEmpid;

    private Double salaBasesalary;

    private Double salaPerformancesalary;

    private Double salaAttendance;

    private Double salaStation;
    Employee employee;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Integer getSalaId() {
        return salaId;
    }

    public void setSalaId(Integer salaId) {
        this.salaId = salaId;
    }

    public Integer getSalaEmpid() {
        return salaEmpid;
    }

    public void setSalaEmpid(Integer salaEmpid) {
        this.salaEmpid = salaEmpid;
    }

    public Double getSalaBasesalary() {
        return salaBasesalary;
    }

    public void setSalaBasesalary(Double salaBasesalary) {
        this.salaBasesalary = salaBasesalary;
    }

    public Double getSalaPerformancesalary() {
        return salaPerformancesalary;
    }

    public void setSalaPerformancesalary(Double salaPerformancesalary) {
        this.salaPerformancesalary = salaPerformancesalary;
    }

    public Double getSalaAttendance() {
        return salaAttendance;
    }

    public void setSalaAttendance(Double salaAttendance) {
        this.salaAttendance = salaAttendance;
    }

    public Double getSalaStation() {
        return salaStation;
    }

    public void setSalaStation(Double salaStation) {
        this.salaStation = salaStation;
    }
}