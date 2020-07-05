package com.pms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pms.entity.User;
@Transactional
@Repository
public class UserDAOImpl implements UserDAO{
	
	@PersistenceContext	
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers() {
		String hql = "FROM User as user ORDER BY user.fname";
		return (List<User>) entityManager.createQuery(hql).getResultList();
	}

	@Override
	public User getUserById(int userId) {
		return entityManager.find(User.class, userId);
	}

	public boolean userEmailPhoneExists(String phone, String email) {
		String hql = "FROM User as u WHERE u.phone = ? or u.emailId = ?";
		int count = entityManager.createQuery(hql).setParameter(1, phone)
		              .setParameter(2, email).getResultList().size();
		return count > 0 ? true : false;
	}

}
