package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import com.blog.dao.BloggerDao;
import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import com.blog.util.CryptographyUtil;

@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService{
	@Resource
	private BloggerDao bloggerDao;

	@Override
	public Blogger getByUserName(String userName) {
		return bloggerDao.getByUserName(userName);
	}
	
	@Override
	public List<Blogger> list() {
		return bloggerDao.list();
	}
	
	@Override
	public Integer update(Blogger blogger) {
		SecurityUtils.getSubject().getSession().setAttribute("currentUser", blogger);
		return bloggerDao.update(blogger);
	}

	@Override
	public Blogger find() {
		return bloggerDao.find();
	}

	@Override
	public boolean checkUser(String userName, Integer userType) {
		return bloggerDao.checkUser(userName,userType)!=null?true : false;
	}

	@Override
	public boolean insert(Blogger blogger) {
		try {
			blogger.setPassword(CryptographyUtil.md5(blogger.getPassword(),"java1234"));
			blogger.setUserType(2);
			bloggerDao.insertSelective(blogger);
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public void delete(int parseInt) {
		bloggerDao.delete(parseInt);
	}
	
}
