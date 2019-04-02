package com.fh.service.manage.seat;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 座位信息接口
 * 创建人：FH Q313596790
 * 创建时间：2019-03-23
 * @version
 */
public interface SeatManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**通过参数修改
	 * @param pd
	 * @throws Exception
	 */
	public void editByParams(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	public List<PageData> listByClassroomAndStatus(PageData pd)throws Exception;
	
	public List<PageData> listByClassroomId(PageData pd)throws Exception;
	
	/**
	 * 用这个来查询数据,通用
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listByParams(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	/**通过时间段与stuid来查询座位是否已经被选择
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByStuIdAndTimeduring(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	
}

