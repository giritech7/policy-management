package com.pms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pms.entity.Policy;
import com.pms.service.PolicyService;
import com.pms.service.UserService;

@Controller
@RequestMapping("policy")
public class PolicyController {
	
	 @Autowired
	 private PolicyService policyService;
	 
	 @Autowired
	 private UserService userService;
	 
	 @GetMapping("all")
	 public ResponseEntity<List<Policy>> getAllPolicies() {
		List<Policy> list = policyService.getAllPolicies();
		return new ResponseEntity<List<Policy>>(list, HttpStatus.OK);
	 }
	 
	 @GetMapping("details/{id}")
	 public ResponseEntity<List<Object[]>> getPolicyDetails(@PathVariable("id") Integer id) {
		List<Object[]> list = policyService.getPoliciesByUser(id);
		return new ResponseEntity<List<Object[]>>(list, HttpStatus.OK);
	 }
	 
	 @GetMapping("details")
	 public ResponseEntity<List<Object[]>> getPolicyDetails() {
		User principalUser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    com.pms.entity.User user=userService.findByUsername(principalUser.getUsername());
		List<Object[]> list = policyService.getPoliciesByUser(user.getId());
		return new ResponseEntity<List<Object[]>>(list, HttpStatus.OK);
	 }
	 
	 @PutMapping("update")
	 public ResponseEntity<Policy> updatePolicy(@RequestBody Policy policy) {
		 policyService.updatePolicy(policy);
		 return new ResponseEntity<Policy>(policy, HttpStatus.OK);
	 }
}
