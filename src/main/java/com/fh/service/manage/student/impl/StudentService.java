package com.fh.service.manage.student.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;
import com.fh.service.manage.student.StudentManager;

/** 
 * 说明： student
 * 创建人：FH Q313596790
 * 创建时间：2019-03-23
 * @version
 */
@Service("studentService")
public class StudentService implements StudentManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("StudentMapper.save", pd);
		String teaandsubinfo = pd.getString("TEAANDSUBINFO");
		String keyinfo = pd.getString("KEYINFO");
		if(teaandsubinfo != null && keyinfo != null && teaandsubinfo != "" && keyinfo != ""){
			JSONArray jSONArray = new JSONArray();
			jSONArray = JSONArray.parseArray(teaandsubinfo);
			JSONArray jSONKeyArray = new JSONArray();
			jSONKeyArray = JSONArray.parseArray(keyinfo);
			for(int i = 0 ;i<jSONArray.size();i++){
				JSONObject object = (JSONObject) jSONArray.get(i);
				JSONObject object2 = (JSONObject) object.get(jSONKeyArray.get(i));
				String TEATHER_ID = object2.getString("TEATHER_ID");
				String SUBJECT_ID = object2.getString("SUBJECT_ID");
				pd.put("STU_ID", pd.getString("STUDENT_ID"));
				pd.put("SUB_ID", SUBJECT_ID);
				pd.put("STUDENTSUBJECTASSOCIATE_ID", UuidUtil.get32UUID());
				dao.save("StudentSubjectAssociateMapper.save", pd);
				
				pd.put("T_ID", TEATHER_ID);
				pd.put("S_ID", pd.getString("STUDENT_ID"));
				pd.put("TEATHERSTUDENTASSOCIATE_ID", UuidUtil.get32UUID());
				dao.save("TeatherStudentAssociateMapper.save", pd);
			}
		}
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("StudentMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("StudentMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("StudentMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("StudentMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("StudentMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("StudentMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

