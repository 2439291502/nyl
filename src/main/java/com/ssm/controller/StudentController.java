package com.ssm.controller;

import com.ssm.entity.Student;
import com.ssm.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Resource
    private StudentService studentService;

    @RequestMapping(value = "/login")
    public String loginUser(Student loginUser, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Student student = studentService.login(loginUser);
        if(student == null){
            response.getWriter().write("账号不存在!");
            return "login";
        }else if(!student.getStudentPassword().equals(loginUser.getStudentPassword())){
            response.getWriter().write("密码输入错误!");
            return "login";
        }else {
            return "good";
        }
    }
}
