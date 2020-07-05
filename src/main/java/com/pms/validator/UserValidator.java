package com.pms.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.pms.entity.User;
import com.pms.service.UserService;

@Component
public class UserValidator implements Validator {
    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fname", "NotEmpty");
        if (user.getFname().length() < 2 || user.getFname().length() > 20) {
            errors.rejectValue("fname", "Size.userForm.fname");
        }
        
        if (user.getLname().length() < 2 || user.getLname().length() > 20) {
            errors.rejectValue("lname", "Size.userForm.lname");
        }
        
        if (user.getDob()==null) {
            errors.rejectValue("dob", "invalid.userForm.dob");
        }
        
        if (user.getAddress().length()==0) {
            errors.rejectValue("address", "size.userForm.address");
        }
        
        if (user.getEmailId().length() ==0 && validate(user.getEmailId())) {
            errors.rejectValue("emailid", "invalid.userForm.email");
        }
        
        String phoneRegex = "^[0-9]*$";
        if (user.getPhone().length() ==0 && !user.getPhone().matches(phoneRegex)) {
            errors.rejectValue("phone", "invalid.userForm.phone");
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("confirmPassword", "Diff.userForm.confirmPassword");
        }
    }
    
    public static final Pattern VALID_EMAIL_ADDRESS_REGEX = 
    	    Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
    
    public static boolean validate(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX .matcher(emailStr);
        return matcher.find();
    }
}
