package GP.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GP.domain.Partisan;
import GP.service.LogConfig;
import GP.service.PartisanServiceImpl;
import cn.hutool.log.Log;
import cn.hutool.log.LogFactory;
import cn.hutool.log.dialect.commons.ApacheCommonsLogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/partisan")
public class PartisanController {

	//注入service对象
	@Autowired
	private PartisanServiceImpl partisanService;

	@Resource
	private LogConfig logConfig;
	
	/**
	 * 查询所有数据，给页面返回json格式数据
	 * easyui的datagrid组件，后台传给前端json数据： [ {id:1,name:xxx},{id:1,name:xxx} ]
	 */
	@RequestMapping("/list")
	@ResponseBody  // 用于转换对象为json
	public List<Partisan> list(){
		//查询所有数据
		List<Partisan> listall = partisanService.findAll();
		return listall;
	}


	@RequestMapping("/listByFind")
	@ResponseBody  // 用于转换对象为json
	public List<Partisan> listByName(String name){
		//查询同一的所有数据
		List<Partisan> listByName = partisanService.findAllByStr(name);
		return listByName;
	}

	//用map存储传给前端的数据
	private Map<String,Object> data_to_jsp = new HashMap<String,Object>();
	//保存查询的数据
	private List<Partisan> list = new ArrayList<>();

	/**
	 * 分页查询数据
	 */
	@RequestMapping("/listByPageFind")
	@ResponseBody
	public Map<String,Object> listByPageName(Integer page, Integer rows, HttpServletRequest request)throws Exception{
		//设置分页参数
		PageHelper.startPage(page, rows);
		//取得前端传过来的参数
		String str_find = request.getParameter("str");
		//参数为null则全部显示全部数据，参数不为null则显示带参数的查找
		if (str_find==null)
		{
			list = partisanService.findAll();
		}
		else
		{
			list = partisanService.findAllByStr(str_find);
		}
		//用PageInfo封装查询结果
		PageInfo<Partisan> find_result = new PageInfo<Partisan>(list);
		//总记录数
		long total = find_result.getTotal();
		//当前页数据列表
		List<Partisan> current_list = find_result.getList();
		logConfig.log.info("当前页数"+total+"页");
		data_to_jsp.put("total", total);
		data_to_jsp.put("rows", current_list);
		return data_to_jsp;
	}

	/**
	 * 保存数据
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,Object> save(Partisan partisan){
		try {
			partisanService.save(partisan);
			data_to_jsp.put("result", true);
		} catch (Exception e) {
			e.printStackTrace();
			data_to_jsp.put("result", false);
			data_to_jsp.put("msg", e.getMessage());
		}
		return data_to_jsp;
	}
	
	/**
	 * 根据id 查询对象
	 */
	@RequestMapping("/findById")
	@ResponseBody
	public Partisan findById(Integer id){
		Partisan find_id = partisanService.findById(id);
		return find_id;
	}


	 // 删除数据
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String,Object> delete(Integer[] id){
		try {
			partisanService.delete(id);
			data_to_jsp.put("result", true);
		} catch (Exception e) {
			e.printStackTrace();
			data_to_jsp.put("result", false);
			data_to_jsp.put("msg", e.getMessage());
		}
		return data_to_jsp;
	}
	@RequestMapping("exportAllUser")
	public void exportAsExcel(HttpServletResponse response)
	{
		partisanService.exportexcel(response);

	}
	@RequestMapping("opennewpage")
	public String opennewpage()
	{
		return "NewPage";
	}
}
