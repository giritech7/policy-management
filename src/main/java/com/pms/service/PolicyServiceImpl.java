package com.pms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pms.dao.PolicyDAO;
import com.pms.entity.Policy;

@Service
public class PolicyServiceImpl implements PolicyService{
	
	@Autowired
	private PolicyDAO policyDAO;
	
	@Override
	public List<Policy> getAllPolicies() {
		return policyDAO.getAllPolicies();
	}

	@Override
	public List<Object[]> getPoliciesByUser(int id) {
		return policyDAO.getPoliciesByUser(id);
	}

	@Override
	public void updatePolicy(Policy policy) {
		policyDAO.updatePolicy(policy);
	}

}
