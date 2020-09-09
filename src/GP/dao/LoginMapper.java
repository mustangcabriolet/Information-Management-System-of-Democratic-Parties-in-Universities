package GP.dao;

import GP.domain.Admin;
import org.apache.ibatis.annotations.Param;

public interface LoginMapper {
    public Admin checkLogin(String name);
    Admin getadminInfo(String name);
}
