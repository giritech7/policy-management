package com.pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pms.dao.UserDAO;
import com.pms.entity.User;
import com.pms.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
	private UserDAO userDAO;
    
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String userid) {
        return userRepository.findByUsername(userid);
    }

	@Override
	public boolean userEmailPhoneExists(String phone, String email) {
		return userDAO.userEmailPhoneExists(phone, email);
	}
}
