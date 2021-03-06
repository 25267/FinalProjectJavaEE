package org.example.Zhanibek.model;

import javax.persistence.*;
import java.io.Serializable;


public class User implements Serializable {


    private Long id;
    private String name;
    private String password;


    public User() {
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
