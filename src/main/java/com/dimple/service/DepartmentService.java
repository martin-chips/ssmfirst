package com.dimple.service;

import com.dimple.bean.Department;

import java.util.List;

/**
 * Created by Dimple on 2018/6/24/11:05
 */
public interface DepartmentService {
    List<Department> getDeptAll();

    void saveDept(Department department);
}
