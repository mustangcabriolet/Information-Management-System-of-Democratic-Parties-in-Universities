package GP.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller

public class TestController {

    /**
    *@Description: 测试用例
    *@param: [request, model]
    *@return: void
    *@Author: Mr.Wu
    *@Date: 2020/8/7
    */
    @RequestMapping("/forward")
    public String forward(HttpServletRequest request, Model model)
    {
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        HashMap<String,String> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);
        System.out.println(username+"========"+password);
        model.addAllAttributes(map);
        return "login";
    }
}
