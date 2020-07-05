package com.pms.service;

import java.util.List;

import com.pms.entity.Policy;

public interface PolicyService {
	List<Policy> getAllPolicies();
	List<Object[]> getPoliciesByUser(int id);
	void updatePolicy(Policy policy);
}
