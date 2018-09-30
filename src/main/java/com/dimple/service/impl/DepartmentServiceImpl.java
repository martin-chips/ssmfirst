package com.dimple.service.impl;

import com.dimple.bean.Department;
import com.dimple.dao.DepartmentMapper;
import com.dimple.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Dimple on 2018/6/24/11:05
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public List<Department> getDeptAll() {
//        return null;
        return departmentMapper.selectByExample(null);
    }

    @Override
    public void saveDept(Department department) {
        departmentMapper.insertSelective(department);
    }
}
