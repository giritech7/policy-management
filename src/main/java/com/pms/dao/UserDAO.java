package com.pms.dao;

import java.util.List;

import com.pms.entity.User;


public interface UserDAO {
	List<User> getAllUsers();
    User getUserById(int userId);
    boolean userEmailPhoneExists(String phone, String email);
}
