package com.fh.service;

import com.fh.service.manage.seat.SeatManager;
import com.fh.util.PageData;
import com.fh.util.SeatUtil;
import jdk.nashorn.internal.ir.IdentNode;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/ApplicationContext*.xml")
public class SeatTest {
    @Resource(name="seatService")
    private SeatManager seatService;

    /**
    * 获取所有座位信息
    */
    @Test
    public void testListAll() throws Exception {
        PageData pd = new PageData();
        List<PageData> pageDatas = seatService.listAll(pd);
        List<String> list = SeatUtil.getSeatList(pageDatas);
        List<String> disableList = SeatUtil.getDisableSeatList(pageDatas);
        System.out.println(list);
        System.out.println(disableList);

    }

}
