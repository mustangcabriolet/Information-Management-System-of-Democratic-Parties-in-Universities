package GP.service;

import java.util.List;

import GP.domain.Partisan;


public interface PartisanService {

	/**
	 * 查询所有数据
	 */
	public List<Partisan> findAll();

	public void save(Partisan partisan);

	public Partisan findById(Integer id);

	/**
	 * 查询所有与从前端传来数据相同的人员
	 */
	public List<Partisan> findAllByStr(String str);

	public void delete(Integer[] id);
}
