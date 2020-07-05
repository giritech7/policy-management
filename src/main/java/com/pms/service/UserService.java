package com.pms.service;

import com.pms.entity.User;

public interface UserService {
    void save(User user);

    User findByUsername(String userid);
    
    boolean userEmailPhoneExists(String phone, String email);
}
