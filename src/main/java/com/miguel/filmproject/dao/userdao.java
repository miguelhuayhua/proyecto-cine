/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.miguel.filmproject.dao;

import com.miguel.filmproject.model.User;
import java.util.List;

/**
 *
 * @author miguel
 */
public interface userdao {

    public User existLogUser(String name, String password);

    public void createUser(String firstname, String lastname, String username, int ci, String email, String password);

    public User getUserById(String id);

    public List<User> getUserByUsername(String username);

    public List<User> getUserByCi(String ci);

    public List<User> getUsersBySkipAndLimit(String skip, String limit);

    public void deleteUserById(String id);

    public void updateUser(User user);

    public int getUsersSize();

}
