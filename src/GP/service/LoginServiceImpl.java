package GP.service;

import GP.domain.Admin;
import GP.dao.LoginMapper;
import cn.hutool.log.Log;
import cn.hutool.log.LogFactory;
import cn.hutool.log.dialect.commons.ApacheCommonsLogFactory;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;

@Service
public class LoginServiceImpl {
    @Resource
    private LoginMapper loginMapper;
    @Resource
    private LogConfig logConfig;
    public Admin checkLogin(String name, String password) {
            Admin login=loginMapper.checkLogin(name);
            logConfig.log.info("登入名为："+login.getName());
            if(login==null||!login.getPassword().equals(password))
            {
                login = null;		//无此用户，验证失败，返回null
            }
            return login;
    }

    public Admin getAdminInfo( String name)
    {
        return loginMapper.getadminInfo(name);
    }
}
