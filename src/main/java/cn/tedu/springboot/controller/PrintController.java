package cn.tedu.springboot.controller;

import cn.tedu.springboot.mapper.BackMapper;
import cn.tedu.springboot.pojo.Order;
import cn.tedu.springboot.pojo.Product;
import cn.tedu.springboot.service.BackService;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by BIG on 2017/10/22.
 */
@Controller
public class PrintController {
    @Autowired
    private BackService backService;

    @RequestMapping("order-print")
    public void printOrder(@RequestParam("orderId")String[] orderIds, HttpServletResponse response) throws IOException {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");

        //.创建一个工作簿
        Workbook wb=new HSSFWorkbook();


        for (String orderId:orderIds) {

            Sheet sheet = wb.createSheet();
            Row nRow=null;
            Cell nCell=null;

            //行号
            int  rowNo=0;
            //列号
            int colNo=1;

            //声明样式对象和字体对象
            CellStyle nStyle=wb.createCellStyle();
            Font font = wb.createFont();

            //列宽
            sheet.setColumnWidth(0,2*300);
            sheet.setColumnWidth(1,26*300);
            sheet.setColumnWidth(2,12*300);
            sheet.setColumnWidth(3,29*300);
            sheet.setColumnWidth(4,10*300);

            Order order = backService.findOrderByOrderId(orderId);

            List<Product> productList = backService.findOrderProducts(orderId);


            //大标题，合并单元格
            sheet.addMergedRegion(new CellRangeAddress(0,0,1,4));  //开始行，结束行，开始列，结束列
            //合并单元格的内容写在合并前第一个单元格中
            nRow=sheet.createRow(rowNo++);

            nRow.setHeightInPoints(36);

            nCell=nRow.createCell(1);
            nCell.setCellValue("撑了么订单表");
            nCell.setCellStyle(this.bigTitle(wb, nStyle, font));


            //商品列表
            String[] title=new  String[]{"商品id","商品名称","商品单价","购买数量" };

            nRow=sheet.createRow(rowNo++);
            nRow.setHeightInPoints(26.25f);

            //初始化
            nStyle=wb.createCellStyle();
            font=wb.createFont();

            for(int  i=0;i<title.length;i++){
                nCell=nRow.createCell(i+1);
                nCell.setCellValue(title[i]);
                nCell.setCellStyle(this.Title(wb, nStyle, font));

            }
            //初始化
            nStyle=wb.createCellStyle();
            font=wb.createFont();

            //换行
            for(int j=0;j<productList.size();j++){
                Product product =productList.get(j);
                //OutProductVO op=dataList.get(j);
                colNo=1;

                nRow=sheet.createRow(rowNo++);
                //商品id
                nCell=nRow.createCell(colNo++);
                nCell.setCellValue(product.getProductId());
                nCell.setCellStyle(this.Text(wb, nStyle, font));

                //商品名称
                nCell=nRow.createCell(colNo++);
                nCell.setCellValue(product.getProductName());
                nCell.setCellStyle(this.Text(wb, nStyle, font));

                //商品单价
                nCell=nRow.createCell(colNo++);
                nCell.setCellValue(product.getProductPrice());
                nCell.setCellStyle(this.Text(wb, nStyle, font));

                //购买数量
                nCell=nRow.createCell(colNo++);
                nCell.setCellValue(product.getBuynum());
                nCell.setCellStyle(this.Text(wb, nStyle, font));

            }

            //订单id
            nRow=sheet.createRow(colNo++);
            nRow.setHeightInPoints(26.25f);
            nCell = nRow.createCell(1);
            nCell.setCellValue("订单id：");
            nCell = nRow.createCell(2);
            nCell.setCellValue(order.getOrderId());
            nStyle.setAlignment(CellStyle.ALIGN_CENTER);

            //订单总额：
            nRow=sheet.createRow(colNo++);
            nRow.setHeightInPoints(26.25f);
            nCell = nRow.createCell(1);
            nCell.setCellValue("订单总额：");
            nCell = nRow.createCell(2);
            nCell.setCellValue(order.getMoney().toString());


            //收货人：
            nRow=sheet.createRow(colNo++);
            nRow.setHeightInPoints(26.25f);
            nCell = nRow.createCell(1);
            nCell.setCellValue("收货人：");
            nCell = nRow.createCell(2);
            nCell.setCellValue(order.getReceiveInfo().getReceiver());
            nStyle.setAlignment(CellStyle.ALIGN_CENTER);

            //收货地址：
            nRow=sheet.createRow(colNo++);
            nRow.setHeightInPoints(26.25f);
            nCell = nRow.createCell(1);
            nCell.setCellValue("收货地址：");
            nCell = nRow.createCell(2);
            nCell.setCellValue(order.getReceiveInfo().getReceiveAddress());
            nStyle.setAlignment(CellStyle.ALIGN_CENTER);

            //下单时间：
            nRow=sheet.createRow(colNo++);
            nRow.setHeightInPoints(26.25f);
            nCell = nRow.createCell(1);
            nCell.setCellValue("下单时间：");
            nCell = nRow.createCell(2);
            nCell.setCellValue(sdf.format(order.getOrderTime()));
            nStyle.setAlignment(CellStyle.ALIGN_CENTER);

        }



        Date date = new Date();


        String fname = "clm"+sdf.format(date)+".xls";

        String path = "D:\\"+fname;

        //保存到本地
        OutputStream os=new FileOutputStream(new File(path));
        wb.write(os);
        os.flush();
        os.close();

        //通过IO输入流读取项目下对应的文件
        InputStream in = new FileInputStream(path);
        //通过IO输出流将文件的信息响应给浏览器
        OutputStream out = response.getOutputStream();
        //告知浏览器以附件下载的方式打开文件
        response.setHeader("Content-Disposition",
                "attachment;filename="+fname);
        //执行IO的读写操作
        byte[] bts = new byte[1024];
        int len = -1;
        while((len =in.read(bts))!=-1){
            out.write(bts,0,len);
        }
        //关闭流
        in.close();
        out.close();
        //下载
       /* DownloadUtil dUtil=new DownloadUtil();
        ByteArrayOutputStream os=new ByteArrayOutputStream();
        wb.write(os);
        dUtil.download(os, response, "出货表.xls");*/
    }

    //大标题的样式
    public CellStyle bigTitle(Workbook wb,CellStyle nStyle,Font font){
        font.setFontName("宋体");
        font.setFontHeightInPoints((short) 16);
        //字体加粗
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //横向居中
        nStyle.setAlignment(CellStyle.ALIGN_CENTER);
        //纵向居中
        nStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);     //单元格垂直居中

        nStyle.setFont(font);
        return nStyle;
    }

    //标题样式
    public CellStyle Title(Workbook wb,CellStyle nStyle,Font font){
        font.setFontName("黑体");
        font.setFontHeightInPoints((short) 12);

        //横向居中
        nStyle.setAlignment(CellStyle.ALIGN_CENTER);
        //纵向居中
        nStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);     //单元格垂直居中

        //表格线
        //nStyle.setBorderTop(CellStyle.BORDER_THICK);            //粗实线
        nStyle.setBorderTop(CellStyle.BORDER_THIN);
        nStyle.setBorderBottom(CellStyle.BORDER_THIN);          //实线
        nStyle.setBorderLeft(CellStyle.BORDER_THIN);            //比较粗实线
        nStyle.setBorderRight(CellStyle.BORDER_THIN);           //实线

        nStyle.setFont(font);
        return nStyle;
    }

    //文字样式
    public CellStyle Text(Workbook wb,CellStyle nStyle,Font font){
        font.setFontName("Times New Roman");
        font.setFontHeightInPoints((short) 10);

        //横向居中
        nStyle.setAlignment(CellStyle.ALIGN_CENTER);
        //纵向居中
        nStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);     //单元格垂直居中

        //表格线

        nStyle.setBorderBottom(CellStyle.BORDER_THIN);          //实线
        nStyle.setBorderLeft(CellStyle.BORDER_THIN);            //比较粗实线
        nStyle.setBorderRight(CellStyle.BORDER_THIN);           //实线

        nStyle.setFont(font);
        return nStyle;
    }

    //文字样式
    public CellStyle Text2(Workbook wb,CellStyle nStyle,Font font){
        font.setFontName("Times New Roman");
        font.setFontHeightInPoints((short) 10);

        //横向居中
        nStyle.setAlignment(CellStyle.ALIGN_CENTER);
        //纵向居中
        nStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);     //单元格垂直居中

        nStyle.setFont(font);
        return nStyle;
    }

}
