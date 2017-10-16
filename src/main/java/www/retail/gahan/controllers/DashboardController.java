package www.retail.gahan.controllers;

import java.util.Locale;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import www.retail.gahan.services.CustomerServiceI;
import www.retail.gahan.services.GahanServiceI;
import www.retail.gahan.services.PurchaseOrderServiceI;
import www.retail.gahan.services.SalesOrderServiceI;

@Controller
//@RequestMapping(value = "/dashboard")
public class DashboardController {
	private static final Logger logger = LoggerFactory.getLogger(DashboardController.class);
	
	@Autowired
	private CustomerServiceI customerServiceI;
	
	@Autowired
	private SalesOrderServiceI salesOrderServiceI;
	
	@Autowired
	private GahanServiceI gahanServiceI;
	
	@Autowired
	private PurchaseOrderServiceI purchaseOrderServiceI;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String dashboard(Model model, HttpSession session) {
		logger.info("Welcome dashboard");
		if (session.getAttribute("name")!=null) {
			return "redirect:/dashboard";
		}
		return "redirect:/admin/";
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String showDashboard(Locale locale, Model model, HttpSession session ) {
		logger.info("Welcome dashboard");
		session.setAttribute("allCustomerTopList", customerServiceI.getAllCustomers());
		model.addAttribute("totalCustomers", customerServiceI.getTotalCustomersCount());
		model.addAttribute("totalSalesOrders", salesOrderServiceI.getTotalSalesOrderCount());
		model.addAttribute("totalActiveGahan", gahanServiceI.getTotalActiveGahanCount());
		model.addAttribute("totalPurchaseOrders", purchaseOrderServiceI.getTotalPurchaseOrdersCount());
		return "dashboard/dashboard";
	}

	
}
