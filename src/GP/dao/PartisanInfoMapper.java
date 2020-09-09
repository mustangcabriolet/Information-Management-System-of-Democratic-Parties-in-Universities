package GP.dao;

import GP.domain.PartisanInfo;

import java.util.List;

public interface PartisanInfoMapper {
    //查找数据
    public List<PartisanInfo> findAllInfo();
    //增加党派人员数量---用于人员增加
    void IncreaseNumber(String partisanName);
    //减少党派人员数据--用于人员删除
    void DecreaseNumber(String partisanName);
}
