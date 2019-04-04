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

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.SeatUtil;
import com.fh.util.Tools;
import com.fh.service.manage.classroom.ClassroomManager;
import com.fh.service.manage.grade.GradeManager;
import com.fh.service.manage.schedule.ScheduleManager;
import com.fh.service.manage.school.SchoolManager;
import com.fh.service.manage.seat.SeatManager;
import com.fh.service.manage.seatlist.SeatListManager;
import com.fh.service.manage.student.StudentManager;
import com.fh.service.manage.studentlist.StudentListManager;
import com.fh.service.manage.subject.SubjectManager;
import com.fh.service.manage.teather.TeatherManager;
import com.fh.service.manage.timeduring.TimeDuringManager;

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
	@Resource(name="studentService")
	private StudentManager studentService;
	@Resource(name="gradeService")
	private GradeManager gradeService;
	@Resource(name="schoolService")
	private SchoolManager schoolService;
	@Resource(name="teatherService")
	private TeatherManager teatherService;
	@Resource(name="subjectService")
	private SubjectManager subjectService;
	@Resource(name="scheduleService")
	private ScheduleManager scheduleService;
	@Resource(name="timeduringService")
	private TimeDuringManager timeduringService;
	@Resource(name="studentlistService")
	private StudentListManager studentlistService;
	@Resource(name="classroomService")
	private ClassroomManager classroomService;
	@Resource(name="seatlistService")
	private SeatListManager seatlistService;
	
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
		//pd.put("SEAT_ID", this.get32UUID());	//主键
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
	/*@RequestMapping(value="/chooseSeat")
	public ModelAndView chooseSeat() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Seat");
		ModelAndView mv = this.getModelAndView();
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		List<PageData> gradeList = gradeService.listAll(pd);
		List<PageData> teatherlist = teatherService.listAll(pd);
		List<PageData> subjectlist = subjectService.listAll(pd);
		List<PageData> timeduringlist = timeduringService.listAll(pd);
		mv.setViewName("manage/student/index");
		JSONArray jSONArray = new JSONArray();
		pd.put("childList", jSONArray);
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		mv.addObject("gradeList", gradeList);
		mv.addObject("teatherlist", teatherlist);
		mv.addObject("subjectlist", subjectlist);
		mv.addObject("timeduringlist", timeduringlist);
		List<String> seatList = new ArrayList<String>();
		List<String> disableSeatList = new ArrayList<String>();
		mv.addObject("seatList", seatList);
		mv.addObject("disableList", disableSeatList);
		return mv;
	}*/
	
	@RequestMapping(value="/chooseSeat")
	public ModelAndView chooseSeat() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"选座");
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("manage/seat/seat_choose");
		return mv;
	}
	
	/*@RequestMapping(value="/chooseClassroom")
	@ResponseBody
	public HashMap getParams(@RequestBody HashMap<String,Object> map) throws Exception{
		PageData pd = new PageData();
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		//Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		pd.put("GRADE", (String)map.get("GRADE"));
		pd.put("SUBJECT", (String)map.get("SUBJECT"));
		pd.put("TEATHER", (String)map.get("TEATHER"));
		pd.put("TIMEDURING", (String)map.get("TIMEDURING"));
		List<PageData> pdList = scheduleService.listByParam(pd);
		PageData pdClass = new PageData();
		pdClass.put("NAME", pdList.get(0).getString("CLASSROOM"));
		pdClass.put("SCHOOL_ID", pdList.get(0).getString("SCHOOL_ID"));
		
		pdClass = classroomService.findBySchoolAndName(pdClass);
		String class_id = pdClass.getString("CLASSROOM_ID");
		PageData pdSeat = new PageData();
		pdSeat.put("CLASSROOM_ID", class_id);
		List<PageData> pdSeatList = seatService.listByParams(pdSeat);
		
		List<String> seatList = SeatUtil.getSeatList(pdSeatList);
		List<String> disableSeatList = SeatUtil.getDisableSeatList(pdSeatList);
		map.put("seatList", seatList);
		map.put("disableList", disableSeatList);
		
		return map;
	}*/
	
	@RequestMapping(value="/saveChoose")
	@ResponseBody
	public HashMap saveChoose(@RequestBody HashMap<String,Object> map) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		HashMap<String,String> map1 = new HashMap<>();
		pd.put("CLASSROOM_ID", (String)map.get("classId"));
		pd.put("SEAT_ROW", (String)map.get("row"));
		pd.put("SEAT_COLUMN", (String)map.get("column"));
		List<PageData> listByParams = seatService.listByParams(pd);
		if(listByParams.size()==0){
			map1.put("msg", "error");
			map1.put("result", "输入的座位号不正确,请重新输入");
			return map1;
		}
		PageData pdSeat = listByParams.get(0);
		if(!pdSeat.isEmpty()){
			
			
			PageData pd2 = new PageData();
			pd2.put("TIMEDURING", (String)map.get("timeduring"));
			pd2.put("HEAD_ID", pdSeat.getString("SEAT_ID"));
			pd2 = seatlistService.findByHeadIdAndTimeduring(pd2);
			if(pd2 != null){
				map1.put("msg", "error");
				map1.put("result", "此座位已经被占座，请选择其他座位");
				return map1;
			}
			
			PageData pd1 = new PageData();
			pd1.put("HEAD_ID", pdSeat.getString("SEAT_ID"));
			pd1.put("STU_ID", (String)map.get("studentId"));
			pd1.put("TIMEDURING", (String)map.get("timeduring"));
			pd1.put("SEATLIST_ID", this.get32UUID());
			seatlistService.save(pd1);
		}
		map1.put("msg", "success");
		return map1;
	}
	
	@RequestMapping(value="/initParam")
	@ResponseBody
	public HashMap initParam() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"seat Detail");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		HashMap<String,Object> map = new HashMap<>();
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		List<PageData> gradeList = gradeService.listAll(pd);
		List<PageData> teatherlist = teatherService.listAll(pd);
		List<PageData> subjectlist = subjectService.listAll(pd);
		List<PageData> timeduringlist = timeduringService.listAll(pd);
		map.put("pd", pd);
		map.put("gradeList", gradeList);
		map.put("teatherlist", teatherlist);
		map.put("subjectlist", subjectlist);
		map.put("timeduringlist", timeduringlist);
		return map;
	}
	
	@RequestMapping(value="/goDetail")
	public ModelAndView goDetail() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"seat Detail");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		List<PageData> gradeList = gradeService.listAll(pd);
		List<PageData> teatherlist = teatherService.listAll(pd);
		List<PageData> subjectlist = subjectService.listAll(pd);
		List<PageData> timeduringlist = timeduringService.listAll(pd);
		mv.addObject("pd", pd);
		mv.addObject("gradeList", gradeList);
		mv.addObject("teatherlist", teatherlist);
		mv.addObject("subjectlist", subjectlist);
		mv.addObject("timeduringlist", timeduringlist);
		mv.setViewName("manage/seat/seat_detail");
		return mv;
	}
	
	@RequestMapping(value="/searchSeatMsg")
	@ResponseBody
	public HashMap searchSeatMsg(@RequestBody HashMap<String,Object> map) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		pd.put("GRADE", (String)map.get("GRADE"));
		pd.put("SUBJECT", (String)map.get("SUBJECT"));
		pd.put("TIMEDURING", (String)map.get("TIMEDURING"));
		pd.put("TEATHER_NAME", (String)map.get("TEATHER"));
		List<PageData> listOneClassroomSeat = seatService.listOneClassroomSeat(pd);
		List<List<Map<String,String>>> seatList = SeatUtil.getSeatList(listOneClassroomSeat);
		map.put("seatList", seatList);
		return map;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
