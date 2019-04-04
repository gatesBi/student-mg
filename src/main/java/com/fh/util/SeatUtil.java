package com.fh.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SeatUtil {
    public static List<List<Map<String,String>>> getSeatList(List<PageData> pageDatas) {
    	List<List<Map<String,String>>> list = new ArrayList<>();

        int currentRow;
        int currentColumn;

        String[][] seats = getInitSeats(pageDatas);

        for (PageData pageData : pageDatas) {
            currentRow = s2i(pageData.getString("SEAT_ROW"));
            currentColumn = s2i(pageData.getString("SEAT_COLUMN"));
            if(pageData.getString("STUDENT_NAME") != null){
            	seats[currentRow-1][currentColumn-1] = pageData.getString("STUDENT_NAME");
            }else{
            	seats[currentRow-1][currentColumn-1] = "O";
            }
        }

        for (int j = 0;j<seats.length;j++) {
        	List<Map<String,String>> list1 = new ArrayList<>();
        	for(int i = 0;i<seats[j].length;i++){
        		Map<String,String> map = new HashMap<>();
        		map.put("value", seats[j][i]);
        		list1.add(map);
        	}
        	list.add(j, list1);
        }
        return list;
    }

    public static List<String> getDisableSeatList(List<PageData> pageDatas) {
        ArrayList<String> list = new ArrayList<>();

        StringBuffer sb = new StringBuffer();

        int currentRow;
        int currentColumn;

        for (PageData pageData : pageDatas) {
            if (pageData.getString("STATUS").equals("1")) {
                currentRow = s2i(pageData.getString("SEAT_ROW"));
                currentColumn = s2i(pageData.getString("SEAT_COLUMN"));
                sb.append("'");
                sb.append(currentRow);
                sb.append("_");
                sb.append(currentColumn);
                sb.append("'");
                list.add(sb.toString());
                sb.delete(0, sb.length());
            }
        }


        return list;
    }

    private static String[][] getInitSeats(List<PageData> pageDatas) {
        ArrayList<String> list = new ArrayList<>();
        int maxRow = 0;
        int maxColumn = 0;

        int currentRow;
        int currentColumn;

        for (PageData pageData : pageDatas) {
            currentRow = s2i(pageData.getString("SEAT_ROW"));
            currentColumn = s2i(pageData.getString("SEAT_COLUMN"));
            if (currentRow > maxRow) {
                maxRow = currentRow;
            }
            if (currentColumn > maxColumn) {
                maxColumn = currentColumn;
            }
        }

        String[][] seats = new String[maxRow][maxColumn];

        for (int i = 0; i < maxRow; i++) {
            for (int j = 0; j < maxColumn; j++) {
                seats[i][j] = "_";
            }
        }

        return seats;
    }

    private static int s2i(String s) {
        return Integer.parseInt(s);
    }

}