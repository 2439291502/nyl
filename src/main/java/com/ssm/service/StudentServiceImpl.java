package com.ssm.service;

import com.ssm.dao.StudentDao;
import com.ssm.entity.Student;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService{

    @Resource
    private StudentDao studentDao;

    @Override
    public Student login(Student student) {
        return studentDao.login(student);
    }
}
