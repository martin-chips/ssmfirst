package com.dimple.controller;

import com.dimple.bean.Employee;
import com.dimple.bean.Msg;
import com.dimple.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Dimple on 2018/6/22/11:37
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    /**
     * 可以单个删除，也可以批量
     * 多个删除用-隔开
     *
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
    public Msg deleteEmpById(@PathVariable("ids") String ids) {
//        包含-表示的是批量删除
        if (ids.contains("-")) {
            String[] split = ids.split("-");
//            组装id
            List<Integer> list = new ArrayList<>();
            for (String s: split) {
                list.add(Integer.parseInt(s));
            }
            employeeService.deleteBatch(list);
        } else {
            employeeService.deleteEmpById(Integer.parseInt(ids));
        }
        return Msg.success();
    }

    /**
     * 如果直接发送put请求，除了随着url带过来的id，其他的全是null
     * 问题：请求体中有数据，spring不能自动封装
     * Tomcat是会将请求体中的数据封装到map中，request.getparameter是从map中获取值，springmvc也是从map中获取值。
     * put请求，请求体中的数据 request.getParameter("email");获取不到，Tomcat不会封装put请求中的数据到map中，只会封装post
     * 的请求数据到map中
     * <p>
     * 使用httpPutFormContetFilter过滤器重写getParameter方法，从请求体中获取到数据，重新包装request，就可以从直接封装的
     * map中取数据
     *
     * @param employee
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    public Msg updateEmp(Employee employee, HttpServletRequest request) {
        String email = request.getParameter("email");
        employeeService.update(employee);
        return Msg.success();
    }

    /**
     * 按照员工ID进行查询
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    public Msg getEmp(@PathVariable(value = "id") Integer id) {
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp", employee);
    }


    /**
     * responseBody需要正常工作需要导入Jackson包
     *
     * @param pn
     * @return
     */
    @RequestMapping("/empsnew")
    @ResponseBody
    public Msg getRmpsJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        //        引入pageHelper,只需要在调用之前传入页码，以及每页的大小
        PageHelper.startPage(pn, 8);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Employee> emps = employeeService.getAll();
//         使用pageinfo包装查询后的结果，只需要将pageinfo交给页面就行了
//        封装了详细的分页信息，包括有查询出来的数据
        PageInfo pageInfo = new PageInfo(emps, 5);//连续显示的页数
        return Msg.success().add("pageInfo", pageInfo);
    }

    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
//        引入pageHelper,只需要在调用之前传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Employee> emps = employeeService.getAll();
//         使用pageinfo包装查询后的结果，只需要将pageinfo交给页面就行了
//        封装了详细的分页信息，包括有查询出来的数据
        PageInfo pageInfo = new PageInfo(emps, 5);//连续显示的页数
        model.addAttribute("pageInfo", pageInfo);
        return "list";
    }

    //restful风格
    @ResponseBody
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    public Msg saveEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            // 检验失败，就应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError: fieldErrors) {
                System.out.println("字段的信息：" + fieldError.getField());
                System.out.println("错误信息：" + fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.failure().add("errorFields", map);
        } else {

            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }

    @ResponseBody
    @RequestMapping(value = "/checkUser")
    public Msg checkEmpName(String empName) {
//        对于传过来的数据进行后端校验
        String regName = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!empName.matches(regName)) {
            return Msg.failure().add("va_msg", "用户名必须是2-5位中文或者6-16位英文字母和数字的组合");
        }

        if (employeeService.checkEmpName(empName)) {
            return Msg.success().add("va_msg", "用户名可用");
        } else {
            return Msg.failure().add("va_msg", "用户名不可用");
        }
    }

}

