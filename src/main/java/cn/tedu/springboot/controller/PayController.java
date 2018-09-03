package cn.tedu.springboot.controller;

import cn.tedu.springboot.tool.PaymentUtil;
import cn.tedu.springboot.tool.PropUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by BIG on 2017/10/23.
 */
@Controller
public class PayController {
   /* @Autowired
    private PayService payService;*/

    @RequestMapping("topay")
    public String toPay(String orderId,Integer money,Model model){
        model.addAttribute("orderId",orderId);
        model.addAttribute("money",money);
        return "pay";
    }

    @RequestMapping("paying")
    public String paying(Model model, String orderId, String pd_FrpId){
        //1接收订单id
        //String oid = request.getParameter("orderid");
        String oid = orderId;
        //2、准备第三方支付平台需要的参数
        String p0_Cmd = "Buy";//业务类型
        String p1_MerId = PropUtils.getProperty("p1_MerId");
        String p2_Order = oid;//商户的订单号
        //测试时使用
        String p3_Amt = "0.01";//订单金额
        //“正式发布”的时候使用
		/*OrderService os = BasicFactory.getFactory().getInstance(OrderService.class);
		Order order = os.findOrderByOid(oid);
		String p3_Amt = ""+order.getMoney();*/
        String p4_Cur = "CNY";//交易币种
        String p5_Pid = "";//商品名称
        String p6_Pcat = "";//商品分类
        String p7_Pdesc ="";//商品描述
        String p8_Url = PropUtils.getProperty("responseURL");
        String p9_SAF = "";//送货地址
        String pa_MP = "";//商户的扩展信息
        //支付通道编码
       // String pd_FrpId=request.getParameter("pd_FrpId");
        //应答机制
        String pr_NeedResponse = "1";
        //调用工具类生产数据签名
        String hmac = PaymentUtil.buildHmac(p0_Cmd,
                p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid,
                p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
                pd_FrpId, pr_NeedResponse, PropUtils.getProperty("keyValue"));
        //3、将以上产生保存request
        model.addAttribute("pd_FrpId", pd_FrpId);
        model.addAttribute("p0_Cmd", p0_Cmd);
        model.addAttribute("p1_MerId", p1_MerId);
        model.addAttribute("p2_Order", p2_Order);
        model.addAttribute("p3_Amt", p3_Amt);
        model.addAttribute("p4_Cur", p4_Cur);
        model.addAttribute("p5_Pid", p5_Pid);
        model.addAttribute("p6_Pcat", p6_Pcat);
        model.addAttribute("p7_Pdesc", p7_Pdesc);
        model.addAttribute("p8_Url", p8_Url);
        model.addAttribute("p9_SAF", p9_SAF);
        model.addAttribute("pa_MP", pa_MP);
        model.addAttribute("pr_NeedResponse", pr_NeedResponse);
        model.addAttribute("hmac", hmac);
        return "confirm";
    }

    @RequestMapping("PaymentCallBackServlet")
    @ResponseBody
    public String paymentCallBackServlet(String p1_MerId,String r0_Cmd,String r1_Code,String r2_TrxId,String r3_Amt,String r4_Cur,String r5_Pid,String r6_Order,String r7_Uid,String r8_MP,String r9_BType,String rb_BankId,String ro_BankOrderId,String rp_PayDate,String rq_CardNo,String ru_Trxtime,String hmac) {
        System.out.println("11111111111111111111111111111111");
        boolean result = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd,
                r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order,
                r7_Uid, r8_MP, r9_BType, PropUtils.getProperty("keyValue"));
        if (result) {//数据未被修改
            if ("1".equals(r9_BType)) {//表示重定向过来的
                return "<h1>支付操作已执行，支付结果需要等待进一步的通知</h1>";
            } else if ("2".equals(r9_BType)) {//点对点通知
                if ("1".equals(r1_Code)) {//点对点通知支付完成
                    return "<h1>支付成功</h1>";
                }
            }

        }
            return "<h1>数据被篡改了。。。</h1>";

    }
}
