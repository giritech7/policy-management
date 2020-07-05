package com.pms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pms.entity.Policy;
@Transactional
@Repository
public class PolicyDAOImpl implements PolicyDAO{
	
	@PersistenceContext	
	private EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Policy> getAllPolicies() {
		String hql = "FROM Policy as p ORDER BY p.id";
		return (List<Policy>) entityManager.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getPoliciesByUser(int id) {
		Query query=entityManager.createNativeQuery("select p.id,p.pname,pd.amount,DATE_FORMAT(pd.enddate,'%d-%m-%Y') as enddate,(case when now()>pd.enddate then 'No' else 'Yes' end)  as valid from policydetails pd inner join policy p on pd.policyid=p.id where pd.userid="+id);
		List<Object[]> pdObjects=query.getResultList();
		return pdObjects;
	}
	
	public Policy getPolicyById(int id) {
		return entityManager.find(Policy.class, id);
	}
	
	public void updatePolicy(Policy policy) {
		Policy p = getPolicyById(policy.getId());
		p.setPname(policy.getPname());
		p.setPdescription(policy.getPdescription());
		entityManager.flush();
	}
	
}
