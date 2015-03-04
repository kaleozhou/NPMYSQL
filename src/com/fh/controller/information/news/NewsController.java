package com.fh.controller.information.news;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.Menu;
import com.fh.entity.system.Role;
import com.fh.service.information.news.NewsService;
import com.fh.util.DateUtil;
import com.fh.util.MD5;
import com.fh.util.PageData;

/** 
 * 类名称：NewsController
 * 创建人：FH 
 * 创建时间：2014年12月1日
 * @version
 */
@Controller
@RequestMapping(value="/news")
public class NewsController extends BaseController{
	
	
	@Resource(name="newsService")
	private NewsService newsService;
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView listUsers(HttpSession session, Page page) throws Exception{
		logBefore(logger, "新闻列表");
		mv.clear();
		try{
			pd = this.getPageData();
			
			//检索条件================================
			String title = pd.getString("title");
			String publisher = pd.getString("publisher");
			if(null != title && !"".equals(title)){
				title = title.trim();
				pd.put("title", title);
			}
			if(null != publisher && !"".equals(publisher)){
				publisher = publisher.trim();
				pd.put("publisher", publisher);
			}
			//检索条件================================
			
			
			page.setPd(pd);
			List<PageData>	varList = newsService.list(page);
			
			/*调用权限*/
			this.getHC(); //================================================================================
			/*调用权限*/
			
			mv.setViewName("information/news/news_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return mv;
	}
	
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		mv.clear();
		pd = this.getPageData();
		try {
			mv.setViewName("information/news/news_edit");
			mv.addObject("msg", "save");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		mv.clear();
		pd = this.getPageData();
		try {
			
			pd = newsService.findById(pd);
			
			mv.setViewName("information/news/news_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(PrintWriter out) throws Exception{
		mv.clear();
		pd = this.getPageData();
		
		//获取IP
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		
		String sequence = pd.getString("sequence");
		
		pd.put("pip", ip);	
		pd.put("uptime", DateUtil.getTime());				//修改时间
		pd.put("sequence", "".equals(sequence)?0:sequence);
		
		newsService.edit(pd);
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(PrintWriter out) throws Exception{
		mv.clear();
		pd = this.getPageData();
		
		//获取IP
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		
		String sequence = pd.getString("sequence");
		
		pd.put("pip", ip);	
		pd.put("addtime", DateUtil.getTime());				//新增时间
		pd.put("uptime", DateUtil.getTime());				//修改时间
		pd.put("hits", 0);									//点击数
		pd.put("sequence", "".equals(sequence)?0:sequence);
		
		newsService.save(pd);
		
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out)throws Exception{
		mv.clear();
		try{
			pd = this.getPageData();
			newsService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	
	/* ===============================权限================================== */
	public void getHC(){
		HttpSession session = this.getRequest().getSession();
		Map<String, Integer> map = (Map<String, Integer>)session.getAttribute("QX");
		mv.addObject("QX",map);	//按钮权限
		
		List<Menu> menuList = (List)session.getAttribute("menuList");
		mv.addObject("menuList", menuList);//菜单权限
	}
	/* ===============================权限================================== */
}
