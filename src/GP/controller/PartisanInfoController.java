package GP.controller;


import GP.domain.PartisanInfo;
import GP.service.PartisanInfoService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/partisanInfo")
public class PartisanInfoController {
    //注入service对象
    @Resource
    private PartisanInfoService partisanInfoService;

    /**
     * 查询所有数据，给页面返回json格式数据
     * easyui的datagrid组件，后台传给前端json数据
     */
    @RequestMapping("/list")
    @ResponseBody  // 用于转换对象为json
    public List<PartisanInfo> list() {
        //查询所有数据
        List<PartisanInfo> listAll = partisanInfoService.findAll();
        return listAll;
    }
}