package GP.service.impl;

import GP.domain.Admin;
import GP.dao.LoginMapper;
import org.mybatis.spring.support.SqlSessionDaoSupport;

public class LoginServiceImpl extends SqlSessionDaoSupport implements LoginMapper {

    public Admin checkLogin(String name, String password) {
        Admin login = null;
        try {
            login = this.getSqlSession().selectOne("GP.dao.LoginMapper.checkLogin", name);
            if(!login.getPassword().equals(password)) login = null;		//无此用户，验证失败，返回null
        }catch(Exception e) {
            e.printStackTrace();
        }
        return login;
    }
}
