package com.fh.controller.manage.student;

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
import com.alibaba.fastjson.JSONObject;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
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
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Tools;

/** 
 * 说明：student
 * 创建人：FH Q313596790
 * 创建时间：2019-03-23
 */
@Controller
@RequestMapping(value="/student")
public class StudentController extends BaseController {
	
	String menuUrl = "student/list.do"; //菜单地址(权限用)
	@Resource(name="studentService")
	private StudentManager studentService;
	@Resource(name="gradeService")
	private GradeManager gradeService;
	@Resource(name="schoolService")
	private SchoolManager schoolService;
	@Resource(name="seatService")
	private SeatManager seatService;
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
		logBefore(logger, Jurisdiction.getUsername()+"新增Student");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STUDENT_ID", this.get32UUID());	//主键
		pd.put("HEAD_ID", pd.getString("STUDENT_ID"));
		pd.put("CREATE_TIME", DateUtil.getTime());	
		pd.put("UPDATE_TIME", DateUtil.getTime());
		pd.put("STATUS", "0");
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		studentService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Student");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STATUS", "1");
		studentService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Student");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		pd.put("HEAD_ID", pd.getString("STUDENT_ID"));
		pd.put("UPDATE_TIME", DateUtil.getTime());
		studentService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Student");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String lastStart = pd.getString("lastStart"); //开始时间
		String lastEnd = pd.getString("lastEnd"); //结束时间
		if (Tools.notEmpty(lastStart))
		{
			pd.put("lastStart", lastStart + " 00:00:00");
		}
		if (Tools.notEmpty(lastEnd))
		{
			pd.put("lastEnd", lastEnd + " 23:59:59");
		}
		page.setPd(pd);
		List<PageData>	varList = studentService.list(page);	//列出Student列表
		mv.setViewName("manage/student/student_list");
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
		pd = this.getPageData();
		pd.put("SCHOOL_ID", user.getSCHOOL_ID());
		List<PageData> gradeList = gradeService.listAll(pd);
		List<PageData> teatherlist = teatherService.listAll(pd);
		List<PageData> subjectlist = subjectService.listAll(pd);
		List<PageData> timeduringlist = timeduringService.listAll(pd);
		mv.setViewName("manage/student/student_edit");
		JSONArray jSONArray = new JSONArray();
		pd.put("childList", jSONArray);
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		mv.addObject("gradeList", gradeList);
		mv.addObject("teatherlist", teatherlist);
		mv.addObject("subjectlist", subjectlist);
		mv.addObject("timeduringlist", timeduringlist);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = studentService.findById(pd);	//根据ID读取
		List<PageData> gradeList = gradeService.listAll(pd);
		
		
		PageData listpd = new PageData();
		listpd.put("HEAD_ID", pd.getString("STUDENT_ID"));
		List<PageData> childList = studentlistService.findByHeadId(listpd);
		JSONArray jSONArray = new JSONArray();
		for(PageData pd1:childList){
			JSONObject object = new JSONObject();
			object.put("GRADE", pd1.getString("GRADE"));
			object.put("SUBJECT", pd1.getString("SUBJECT"));
			object.put("TIMEDURING", pd1.getString("TIMEDURING"));
			object.put("TEATHER", pd1.getString("TEATHER_NAME"));
			object.put("STUDENTLIST_ID", pd1.getString("STUDENTLIST_ID"));
			jSONArray.add(object);
		}
		//String jSONArrayString = jSONArray.toJSONString();
		mv.setViewName("manage/student/student_edit");
		mv.addObject("msg", "edit");
		pd.put("childList", jSONArray);
		mv.addObject("pd", pd);
		mv.addObject("gradeList", gradeList);
		//mv.addObject("childList", jSONArray);
		return mv;
	}	
	
	/**联动
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/getParams")
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
		
		List<String> subjectPdList = new ArrayList<String>();
		List<String> teatherPdList = new ArrayList<String>();
		List<String> timeDuringPdList = new ArrayList<String>();
		
		
		
		List<PageData> subjectlist = new ArrayList<>();
		List<PageData> teatherlist = new ArrayList<>();
		List<PageData> timeDuringlist = new ArrayList<>();
		if(pdList.size()>0){
			for(PageData p : pdList){
				subjectPdList.add(p.getString("SUBJECT"));
				teatherPdList.add(p.getString("TEATHER_NAME"));
				timeDuringPdList.add(p.getString("TIMEDURING"));
			}
			subjectlist = subjectService.listBySubject(subjectPdList);
			teatherlist = teatherService.listByTeatherName(teatherPdList);
			timeDuringlist = timeduringService.listByTimeDuring(timeDuringPdList);
		}
		map.put("subjectlist", subjectlist);
		map.put("teatherlist", teatherlist);
		map.put("timeDuringlist", timeDuringlist);
		return map;
	}
	
	
	
	@RequestMapping(value="/checkIfHasSeat")
	@ResponseBody
	public HashMap checkIfHasSeat(@RequestBody HashMap<String,Object> map) throws Exception{
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
		List<PageData> pd1 = seatService.listByClassroomId(pdSeat);
		boolean flag = false;
		if(pd1 != null && pd1.size()>0){
			for(PageData pd2:pd1){
				pd2.put("HEAD_ID", pd2.getString("SEAT_ID"));
				pd2.put("TIMEDURING", pd.getString("TIMEDURING"));
				PageData pd3 = seatlistService.findByHeadIdAndTimeduring(pd2);
				if(pd3 == null){
					flag = true;
					break;
				}
			}
		}
		if(flag){
			map.put("hasSeat", "Y");
		}else{
			map.put("hasSeat", "N");
		}
		return map;
	}
	
	@RequestMapping(value="/searchMsg")
	@ResponseBody
	public HashMap searchMsg(@RequestBody HashMap<String,Object> map) throws Exception{
		PageData pd = new PageData();
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		String schoolId = user.getSCHOOL_ID();
		HashMap map1 = new HashMap<>();
		pd = this.getPageData();
		pd.put("NAME", (String)map.get("studentName"));
		PageData studentPd = studentService.findByName(pd);
		studentPd.put("HEAD_ID", studentPd.getString("STUDENT_ID"));
		List<PageData> listPd = studentlistService.findByHeadId(studentPd);
		JSONArray jSONArray = new JSONArray();
		for(PageData pd1:listPd){
			JSONObject object = new JSONObject();
			String timeDuring = pd1.getString("TIMEDURING");
			String grade = pd1.getString("GRADE");
			String subject = pd1.getString("SUBJECT");
			String teatherName = pd1.getString("TEATHER_NAME");
			PageData pd2 = new PageData();
			pd2.put("TIMEDURING", timeDuring);
			pd2.put("STU_ID", studentPd.getString("HEAD_ID"));
			pd2 = seatlistService.findByStuIdAndTimeduring(pd2);
			if(null!=pd2){
				continue;
			}
			object.put("TIMEDURING", timeDuring);
			object.put("GRADE", grade);
			object.put("SUBJECT", subject);
			object.put("TEATHER_NAME", teatherName);
			object.put("STUDENT_ID", studentPd.getString("HEAD_ID"));
			
			PageData schedulePd = new PageData();
			schedulePd.put("TIMEDURING", timeDuring);
			schedulePd.put("GRADE", grade);
			schedulePd.put("SUBJECT", subject);
			schedulePd.put("TEATHER_NAME", teatherName);
			schedulePd.put("SCHOOL_ID", schoolId);
			
			List<PageData> scheduleList = scheduleService.listByParam(schedulePd);
			PageData schedulePd1 = scheduleList.get(0);
			schedulePd1.put("NAME", schedulePd1.getString("CLASSROOM"));
			PageData classroomPd = classroomService.findBySchoolAndName(schedulePd1);
			object.put("CLASSROOM_ID", classroomPd.getString("CLASSROOM_ID"));
			classroomPd.put("TIMEDURING", timeDuring);
			List<PageData> seatList = seatService.listByClassroomId(classroomPd);
			JSONArray jSONArray1 = new JSONArray();
			for(PageData pd3:seatList){
				pd3.put("HEAD_ID", pd3.getString("SEAT_ID"));
				pd3.put("TIMEDURING", timeDuring);
				PageData pd4 = seatlistService.findByHeadIdAndTimeduring(pd3);
				if(pd4==null){
					jSONArray1.add(pd3.getString("SEAT_ROW")+"-"+pd3.getString("SEAT_COLUMN"));
				}
			}
			object.put("seatlist", jSONArray1);
			jSONArray.add(object);
		}
		map1.put("seatResult", jSONArray);
		return map1;
	}
	
	
	
	/**删除studentlist
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteStudentList")
	@ResponseBody
	public HashMap deleteStudentList(@RequestBody HashMap<String,Object> map) throws Exception{
		PageData pd = new PageData();
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
		pd = this.getPageData();
		pd.put("STUDENTLIST_ID", (String)map.get("STUDENTLIST_ID"));
		pd.put("TIMEDURING", (String)map.get("TIMEDURING"));
		studentlistService.deleteById(pd);
		return map;
	}
	
	
	
	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Student");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			studentService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**选座
	 * @param
	 * @throws Exception
	 */
	/*@RequestMapping(value="/chooseSeat")
	public ModelAndView chooseSeat()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"选座位");
		PageData pd = new PageData();
		List<PageData> seatList = seatService.listAll(pd);
		List<String> list = new LinkedList<String>();
		List<String> disableList = new LinkedList<String>();
		for(PageData pd1:seatList){
			list.add(pd1.getString("CODE"));
			if(pd1.getString("STATUS").equals("1")){
				StringBuilder sb = new StringBuilder();
				sb.append("'").append(pd1.getString("CODE")).append("'");
				disableList.add(sb.toString());
			}
		}
		List<Integer> listcolumn = new LinkedList<Integer>();
		List<Integer> listrow = new LinkedList<Integer>();
		for(String s:list){
			String[] split = s.split("_");
			listrow.add(Integer.parseInt(split[0]));
			listcolumn.add(Integer.parseInt(split[1]));
		}
		Collections.sort(listcolumn);
		Collections.sort(listrow);
		List<String> list1 = new LinkedList<String>();
		for(int i = 0;i<listrow.get(listrow.size()-1);i++){
			StringBuilder sb = new StringBuilder();
			sb.append("'");
			for(int j = 0;j<listcolumn.get(listcolumn.size()-1);j++){
				sb.append("c");
			}
			sb.append("'");
			list1.add(sb.toString());
		}
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("manage/student/chooseseat/index");
		mv.addObject("seatList", seatList);
		mv.addObject("list1", list1);
		mv.addObject("disableList", disableList);
		return mv;
	}	*/
	
	/**通过科目选择老师，二级联动
	 * @param
	 * @throws Exception
	 */
	/*@RequestMapping(value="/getTeather")
	@ResponseBody
	public String getTeather(){
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> subjectList = studentService.getTeatherBySubject(pd);
		return null;
	}*/
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Student到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("学号");	//1
		titles.add("姓名");	//2
		titles.add("年龄");	//3
		titles.add("性别");	//4
		titles.add("住址");	//5
		titles.add("电话");	//6
		titles.add("年级id");	//7
		titles.add("科目时间段");	//8
		titles.add("学校id");	//9
		titles.add("座位号");	//10
		titles.add("是否缴费");	//11
		titles.add("缴费金额");	//12
		titles.add("创建时间");	//13
		titles.add("更新时间");	//14
		titles.add("状态");	//15
		dataMap.put("titles", titles);
		List<PageData> varOList = studentService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("CODE"));	    //1
			vpd.put("var2", varOList.get(i).getString("NAME"));	    //2
			vpd.put("var3", varOList.get(i).getString("AGE"));	    //3
			vpd.put("var4", varOList.get(i).getString("GENDER"));	    //4
			vpd.put("var5", varOList.get(i).getString("ADDRESS"));	    //5
			vpd.put("var6", varOList.get(i).getString("PHONE"));	    //6
			vpd.put("var7", varOList.get(i).getString("GRADE_ID"));	    //7
			vpd.put("var8", varOList.get(i).getString("SUBJECT_TIME_PERIOD"));	    //8
			vpd.put("var9", varOList.get(i).getString("SCHOOL_ID"));	    //9
			vpd.put("var10", varOList.get(i).getString("SEAT_ID"));	    //10
			vpd.put("var11", varOList.get(i).getString("IS_PAY"));	    //11
			vpd.put("var12", varOList.get(i).getString("PAYMENT_AMOUNT"));	    //12
			vpd.put("var13", varOList.get(i).getString("CREATE_TIME"));	    //13
			vpd.put("var14", varOList.get(i).getString("UPDATE_TIME"));	    //14
			vpd.put("var15", varOList.get(i).getString("STATUS"));	    //15
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
