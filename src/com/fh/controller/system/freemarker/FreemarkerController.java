package com.fh.controller.system.freemarker;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.util.Const;
import com.fh.util.DelAllFile;
import com.fh.util.FileDownload;
import com.fh.util.FileZip;
import com.fh.util.PathUtil;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/** 
 * 类名称：FreemarkerController
 * 创建人：FH 
 * 创建时间：2015年1月12日
 * @version
 */
@Controller
@RequestMapping(value="/freemarker")
public class FreemarkerController extends BaseController {
	
	
	/**
	 * 生成代码
	 */
	@RequestMapping(value="/proCode")
	public void proCode(HttpServletResponse response) throws Exception{
		
		pd = this.getPageData();
		
		/* ============================================================================================= */
		String packageName = pd.getString("packageName");  			//包名				========1
		String objectName = pd.getString("objectName");	   			//类名				========2
		String zindext = pd.getString("zindex");	   	   			//属性总数
		int zindex = 0;
		if(null != zindext && !"".equals(zindext)){
			zindex = Integer.parseInt(zindext);
		}
		List<String[]> fieldList = new ArrayList<String[]>();   	//属性集合			========3
		for(int i=0; i< zindex; i++){
			fieldList.add(pd.getString("field"+i).split(",fh,"));	//属性放到集合里面
		}
		
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		root.put("fieldList", fieldList);
		root.put("packageName", packageName);						//报名
		root.put("objectName", objectName);							//类名
		root.put("objectNameLower", objectName.toLowerCase());		//类名(全小写)
		root.put("objectNameUpper", objectName.toUpperCase());		//类名(全大写)
		root.put("nowDate", new Date());							//当前日期
		
		DelAllFile.delFolder(PathUtil.getClasspath()+"admin00/ftl/code"); //生成代码前,先清空之前生成的代码
		/* ============================================================================================= */
		
		/*生成controller*/
		this.printFile("controllerTemplate.ftl", root, "controller/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName+"Controller.java");
		
		/*生成service*/
		this.printFile("serviceTemplate.ftl", root, "service/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName+"Service.java");

		/*生成mybatis xml*/
		this.printFile("mapperMysqlTemplate.ftl", root, "mybatis_mysql/"+packageName+"/"+objectName+"Mapper.xml");
		this.printFile("mapperOracleTemplate.ftl", root, "mybatis_oracle/"+packageName+"/"+objectName+"Mapper.xml");
		
		/*生成SQL脚本*/
		this.printFile("mysql_SQL_Template.ftl", root, "mysql数据库脚本/TB_"+objectName.toUpperCase()+".sql");
		this.printFile("oracle_SQL_Template.ftl", root, "oracle数据库脚本/TB_"+objectName.toUpperCase()+".sql");
		
		/*生成jsp页面*/
		this.printFile("jsp_list_Template.ftl", root, "jsp/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName.toLowerCase()+"_list.jsp");
		this.printFile("jsp_edit_Template.ftl", root, "jsp/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName.toLowerCase()+"_edit.jsp");
		
		/*生成说明文档*/
		this.printFile("docTemplate.ftl", root, "说明.doc");
		
		//this.print("oracle_SQL_Template.ftl", root);  控制台打印
		
		/*生成的全部代码压缩成zip文件*/
		FileZip.zip(PathUtil.getClasspath()+"admin00/ftl/code", PathUtil.getClasspath()+"admin00/ftl/code.zip");
		
		/*下载代码*/
		FileDownload.fileDownload(response, PathUtil.getClasspath()+"admin00/ftl/code.zip", "code.zip");
		
	}
	
	/**
	 * 打印到控制台(测试用)
	 *  @param ftlName
	 */
	public void print(String ftlName, Map<String,Object> root) throws Exception{
		try {
			Template temp = this.getTemplate(ftlName);		//通过Template可以将模板文件输出到相应的流
			temp.process(root, new PrintWriter(System.out));
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 输出到输出到文件
	 * @param ftlName   ftl文件名
	 * @param root		传入的map
	 * @param outFile	输出后的文件全部路径
	 */
	public void printFile(String ftlName, Map<String,Object> root, String outFile) throws Exception{
		try {
			File file = new File(PathUtil.getClasspath()+"admin00/ftl/code/"+outFile);
			if(!file.getParentFile().exists()){				//判断有没有父路径，就是判断文件整个路径是否存在
				file.getParentFile().mkdirs();				//不存在就全部创建
			}
			FileWriter out = new FileWriter(file);
			Template template = this.getTemplate(ftlName);
			template.process(root, out);					//模版输出
			out.flush();
			out.close();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过文件名加载模版
	 * @param ftlName
	 */
	public Template getTemplate(String ftlName) throws Exception{
		try {
			Configuration cfg = new Configuration();  												//通过Freemaker的Configuration读取相应的ftl
			cfg.setEncoding(Locale.CHINA, "utf-8");
			cfg.setDirectoryForTemplateLoading(new File(PathUtil.getClassResources()+"/ftl"));		//设定去哪里读取相应的ftl模板文件
			Template temp = cfg.getTemplate(ftlName);												//在模板文件目录中找到名称为name的文件
			return temp;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
