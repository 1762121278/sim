package com.offcn.utils;

import com.offcn.pojo.Employee;
import jxl.Workbook;
import jxl.format.BorderLineStyle;
import jxl.write.*;

import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * @author shu
 */
@Component
public class ExportExcelUtil {

    private static final SimpleDateFormat DF_TO_DATE = new SimpleDateFormat("yyyy-MM-dd");
    private static final SimpleDateFormat DF_TO_STR = new SimpleDateFormat("yyyy/MM/dd");
    private static final SimpleDateFormat df_toDateTime = new SimpleDateFormat("yyyyMMddHHmmss");

    /**
     * @description: 导出代办任务列表
     * @Param: [response, dataList]
     * @Return: org.springframework.web.servlet.ModelAndView
     */
    public void exportExcel(HttpServletResponse response, List<Employee> list) throws Exception {

        // 文件名称
        StringBuilder fileName = new StringBuilder();
        String dateTime = DF_TO_DATE.format(new Date());
        fileName.append("人员列表-").append(dateTime);

        // 取得输出流
        OutputStream os = response.getOutputStream();
        response.reset();
        // 设置一下让浏览器弹出下载提示框，而不是直接在浏览器中打开
        response.setHeader("Content-Disposition", "attachment; filename=\"" +
                URLEncoder.encode(fileName.toString() + ".xls", "UTF8") + "\"");

        response.setContentType("application/msexcel;charset=UTF-8");
        response.setContentType("application/force-download");
        // 建立excel文件
        WritableWorkbook wBook = Workbook.createWorkbook(os);
        // sheet名称
        WritableSheet wSheet = wBook.createSheet(fileName.toString(), 0);

        //表头样式
        WritableFont wfontTop = new WritableFont(WritableFont.createFont("仿宋"), 12, WritableFont.BOLD);
        WritableCellFormat wcff = new WritableCellFormat(wfontTop);
        // 把水平对齐方式指定为居中
        wcff.setAlignment(jxl.format.Alignment.CENTRE);
        // 把垂直对齐方式指定为居中
        wcff.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
        // 设置边框
        wcff.setBorder(jxl.format.Border.ALL, BorderLineStyle.THIN);

        // 设置excel标题,设置字体
        WritableFont wfont = new WritableFont(WritableFont.createFont("仿宋"), 12, WritableFont.NO_BOLD);
        //设置表格格式
        WritableCellFormat wcffc = new WritableCellFormat(wfont);
        //设置自动换行
        wcffc.setWrap(false);
        // 把水平对齐方式指定为居中
        wcffc.setAlignment(jxl.format.Alignment.CENTRE);
        // 把垂直对齐方式指定为居中
        wcffc.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
        // 设置边框
        wcffc.setBorder(jxl.format.Border.ALL, BorderLineStyle.THIN);
        // 设置行高
        wSheet.setRowView(0, 400, false);

        // 设置列宽(25个字符宽)
        wSheet.setColumnView(0, 5);
        wSheet.setColumnView(1, 15);
        wSheet.setColumnView(2, 30);
        wSheet.setColumnView(3, 30);
        wSheet.setColumnView(4, 30);
        wSheet.setColumnView(5, 30);
        wSheet.setColumnView(6, 30);
        wSheet.setColumnView(7, 30);
        wSheet.setColumnView(8, 30);
        //设置表格头内容 r:行号 c:列号
        //wSheet.addCell(new Label(0, 0, fileName.toString(), wcffc));
        wSheet.addCell(new Label(0, 0, "序号", wcff));
        wSheet.addCell(new Label(1, 0, "员工编号", wcff));
        wSheet.addCell(new Label(2, 0, "姓名", wcff));
        wSheet.addCell(new Label(3, 0, "部门", wcff));
        wSheet.addCell(new Label(4, 0, "角色", wcff));
        wSheet.addCell(new Label(5, 0, "性别", wcff));
        wSheet.addCell(new Label(6, 0, "联系电话", wcff));
        wSheet.addCell(new Label(7, 0, "入职时间", wcff));
        wSheet.addCell(new Label(8, 0, "备注", wcff));


        // 开始生成主体内容 c:列号 r:行号
        for (int i = 0; i < list.size(); i++) {
            wSheet.addCell(new Label(0, i + 1, String.valueOf(i + 1), wcffc));
            wSheet.addCell(new Label(1, i + 1, String.valueOf(list.get(i).getEid()), wcffc));
            wSheet.addCell(new Label(2, i + 1, list.get(i).getEname(), wcffc));
            wSheet.addCell(new Label(3, i + 1, list.get(i).getDept().getDname(), wcffc));
            wSheet.addCell(new Label(4, i + 1, list.get(i).getEmpRoleList().get(0).getRole().getRolename(), wcffc));
            wSheet.addCell(new Label(5, i + 1, list.get(i).getEsex(), wcffc));
            wSheet.addCell(new Label(6, i + 1, list.get(i).getTelephone(), wcffc));
            wSheet.addCell(new Label(7, i + 1, list.get(i).getHiredate(), wcffc));
            wSheet.addCell(new Label(8, i + 1, list.get(i).getRemark(), wcffc));
        }

        // 写入文件
        wBook.write();
        wBook.close();
        os.flush();
        // 关闭流
        os.close();
    }
}
