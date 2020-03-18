package com.blog.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.entity.Blogger;
import com.blog.entity.PageBean;
import com.blog.lucene.BlogIndex;
import com.blog.service.BloggerService;
import com.blog.util.DateJsonValueProcessor;
import com.blog.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
/**
 * 博客信息管理
 *
 */
@Controller
@RequestMapping({"/admin/user"})
public class UserAdminController {
	@Resource
	private BloggerService bloggerService;
	private BlogIndex blogIndex = new BlogIndex();
	
	
	/**
	 * 查询用户信息列表
	 */
	@RequestMapping({"/list"})
	public String list(@RequestParam(value="page",required=false)String page,
			@RequestParam(value="rows",required=false)String rows,Blogger blogger,
			HttpServletResponse response) throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", pageBean.getStart());
		map.put("size",pageBean.getPageSize());
		//分页查询博客信息列表
		List<Blogger> list = bloggerService.list();
		//获取共有多少条博客信息
		Long total = (long) list.size();
		
		//封装到json
		JSONObject result = new JSONObject();
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(list,config);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 根据主键查询一条用户信息
	 */
	@RequestMapping({"findById"})
	public String findById(@RequestParam("id")String id,HttpServletResponse response) throws Exception {
		//Blog blog = blogService.findById(Integer.parseInt(id));
		//JSONObject jsonObject = JSONObject.fromObject(blog);
		//ResponseUtil.write(response, jsonObject);
		return null;
	}
	
	/**
	 * 删除用户信息
	 */
	@RequestMapping({"delete"})
	public String delete(@RequestParam("ids")String ids,HttpServletResponse response) throws Exception {
		String[] idsStr = ids.split(",");
		for(int i = 0;i<idsStr.length;i++) {
			bloggerService.delete(Integer.parseInt(idsStr[i]));
			blogIndex.deleteIndex(idsStr[i]);
		}
		JSONObject result = new JSONObject();
		result.put("success", Boolean.valueOf(true));
		ResponseUtil.write(response, result);
		return null;
	}
}
