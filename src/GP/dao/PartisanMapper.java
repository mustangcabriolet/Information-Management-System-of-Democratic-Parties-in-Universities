package GP.dao;

import java.util.List;

import GP.domain.ExportInfo;
import GP.domain.Partisan;

public interface PartisanMapper {

	/**
	 * 查询所有数据
	 */
	public List<Partisan> findAl();

	public List<ExportInfo> exportinfo();

	/**
	 * 保存数据
	 * @param partisan
	 */
	public void save(Partisan partisan);

	/**
	 * 根据id 查询对象
	 * @param id
	 * @return
	 */
	public Partisan findById(Integer id);

	/**
	 * 根据str 查询所有对象
	 * @param str
	 * @return
	 */
	public List<Partisan> findByStr(String str);
	
	/**
	 * 修改对象数据
	 * @param partisan
	 */
	public  void update(Partisan partisan);

	/**
	 * 删除数据
	 * @param id
	 */
	public void delete(Integer[] id);
}
