package com.blog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blog.entity.Blogger;

/**
 * 博主
 *
 */
public interface BloggerDao {
	/**根据登录名查询博主对象*/
	public Blogger getByUserName(@Param("userName")String userName);
	
	/**更新博主对象*/
	public Integer update(Blogger blogger);
	
	/**查询博主*/
	public Blogger find();

	public Blogger checkUser(@Param("userName")String userName, @Param("userType")Integer userType);

	public void insertSelective(Blogger blogger);
	
	public List<Blogger> list();

	public void delete(@Param("id")int id);
}
