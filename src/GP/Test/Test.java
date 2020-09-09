package GP.Test;

import java.util.Date;
import java.util.Scanner;
import cn.hutool.*;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateRange;
import cn.hutool.core.date.DateUtil;

public class Test {
    public static void main(String[] args) {
       /* String dateStr = "2017-03-01 22:33:23";
        Date date = DateUtil.parse(dateStr);*/
        Date date = DateUtil.date();

//一天的开始，结果：2017-03-01 00:00:00
        Date beginOfDay = DateUtil.beginOfDay(date);
        Date beginofMonth = DateUtil.beginOfMonth(date);
//一天的结束，结果：2017-03-01 23:59:59
        Date endOfDay = DateUtil.endOfDay(date);
        Date endofMonth = DateUtil.endOfMonth(date);
        System.out.println(beginOfDay+"===="+endOfDay+"\n"+beginofMonth+"\n====="+endofMonth);

        String daystart = DateUtil.formatTime(beginOfDay);
        String dayend = DateUtil.formatTime(endOfDay);
        System.out.println(daystart+"=="+dayend);
        String time []= new String[25];
        time[0] = "00:00:00";
        for(int i =1;i<time.length;i++)
        {
            Date newdate = DateUtil.offset(beginOfDay,DateField.MINUTE,30);
            String times = DateUtil.formatTime(newdate);
            System.out.println(times);
            time[i] = times;
            beginOfDay = newdate;
        }
    }
}
