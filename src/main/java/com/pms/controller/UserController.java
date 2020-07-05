package com.pms.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pms.entity.User;
import com.pms.service.SecurityService;
import com.pms.service.UserService;
import com.pms.validator.UserValidator;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);
         
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        
        if(userService.userEmailPhoneExists(userForm.getPhone(), userForm.getEmailId()))
        {
        	model.addAttribute("error", "Phone number or email already exist");
        	return "registration";
        }
        Calendar cal = Calendar.getInstance();
    	cal.setTime(userForm.getDob());    	
    	userForm.setUsername(userForm.getFname()+cal.get(Calendar.DAY_OF_MONTH)+cal.get(Calendar.MONTH));
    	
        userService.save(userForm);

        //securityService.autologin(userForm.getUsername(), userForm.getConfirmPassword());
        model.addAttribute("message", "User Registration Successfull. Login with username:<b>"+userForm.getUsername()+"</b> and the provided password");
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String home(Model model) {
        return "home";
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
