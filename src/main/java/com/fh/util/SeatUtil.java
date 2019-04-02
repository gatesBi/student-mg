package com.fh.util;

import java.util.ArrayList;
import java.util.List;

public class SeatUtil {
    public static List<String> getSeatList(List<PageData> pageDatas) {
        ArrayList<String> list = new ArrayList<>();

        int currentRow;
        int currentColumn;

        char[][] seats = getInitSeats(pageDatas);

        for (PageData pageData : pageDatas) {
            currentRow = s2i(pageData.getString("SEAT_ROW"));
            currentColumn = s2i(pageData.getString("SEAT_COLUMN"));
            seats[currentRow-1][currentColumn-1] = 'c';
        }

        for (char[] seat : seats) {
            list.add("'" + String.valueOf(seat) + "'");
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

    private static char[][] getInitSeats(List<PageData> pageDatas) {
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

        char[][] seats = new char[maxRow][maxColumn];

        for (int i = 0; i < maxRow; i++) {
            for (int j = 0; j < maxColumn; j++) {
                seats[i][j] = '_';
            }
        }

        return seats;
    }

    private static int s2i(String s) {
        return Integer.parseInt(s);
    }

}