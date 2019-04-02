package com.fh.service.manage.seat.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;
import com.fh.service.manage.seat.SeatManager;

/** 
 * 说明： 座位信息
 * 创建人：FH Q313596790
 * 创建时间：2019-03-23
 * @version
 */
@Service("seatService")
public class SeatService implements SeatManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		String SEAT_ROW = pd.getString("SEAT_ROW");
		String SEAT_COLUMN = pd.getString("SEAT_COLUMN");
		int row_int = Integer.parseInt(SEAT_ROW);
		int column_int = Integer.parseInt(SEAT_COLUMN);
		PageData pd1 = new PageData();
		for(int i = 1;i<=row_int;i++){
			for(int j=1;j<=column_int;j++){
				pd1.put("SEAT_ROW", String.valueOf(i));
				pd1.put("SEAT_COLUMN", String.valueOf(j));
				pd1.put("SEAT_ID", UuidUtil.get32UUID());
				pd1.put("CLASSROOM_ID", pd.getString("CLASSROOM_ID"));
				dao.save("SeatMapper.save", pd1);
			}
		}
		
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("SeatMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("SeatMapper.edit", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void editByParams(PageData pd)throws Exception{
		dao.update("SeatMapper.editByParams", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SeatMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SeatMapper.listAll", pd);
	}
	
	/**根据classroomid与status查询是否还有座位
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listByClassroomAndStatus(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SeatMapper.listByClassroomAndStatus", pd);
	}
	
	@SuppressWarnings("unchecked")
	public List<PageData> listByClassroomId(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SeatMapper.listByClassroomId", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SeatMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("SeatMapper.deleteAll", ArrayDATA_IDS);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> listByParams(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("SeatMapper.listByParams", pd);
	}

	@Override
	public PageData findByStuIdAndTimeduring(PageData pd) throws Exception {
		return (PageData)dao.findForObject("SeatMapper.findByStuIdAndTimeduring", pd);
	}

	
}

