package GP.service;


import GP.dao.PartisanInfoMapper;
import GP.domain.PartisanInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/*@Service("partisanInfoService")
@Transactional*/
@Service
public class PartisanInfoServiceImpl{
    //注入Mapper接口对象
    @Resource
    private PartisanInfoMapper partisanInfoMapper;
    public List<PartisanInfo> findAll() {
        return partisanInfoMapper.findAllInfo();
    }
}
