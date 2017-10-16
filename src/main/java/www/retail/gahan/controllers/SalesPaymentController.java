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

import www.retail.gahan.beans.SalesOrder;
import www.retail.gahan.beans.SalesPayment;
import www.retail.gahan.services.SalesOrderServiceI;
import www.retail.gahan.services.SalesPaymentServiceI;
import www.retail.gahan.utility.DateFormate;
import www.retail.gahan.utility.JsonUtil;

@Controller
@RequestMapping(value = "/salesPayment")
public class SalesPaymentController {
	private static final Logger logger = LoggerFactory.getLogger(SalesPaymentController.class);
	
	@Autowired
	private SalesOrderServiceI salesOrderServiceI;
	
	@Autowired
	private SalesPaymentServiceI salesPaymentServiceI;
	
	@RequestMapping(value = "/addSalesPayment/{salesOrderNumber}", method = RequestMethod.POST)
	@ResponseBody
	public String SalesPaymentHandler(@PathVariable("salesOrderNumber") Integer salesOrderNumber, Model model, HttpSession session, HttpServletRequest  request) throws Exception {
		logger.info("Welcome SalesPaymentHandler.");
		Double paidAmount = Double.parseDouble(request.getParameter("paidAmount"));
		String paidMethod = request.getParameter("paidMethod");
		
		SalesOrder salesOrder1 = salesOrderServiceI.getSalesOrderBySalesOrderNumber(salesOrderNumber);
		Double salesOrderTotalAmount = salesOrder1.getSalesOrder_total_price_after_discount();
		Double salesOrderPaidAmount = salesOrder1.getSalesOrder_paid_amount();
		salesOrderPaidAmount = salesOrderPaidAmount + paidAmount;
		Double salesOrderBalanceAmount = salesOrderTotalAmount - salesOrderPaidAmount;
		Integer i = salesOrderServiceI.updateSalesOrder(salesOrderNumber, salesOrderPaidAmount, salesOrderBalanceAmount);
		if (i > 0) {
			Integer salesPaymentMaxId = salesPaymentServiceI.getSalesPaymentMaxId();
			if (salesPaymentMaxId == 0) {
				salesPaymentMaxId=1;
			} else {
				salesPaymentMaxId = salesPaymentMaxId+1;
			}
			
			SalesPayment salesPayment = new SalesPayment();
			salesPayment.setSalesPayment_id(salesPaymentMaxId);
			salesPayment.setSalesPayment_total_amount(salesOrderTotalAmount);
			salesPayment.setSalesPayment_paid_amount(paidAmount);
			salesPayment.setSalesPayment_paid_method(paidMethod);
			salesPayment.setSalesPayment_paid_amount_date(DateFormate.dateTimeToString(new Date()));
			salesPayment.setSalesPayment_balance_amount(salesOrderBalanceAmount);
			
			SalesOrder salesOrder2 = salesOrderServiceI.getSalesOrderBySalesOrderNumber(salesOrderNumber);
			salesOrder2.getSalesPayments().add(salesPayment);
			Integer j = salesOrderServiceI.mergeNewSalesPaymentToSalesOrder(salesOrder2);
			if (j > 0) {
				return JsonUtil.convertToJson("success");	
			}
		} 
		return JsonUtil.convertToJson("Failed to add payment.");	
	} 
}
