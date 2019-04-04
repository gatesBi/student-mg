package com.fh.service.manage.studentlist.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.manage.studentlist.StudentListManager;

/** 
 * 说明： 学生子表
 * 创建人：FH Q313596790
 * 创建时间：2019-03-28
 * @version
 */
@Service("studentlistService")
public class StudentListService implements StudentListManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("StudentListMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("StudentListMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("StudentListMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("StudentListMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("StudentListMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("StudentListMapper.findById", pd);
	}
	
	/**通过headId获取数据
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findByHeadId(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("StudentListMapper.findByHeadId", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("StudentListMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public void deleteById(PageData pd) throws Exception {
		dao.delete("StudentListMapper.deleteById", pd);
		PageData findById = this.findById(pd);
		if(findById != null && findById.getString("HEAD_ID") != null){
			String headid = findById.getString("HEAD_ID");
			PageData pd1 = new PageData();
			pd1.put("STU_ID", headid);
			pd1.put("TIMEDURING", pd.getString("TIMEDURING"));
			dao.delete("SeatListMapper.deleteByStuIdAndTimeDuring", pd1);
		}
	}
	
}

