package com.blog.service;

import java.util.List;

import com.blog.entity.Blogger;

public interface BloggerService {
	/**根据登录名查询博主对象*/
	public Blogger getByUserName(String userName);
	
	/**更新博主对象*/
	public Integer update(Blogger blogger);
	
	/**查询博主*/
	public Blogger find();

	public boolean checkUser(String userName, Integer userType);

	public boolean insert(Blogger blogger);

	List<Blogger> list();

	public void delete(int parseInt);
}
