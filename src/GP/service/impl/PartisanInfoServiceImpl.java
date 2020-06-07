package GP.service.impl;


import GP.dao.PartisanInfoMapper;
import GP.domain.PartisanInfo;
import GP.service.PartisanInfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("partisanInfoService")
@Transactional
public class PartisanInfoServiceImpl implements PartisanInfoService {
    //注入Mapper接口对象
    @Resource
    private PartisanInfoMapper partisanInfoMapper;
    public List<PartisanInfo> findAll() {
        return partisanInfoMapper.findAllInfo();
    }
}
