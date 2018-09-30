package com.dimple.controller;

import com.dimple.bean.CustomSalary;
import com.dimple.bean.Msg;
import com.dimple.service.SalaryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Dimple on 2018/6/29/10:12
 */
@Controller
public class SalaryController {

    @Autowired
    SalaryService salaryService;

    @ResponseBody
    @RequestMapping(value = "/salary")
    public Msg selectAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn){
        PageHelper.startPage(pn, 5);
        List<CustomSalary> allSalary = salaryService.getAllSalary();
        PageInfo pageInfo = new PageInfo(allSalary,5);
        return Msg.success().add("pageInfo", pageInfo);
    }


}
