<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>选择支付的银行</title>
	<link href="/css/pay.css" rel="stylesheet" type="text/css">
	  <jsp:include page="header.jsp"/>
</head>
<body>

<form action="paying" method="post">
	<dl class="payment_page">
		<dt>
			<strong>订单号：</strong> 
			<input class="idinp" name="orderId"  readonly="readonly" type="text" value="${orderId}">
			<strong>支付金额：</strong>
			<input class="moneyinp" name="money" type="text" readonly="readonly" type="text" value="${money}">元
		</dt>
		<dd class="payment_page_name">
			<strong>请您选择在线支付银行 :</strong>
		</dd>
		<dd class="banks">
			<ul>
				<li>
					<input name="pd_FrpId" type="radio" value="ICBC-NET-B2C"> 
					<img src="/images/pay/01gs.jpg" width="130" height="52">
				</li>
				<li>
					<input name="pd_FrpId" type="radio" value="CMBCHINA-NET-B2C">
					<img src="/images/pay/02zs.jpg" width="130" height="52">
				</li>
				<li>
					<input name="pd_FrpId" type="radio" value="CCB-NET-B2C">
					<img src="/images/pay/03js.jpg" width="130" height="52">
				</li>
				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="/images/pay/04ny.jpg" width="130" height="52">
				</li>
				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="/images/pay/05zg.jpg" width="130" height="52">
				</li>
				<li>
					<input name="pd_FrpId" type="radio" value="BOCO-NET-B2C">
					<img src="/images/pay/06jt.jpg" width="130" height="52">
				</li>
				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="/images/pay/07hx.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="/images/pay/08xy.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="/images/pay/09gd.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="/images/pay/10sz.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="/images/pay/11ms.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="/images/pay/12sh.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="/images/pay/13zx.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="/images/pay/14gd.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="/images/pay/15cq.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="/images/pay/16bh.jpg" width="130" height="52">
				</li>
			</ul>
		</dd>
		<div style="clear: both;"></div>
		<dd class="ok_dd">
			<input  type="submit" class="ok_pay" value="确认支付">
		</dd>
	</dl>
</form>
<jsp:include page="footer.jsp"/>
</body>
</html>
