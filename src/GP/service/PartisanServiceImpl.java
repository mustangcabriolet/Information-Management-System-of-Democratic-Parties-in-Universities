package GP.service;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import GP.dao.PartisanInfoMapper;
import GP.domain.ExportInfo;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import cn.hutool.poi.excel.StyleSet;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import GP.dao.PartisanMapper;
import GP.domain.Partisan;

@Service
public class PartisanServiceImpl {

	//注入Mapper接口对象
	@Resource
	private PartisanMapper partisanMapper;
	//注入Mapper接口对象
	@Resource
	private PartisanInfoMapper partisanInfoMapper;

	//查找所有数据
	public List<Partisan> findAll() {
		return partisanMapper.findAl();

	}

	public void save(Partisan partisan) {
		String partisanName = partisan.getPartisan();
		Integer id = partisan.getId();
		Partisan partisanBefore = partisanMapper.findById(id);
		//判断是添加还是修改
		if (partisan.getId() != null) {
			//修改
			partisanMapper.update(partisan);
			//将原党派的人数减一
			partisanInfoMapper.DecreaseNumber(partisanBefore.getPartisan());
			//将新党派人数加一
			partisanInfoMapper.IncreaseNumber(partisanName);
		} else {
			//增加

			partisanMapper.save(partisan);
			partisanInfoMapper.IncreaseNumber(partisanName);
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
		for(int i =0;i<id.length;i++)
		{
			Partisan partisan = partisanMapper.findById(id[i]);
			partisanInfoMapper.DecreaseNumber(partisan.getPartisan());
		}
		partisanMapper.delete(id);
	}

	//导出为excel表格
	public void exportexcel(HttpServletResponse response) {
		List<ExportInfo> partisans = partisanMapper.exportinfo();
		//System.out.println(partisans.toString());
		// 通过工具类创建writer，默认创建xls格式
		ExcelWriter writer = ExcelUtil.getWriter();
		//给列设置别名
		writer.addHeaderAlias("name", "姓名");
		writer.addHeaderAlias("gender", "性别");
		writer.addHeaderAlias("telephone", "电话");
		writer.addHeaderAlias("address", "地址");
		writer.addHeaderAlias("partisan", "党派");
		writer.addHeaderAlias("join_time", "加入时间");
		writer.addHeaderAlias("school", "学校");
		writer.addHeaderAlias("chairman", "主席");
		writer.addHeaderAlias("establish_time", "创立时间");
		// 设置标题样式
		StyleSet style = writer.getStyleSet();
		CellStyle headCellStyle = style.getHeadCellStyle();
		//水平居中
		headCellStyle.setAlignment(HorizontalAlignment.CENTER);
		//垂直居中
		headCellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		//设置内容字体
		Font font = writer.createFont();
		//加粗
		font.setBold(true);
		//设置标题字体大小
		font.setFontHeightInPoints((short)12);
		headCellStyle.setFont(font);
		//设置每列宽度，-1为全部列
		writer.setColumnWidth(-1,15);
		//设置行的默认高度
		writer.setDefaultRowHeight(20);
		
		writer.write(partisans, true);

		//test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
		String fileName = "党派人员信息表";
		//out为OutputStream，需要写出到的目标流
		ServletOutputStream out = null;
		try {
			//response为HttpServletResponse对象
			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			//设置Http响应头告诉浏览器下载这个附件
			response.setHeader("Content-Disposition", "attachment;Filename=" + URLEncoder.encode(fileName, "UTF-8") + ".xls");
			response.setHeader("Content-Transfer-Encoding", "binary");
			out = response.getOutputStream();
			//System.out.println(out.toString());
			writer.flush(out, true);
			System.out.println("导出成功");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 关闭writer，释放内存
			writer.close();
		}
//此处记得关闭输出Servlet流
		IoUtil.close(out);

	}

}

