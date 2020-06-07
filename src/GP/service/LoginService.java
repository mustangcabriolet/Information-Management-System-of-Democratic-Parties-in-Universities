package GP.service;

import GP.domain.Admin;

public interface LoginService {
    public Admin checkLogin(String name,String password);
}
