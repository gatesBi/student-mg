package com.fh.controller.manage.schedule;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.manage.classroom.ClassroomManager;
import com.fh.service.manage.grade.GradeManager;
import com.fh.service.manage.schedule.ScheduleManager;
import com.fh.service.manage.subject.SubjectManager;
import com.fh.service.manage.teather.TeatherManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

/** 
 * 说明：课程表
 * 创建人：FH Q313596790
 * 创建时间：2019-03-27
 */
@Controller
@RequestMapping(value="/schedule")
public class ScheduleController extends BaseController {
	
	String menuUrl = "schedule/list.do"; //菜单地址(权限用)
	@Resource(name="scheduleService")
	private ScheduleManager scheduleService;
	@Resource(name="subjectService")
	private SubjectManager subjectService;
	@Resource(name="gradeService")
	private GradeManager gradeService;
	@Resource(name="teatherService")
	private TeatherManager teatherService;
	@Resource(name="classroomService")
	private ClassroomManager classroomService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Schedule");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SCHEDULE_ID", this.get32UUID());	//主键
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		pd.put("STATUS", "0");
		pd.put("TEATHER_ID", this.get32UUID());
		pd.put("NAME", pd.getString("TEATHER_NAME"));
		
		pd.put("SCHOOLTEATHERASSOCIATE_ID", this.get32UUID());	//主键
		pd.put("T_ID", pd.getString("TEATHER_ID"));
		pd.put("S_ID", user.getSCHOOL_ID());
		
		
		scheduleService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Schedule");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		scheduleService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Schedule");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		scheduleService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Schedule");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		page.setPd(pd);
		List<PageData>	varList = scheduleService.list(page);	//列出Schedule列表
		mv.setViewName("manage/schedule/schedule_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		PageData pd = new PageData();
		List<PageData> subjectList = subjectService.listAll(pd);
		List<PageData> gradeList = gradeService.listAll(pd);
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		List<PageData> classroomList = classroomService.listAll(pd);
		pd = this.getPageData();
		mv.setViewName("manage/schedule/schedule_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		mv.addObject("subjectList", subjectList);
		mv.addObject("gradeList", gradeList);
		mv.addObject("classroomList", classroomList);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		PageData pd = new PageData();
		List<PageData> subjectList = subjectService.listAll(pd);
		List<PageData> gradeList = gradeService.listAll(pd);
		pd = this.getPageData();
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		List<PageData> classroomList = classroomService.listAll(pd);
		pd = scheduleService.findById(pd);	//根据ID读取
		mv.setViewName("manage/schedule/schedule_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("subjectList", subjectList);
		mv.addObject("gradeList", gradeList);
		mv.addObject("classroomList", classroomList);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Schedule");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			scheduleService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Schedule到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("时间段");	//1
		titles.add("年级");	//2
		titles.add("学科");	//3
		titles.add("老师姓名");	//4
		dataMap.put("titles", titles);
		List<PageData> varOList = scheduleService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TIMEDURING"));	    //1
			vpd.put("var2", varOList.get(i).getString("GRADE"));	    //2
			vpd.put("var3", varOList.get(i).getString("SUBJECT"));	    //3
			vpd.put("var4", varOList.get(i).getString("TEATHER_NAME"));	    //4
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
