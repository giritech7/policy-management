package com.pms.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;

import com.pms.controller.UserController;
import com.pms.entity.User;
import com.pms.service.SecurityService;
import com.pms.service.UserService;
import com.pms.validator.UserValidator;

@RunWith(SpringRunner.class)
@WebMvcTest(value = UserController.class, secure = false)
public class UserTest {
	
	@MockBean
	private UserValidator userValidator;
	
	@MockBean
	private UserService userService;
	
	@MockBean
	private SecurityService securityService;
	
	@Test
	public void testUserRegistration()
	{
		User user=new User();
		Errors errors = new BeanPropertyBindingResult(user, "user");
		userValidator.validate(user , errors);	
		List<ObjectError> allErrors = errors.getAllErrors();
		assertTrue("Errors list size should not be null : ", allErrors.size() > 0);
	}
}
