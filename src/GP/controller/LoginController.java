package GP.controller;

import GP.dao.LoginMapper;
import GP.service.LoginService;
import GP.domain.Admin;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@Controller
public class LoginController {
    @RequestMapping("/loginController")
    public String handleRequest(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        request.setCharacterEncoding("utf-8");
        ApplicationContext ap = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        LoginMapper login = (LoginMapper) ap.getBean("loginMapper");
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        Admin l = login.checkLogin(username, password);
        if(l != null) {												//如果登录成功
            model.addAttribute("lgn", l.getName());
            return "index";
        }else {
            return "error";

        }
    }
}
