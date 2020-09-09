package GP.controller;

import GP.domain.Admin;
import GP.service.LoginServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    @Autowired
    private LoginServiceImpl loginserviceimpl;
    @RequestMapping("/loginController")
    public String handleRequest(HttpServletRequest request, Model model) throws Exception {
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        Admin l = loginserviceimpl.checkLogin(username, password);
        if(l != null) {												//如果登录成功
            model.addAttribute("lgn", l.getName());
            return "index";
        }else {
            return "error";

        }
    }
    @ResponseBody
    @RequestMapping("/resetPassword")
    public Admin resetPassword()
    {
       // String name = request.getParameter("name");
       // String name = "admin";
      //  Admin admin = loginserviceimpl.getAdminInfo(name);
        Admin admin = new Admin();
        admin.setName("admin");
        admin.setPassword("12345");
        return admin;
    }
}
