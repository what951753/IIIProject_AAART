package tw.group4._14_.utils;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import ecpay.payment.integration.domain.InvoiceObj;

public class ECPayment {
	
	

	public String genAioCheckOutALL(String date, String total){
		
		AllInOne all = new AllInOne("");

		AioCheckOutALL obj = new AioCheckOutALL();
		InvoiceObj invoice = new InvoiceObj();
		UUID uid = UUID.randomUUID();
		obj.setMerchantTradeNo(uid.toString().replaceAll("-", "").substring(0, 20));
//		obj.setMerchantTradeNo("testCompany0004");
		obj.setMerchantTradeDate(date);
		obj.setTotalAmount(total);
		obj.setTradeDesc("test Description");
		obj.setItemName("藝術品"); //要列舉出所有商品名稱與價錢，需使用 # 字號分隔每項商品，目前懶惰還沒使用
		obj.setReturnURL("http://211.23.128.214:5000"); //設定付款成功之參數要在這邊新增接收參數之外網
		obj.setClientBackURL("http://localhost:8080/Art/14/shopListController.ctrl");
		obj.setNeedExtraPaidInfo("N");
		invoice.setRelateNumber(uid.toString().replaceAll("-", "").substring(0, 20)); //商店名稱設定欄位，太常用同一個名稱會壞掉
		invoice.setCustomerID("123456");
		invoice.setCarruerType("1");
		invoice.setTaxType("1");
		invoice.setCarruerNum("");
		invoice.setDonation("0");
		invoice.setLoveCode("X123456");
		invoice.setPrint("0");
		invoice.setCustomerName("Mark");
		invoice.setCustomerAddr("台北市南港區三重路");
		invoice.setCustomerPhone("0911429215");
		invoice.setDelayDay("1");
		invoice.setInvType("07");
		invoice.setInvoiceItemName("測試");
		invoice.setInvoiceItemCount("1");
		invoice.setInvoiceItemWord("個");
		invoice.setInvoiceItemPrice("50");
		invoice.setInvoiceItemTaxType("1");
		System.out.println("obj"+ obj.getExecTimes() + "invoice" + invoice.getCustomerEmail());
		String form = all.aioCheckOut(obj,invoice);
		
		return form;
	}
}
