package com.dimple.service.impl;

import com.dimple.bean.CustomSalary;
import com.dimple.dao.SalaryMapper;
import com.dimple.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Dimple on 2018/6/29/10:12
 */
@Service
public class SalaryServiceImpl implements SalaryService {
    @Autowired
    SalaryMapper salaryMapper;

    @Override
    public List<CustomSalary> getAllSalary() {
//        处理信息封装
//        salaryMapper.
        List<CustomSalary> salaries = salaryMapper.selectAllSalary();
        return salaries;
    }
}
