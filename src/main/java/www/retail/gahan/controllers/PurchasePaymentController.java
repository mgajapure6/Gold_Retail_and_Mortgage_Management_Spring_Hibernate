package www.retail.gahan.controllers;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.retail.gahan.beans.PurchaseOrder;
import www.retail.gahan.beans.PurchasePayment;
import www.retail.gahan.services.PurchaseOrderServiceI;
import www.retail.gahan.services.PurchasePaymentServiceI;
import www.retail.gahan.utility.DateFormate;
import www.retail.gahan.utility.JsonUtil;

@Controller
@RequestMapping(value = "/purchasePayment")
public class PurchasePaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PurchasePaymentController.class);
	@Autowired
	private PurchaseOrderServiceI purchaseOrderServiceI;
	
	@Autowired
	private PurchasePaymentServiceI purchasePaymentServiceI;
	
	@RequestMapping(value = "/addPurchasePayment/{purchaseOrderNumber}", method = RequestMethod.POST)
	@ResponseBody
	public String purchasePaymentHandler(@PathVariable("purchaseOrderNumber") Integer purchaseOrderNumber, Model model, HttpSession session, HttpServletRequest  request) throws Exception {
		logger.info("Welcome purchasePaymentHandler.");
		Double paidAmount = Double.parseDouble(request.getParameter("paidAmount"));
		String paidMethod = request.getParameter("paidMethod");
		
		PurchaseOrder purchaseOrder1 = purchaseOrderServiceI.getPurchaseOrderByPurchaseOrderNumber(purchaseOrderNumber);
		Double purchaseOrderTotalAmount = purchaseOrder1.getPurchaseOrder_total_price_after_discount();
		Double purchaseOrderPaidAmount = purchaseOrder1.getPurchaseOrder_paid_amount();
		purchaseOrderPaidAmount = purchaseOrderPaidAmount + paidAmount;
		Double purchaseOrderBalanceAmount = purchaseOrderTotalAmount - purchaseOrderPaidAmount;
		Integer i = purchaseOrderServiceI.updatePurchaseOrder(purchaseOrderNumber, purchaseOrderPaidAmount, purchaseOrderBalanceAmount);
		if (i > 0) {
			Integer purchasePaymentMaxId = purchasePaymentServiceI.getPurchasePaymentMaxId();
			if (purchasePaymentMaxId == 0) {
				purchasePaymentMaxId=1;
			} else {
				purchasePaymentMaxId = purchasePaymentMaxId+1;
			}
			
			PurchasePayment purchasePayment = new PurchasePayment();
			purchasePayment.setPurchasePayment_id(purchasePaymentMaxId);
			purchasePayment.setPurchasePayment_total_amount(purchaseOrderTotalAmount);
			purchasePayment.setPurchasePayment_paid_amount(paidAmount);
			purchasePayment.setPurchasePayment_paid_method(paidMethod);
			purchasePayment.setPurchasePayment_paid_amount_date(DateFormate.dateTimeToString(new Date()));
			purchasePayment.setPurchasePayment_balance_amount(purchaseOrderBalanceAmount);
			
			PurchaseOrder purchaseOrder2 = purchaseOrderServiceI.getPurchaseOrderByPurchaseOrderNumber(purchaseOrderNumber);
			purchaseOrder2.getPurchasePayments().add(purchasePayment);
			Integer j = purchaseOrderServiceI.mergeNewPurchasePaymentToPurchaseOrder(purchaseOrder2);
			if (j > 0) {
				return JsonUtil.convertToJson("success");	
			}
		} 
		return JsonUtil.convertToJson("Failed to add payment.");	
	} 
}
