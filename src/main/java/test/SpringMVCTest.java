package test;

/**
 * Created by Dimple on 2018/6/22/14:04
 */

import com.dimple.bean.Department;
import com.dimple.bean.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 使用sprig测试模块提供的测试请求功能，测试crud的正确性
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springMVC.xml"})
public class SpringMVCTest {
    //    传入SpringMVC的IOC
    @Autowired
    WebApplicationContext context;

    //    虚拟MVC请求，获取处理结果
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
       mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void test() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/salary")).andReturn();
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
    }
    @Test
    public void testDepts() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/depts")).andReturn();
        MockHttpServletRequest request = result.getRequest();
        List<Department> depts = (List<Department>) request.getAttribute("depts");
        System.out.println(depts);

    }
    @Test
    public void testPage() throws Exception {

        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "2")).andReturn();
// 请求成功以下，请求域中有一个pageinfo
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码：" + pageInfo.getPageNum());
        System.out.println("总页码：" + pageInfo.getPages());
        System.out.println("总记录数：" + pageInfo.getTotal());
        int[] navigatepageNums = pageInfo.getNavigatepageNums();
        for (int navigatepageNum: navigatepageNums) {
            System.out.println(" " + navigatepageNum);
        }
//        获取员工数据
        List<Employee> list = pageInfo.getList();
        for (Employee employee: list) {
            System.out.println(employee.getEmpName());
        }
    }

}
