package com.fh.controller.information.featured;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.Menu;
import com.fh.service.information.featured.FeaturedService;
import com.fh.util.DateUtil;
import com.fh.util.PageData;

/** 
 * 类名称：FeaturedController
 * 创建人：FH 
 * 创建时间：2014年12月1日
 * @version
 */
@Controller
@RequestMapping(value="/featured")
public class FeaturedController extends BaseController{
	
	@Resource(name="featuredService")
	private FeaturedService featuredService;
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView listUsers(HttpSession session, Page page) throws Exception{
		logBefore(logger, "特别推荐列表");
		mv.clear();
		try{
			pd = this.getPageData();
			
			//检索条件================================
			String title = pd.getString("title");
			if(null != title && !"".equals(title)){
				title = title.trim();
				pd.put("title", title);
			}
			//检索条件================================
			
			
			page.setPd(pd);
			List<PageData>	varList = featuredService.list(page);
			
			/*调用权限*/
			this.getHC(); //================================================================================
			/*调用权限*/
			
			mv.setViewName("information/featured/featured_list");
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
			mv.setViewName("information/featured/featured_edit");
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
			
			pd = featuredService.findById(pd);
			
			mv.setViewName("information/featured/featured_edit");
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
		
		
		String sequence = pd.getString("sequence");
		
		pd.put("uptime", DateUtil.getTime());				//修改时间
		pd.put("sequence", "".equals(sequence)?0:sequence);
		
		featuredService.edit(pd);
		
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
		
		
		String sequence = pd.getString("sequence");
		
		pd.put("addtime", DateUtil.getTime());				//新增时间
		pd.put("uptime", DateUtil.getTime());				//修改时间
		pd.put("sequence", "".equals(sequence)?0:sequence);
		
		featuredService.save(pd);
		
		
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
			featuredService.delete(pd);
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
