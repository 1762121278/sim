package com.offcn.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期类型转换器
 */
public class DateConverter implements Converter<String,Date> {

    //String pattern="yyyy-MM-dd hh:mm:ss";
    String pattern="yyyy-MM-dd";
    @Override
    public Date convert(String s) {
        System.out.println("+++++++++++++++++++++++++"+s);
        SimpleDateFormat format = new SimpleDateFormat(pattern);

        try {
            return format.parse(s);
        } catch (ParseException e) {
            throw new RuntimeException("日类型转换失败！");
        }
    }
}
