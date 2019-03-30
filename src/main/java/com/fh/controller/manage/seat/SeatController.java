package com.fh.controller.manage.seat;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.fh.util.*;
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
import com.fh.service.manage.seat.SeatManager;

/** 
 * 说明：座位信息
 * 创建人：FH Q313596790
 * 创建时间：2019-03-23
 */
@Controller
@RequestMapping(value="/seat")
public class SeatController extends BaseController {
	
	String menuUrl = "seat/list.do"; //菜单地址(权限用)
	@Resource(name="seatService")
	private SeatManager seatService;
	@Resource(name="classroomService")
	private ClassroomManager classroomService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Seat");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SEAT_ID", this.get32UUID());	//主键
		seatService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Seat");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		seatService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Seat");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		seatService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Seat");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		page.setPd(pd);
		List<PageData>	varList = seatService.list(page);	//列出Seat列表
		List<PageData> classroomList = classroomService.listAll(pd);
		mv.setViewName("manage/seat/seat_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("classroomList", classroomList);
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
		pd = this.getPageData();
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		List<PageData> classroomList = classroomService.listAll(pd);
		mv.setViewName("manage/seat/seat_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
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
		pd = this.getPageData();
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		List<PageData> classroomList = classroomService.listAll(pd);
		pd = seatService.findById(pd);	//根据ID读取
		mv.setViewName("manage/seat/seat_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Seat");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			seatService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Seat到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("座位名");	//1
		titles.add("座位编码");	//2
		titles.add("班级id");	//3
		dataMap.put("titles", titles);
		List<PageData> varOList = seatService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("CODE"));	    //2
			vpd.put("var3", varOList.get(i).getString("CLASS_ID"));	    //3
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}

	/**选座
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/chooseSeat")
	public ModelAndView chooseSeat(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Seat");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);

		PageData pd = this.getPageData();

        List<PageData>	pageDatas = seatService.listAll(pd);	//列出Seat列表
		List<String> seatList = SeatUtil.getSeatList(pageDatas);
		List<String> disableSeatList = SeatUtil.getDisableSeatList(pageDatas);

		ModelAndView mv = this.getModelAndView();

		mv.addObject("list1", seatList);
		mv.addObject("disableList", disableSeatList);
		mv.setViewName("manage/student/chooseseat/index");


		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
