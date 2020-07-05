package com.pms.dao;

import java.util.List;

import com.pms.entity.Policy;

public interface  PolicyDAO {
	List<Policy> getAllPolicies();
	List<Object[]> getPoliciesByUser(int id);
	Policy getPolicyById(int id);
	void updatePolicy(Policy policy);
}
