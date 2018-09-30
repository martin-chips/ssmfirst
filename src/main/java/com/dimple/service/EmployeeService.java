package com.dimple.service;

import com.dimple.bean.Employee;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Dimple on 2018/6/22/11:38
 */
@Service
public interface EmployeeService {
    //    获取所有的员工数据
    public List<Employee> getAll();

    void saveEmp(Employee employee);

    boolean checkEmpName(String empName);

    Employee getEmp(Integer id);

    void update(Employee employee);

    void deleteEmpById(Integer id);

    void deleteBatch(List<Integer> ids);
}
