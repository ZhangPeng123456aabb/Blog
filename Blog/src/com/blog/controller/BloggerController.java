package com.blog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import com.blog.util.CryptographyUtil;

/**
 * 程序员用户登录相关
 *
 */
@Controller
@RequestMapping("/blogger")
public class BloggerController {

	@Resource
	private BloggerService bloggerService;

	@RequestMapping("/register")
	public String register(Blogger blogger) {
		boolean flag = bloggerService.insert(blogger);
		if (flag)
			return "login";
		else
			return "register";
	}

	@RequestMapping("/login")
	public String login(Model model,Blogger blogger, HttpServletRequest request) {
		/** 用户名 */
		String userName = blogger.getUserName();
		/** 密码 */
		String password = blogger.getPassword();
		String pw = CryptographyUtil.md5(password, "java1234");

		/** Subject */
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(userName, pw);
		try {
			// 传递token给shiro的realm
			subject.login(token);
			boolean res = bloggerService.checkUser(userName, blogger.getUserType());
			if (res) {
				blogger = bloggerService.getByUserName(blogger.getUserName());
				System.out.println(blogger.getNickName());
				model.addAttribute("blogger", blogger);
				// 1为管理员
				if (blogger.getUserType() == 1) {
					return "admin/main";
				} else if (blogger.getUserType() == 2) {
					return "user/main";
				}
			} else {
				request.setAttribute("erroInfo", "请确认身份是否正确！");
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("blogger", blogger);
			request.setAttribute("erroInfo", "用户名或密码错误！");
		}

		return "login";
	}

	/**
	 * 关于博主
	 */
	@RequestMapping("/aboutMe")
	public ModelAndView aboutMe() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("blogger", bloggerService.find());
		mav.addObject("mainPage", "foreground/blogger/info.jsp");
		mav.addObject("pageTitle", "关于博主_个人博客系统");
		mav.setViewName("index");
		return mav;
	}
}
