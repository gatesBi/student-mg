package com.fh.service.manage.schedule.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.manage.schedule.ScheduleManager;

/** 
 * 说明： 课程表
 * 创建人：FH Q313596790
 * 创建时间：2019-03-27
 * @version
 */
@Service("scheduleService")
public class ScheduleService implements ScheduleManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("ScheduleMapper.save", pd);
		PageData teaPd = (PageData) dao.findForObject("TeatherMapper.findByName", pd);
		if(teaPd == null || teaPd.isEmpty()){
			dao.save("TeatherMapper.save", pd);
			dao.save("SchoolTeatherAssociateMapper.save", pd);
		}
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ScheduleMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("ScheduleMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ScheduleMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ScheduleMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ScheduleMapper.findById", pd);
	}
	
	/**通过筛选条件查询信息
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listByParam(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ScheduleMapper.listByParam", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ScheduleMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

