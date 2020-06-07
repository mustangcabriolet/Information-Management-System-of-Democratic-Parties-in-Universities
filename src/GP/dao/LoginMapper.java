package GP.dao;

import GP.domain.Admin;
import org.apache.ibatis.annotations.Param;

public interface LoginMapper {
    public Admin checkLogin(@Param("name") String name, @Param("password") String password);
}
