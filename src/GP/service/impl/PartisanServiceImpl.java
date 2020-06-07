package GP.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import GP.dao.PartisanMapper;
import GP.domain.Partisan;
import GP.service.PartisanService;

@Service("partisanService")
@Transactional
public class PartisanServiceImpl implements PartisanService {

	//注入Mapper接口对象
	@Resource
	private PartisanMapper partisanMapper;
	//查找所有数据
	public List<Partisan> findAll() {
		return partisanMapper.findAl();
	}

	public void save(Partisan partisan) {
		//判断是添加还是修改
		if(partisan.getId()!=null){
			//修改
			partisanMapper.update(partisan);
		}else{
			//增加
			partisanMapper.save(partisan);
		}
	}

	public Partisan findById(Integer id) {
		return partisanMapper.findById(id);
	}

//	查找所有相同数据的人员
	public List<Partisan> findAllByStr(String str) {
		return partisanMapper.findByStr(str);
	}

	public void delete(Integer[] id) {
		partisanMapper.delete(id);
	}

}
