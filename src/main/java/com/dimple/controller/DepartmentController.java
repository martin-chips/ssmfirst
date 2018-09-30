package com.dimple.controller;

import com.dimple.bean.Department;
import com.dimple.bean.Msg;
import com.dimple.service.DepartmentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Dimple on 2018/6/24/11:04
 */
@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @ResponseBody
    @RequestMapping("/depts")
    public Msg getDeptAll(Model model) {
        List<Department> departments = departmentService.getDeptAll();
        model.addAttribute("depts", departments);
        return Msg.success().add("depts", departments);
    }

    @ResponseBody
    @RequestMapping("/deptss")
    public Msg getDeptAlll(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 8);
        List<Department> deptAll = departmentService.getDeptAll();
        PageInfo pageInfo = new PageInfo(deptAll, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    //    增加POST、修改PUT、删除DELETE、查询GET
    @ResponseBody
    @RequestMapping(value = "/dept", method = RequestMethod.POST)
    public Msg saveDept(Department department){
        departmentService.saveDept(department);
        return Msg.success();
    }
}
