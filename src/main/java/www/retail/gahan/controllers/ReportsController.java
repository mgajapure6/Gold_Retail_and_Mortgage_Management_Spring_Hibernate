package www.retail.gahan.controllers;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.retail.gahan.beans.Customer;
import www.retail.gahan.beans.Gahan;
import www.retail.gahan.beans.SalesOrder;
import www.retail.gahan.beans.Supplier;
import www.retail.gahan.services.CustomerServiceI;
import www.retail.gahan.services.GahanServiceI;
//import www.retail.gahan.services.InventoryProductServiceI;
//import www.retail.gahan.services.PurchaseOrderServiceI;
//import www.retail.gahan.services.PurchasePaymentServiceI;
import www.retail.gahan.services.SalesOrderServiceI;
//import www.retail.gahan.services.SalesPaymentServiceI;
import www.retail.gahan.services.SupplierServiceI;
//import www.retail.gahan.services.ViewAddProductsServiceI;

@Controller
@RequestMapping(value = "/report")
public class ReportsController {
	private static final Logger logger = LoggerFactory.getLogger(ReportsController.class);
	
	@Autowired
	private CustomerServiceI customerServiceI;
	
	@Autowired
	private GahanServiceI gahanServiceI;
	
//	@Autowired
//	private InventoryProductServiceI inventoryProductServiceI;
//	
//	@Autowired
//	private PurchaseOrderServiceI purchaseOrderServiceI;
//	
//	@Autowired
//	private PurchasePaymentServiceI purchasePaymentServiceI;
	
	@Autowired
	private SupplierServiceI supplierServiceI;
	
	@Autowired
	private SalesOrderServiceI salesOrderServiceI;
	
//	@Autowired
//	private SalesPaymentServiceI salesPaymentServiceI;
	
//	@Autowired
//	private ViewAddProductsServiceI viewAddProductsServiceI;
	
	@RequestMapping(value = "/customerReport", method = RequestMethod.GET)
	public String customerReport(ModelMap model, HttpSession session) {
		logger.info("Welcome customerReport");
		List<Customer> customers = customerServiceI.getAllCustomers();
		model.addAttribute("allCustomersList", customers);
		return "reports/customerReport";
	}
	
	@RequestMapping(value = "/gahanReport", method = RequestMethod.GET)
	public String gahanReport(ModelMap model, HttpSession session) {
		logger.info("Welcome gahanReport");
		List<Gahan> gahans = gahanServiceI.getAllGahans();
		model.addAttribute("allGahanList", gahans);
		return "reports/gahanReport";
	}
	
	@RequestMapping(value = "/goldReport", method = RequestMethod.GET)
	public String goldReport(ModelMap model, HttpSession session) {
		logger.info("Welcome goldReport");
		List<Customer> customers = customerServiceI.getAllCustomers();
		model.addAttribute("allCustomersList", customers);
		return "reports/goldReport";
	}
	
	@RequestMapping(value = "/lossReport", method = RequestMethod.GET)
	public String lossReport(ModelMap model, HttpSession session) {
		logger.info("Welcome lossReport");
		List<Customer> customers = customerServiceI.getAllCustomers();
		model.addAttribute("allCustomersList", customers);
		return "reports/lossReport";
	}
	
	@RequestMapping(value = "/payableReport", method = RequestMethod.GET)
	public String payableReport(ModelMap model, HttpSession session) {
		logger.info("Welcome payableReport");
		List<Supplier> suppliers = supplierServiceI.getAllSuppliers();
		model.addAttribute("allSupplierList", suppliers);
		return "reports/customerReport";
	}
	
	@RequestMapping(value = "/profitReport", method = RequestMethod.GET)
	public String profitReport(ModelMap model, HttpSession session) {
		logger.info("Welcome profitReport");
		List<SalesOrder> salesOrders = salesOrderServiceI.getAllSalesOrders();
		List<Gahan> gahans = gahanServiceI.getAllGahans();
		model.addAttribute("allGahanList", gahans);
		model.addAttribute("allSalesOrdersList", salesOrders);
		return "reports/customerReport";
	}
	
	@RequestMapping(value = "/purchaseReport", method = RequestMethod.GET)
	public String purchaseReport(ModelMap model, HttpSession session) {
		logger.info("Welcome customerReport");
		List<Supplier> suppliers = supplierServiceI.getAllSuppliers();
		model.addAttribute("allSupplierList", suppliers);
		return "reports/customerReport";
	}
	
	@RequestMapping(value = "/receivableReport", method = RequestMethod.GET)
	public String receivableReport(ModelMap model, HttpSession session) {
		logger.info("Welcome receivableReport");
		List<Customer> customers = customerServiceI.getAllCustomers();
		model.addAttribute("allCustomersList", customers);
		return "reports/customerReport";
	}
	
	@RequestMapping(value = "/purchaseInvoiceReport", method = RequestMethod.GET)
	public String purchaseInvoiceReport(ModelMap model, HttpSession session) {
		logger.info("Welcome customerReport");
		List<Supplier> suppliers = supplierServiceI.getAllSuppliers();
		model.addAttribute("allSupplierList", suppliers);
		return "reports/customerReport";
	}
	
	@RequestMapping(value = "/salesInvoiceReport", method = RequestMethod.GET)
	public String salesInvoiceReport(ModelMap model, HttpSession session) {
		logger.info("Welcome customerReport");
		List<SalesOrder> salesOrders = salesOrderServiceI.getAllSalesOrders();
		model.addAttribute("allSalesOrdersList", salesOrders);
		return "reports/customerReport";
	}
	
	@RequestMapping(value = "/salesReport", method = RequestMethod.GET)
	public String salesReport(ModelMap model, HttpSession session) {
		logger.info("Welcome customerReport");
		List<Customer> customers = customerServiceI.getAllCustomers();
		model.addAttribute("allCustomersList", customers);
		return "reports/customerReport";
	}
	
	@RequestMapping(value = "/silverReport", method = RequestMethod.GET)
	public String silverReport(ModelMap model, HttpSession session) {
		logger.info("Welcome customerReport");
		List<Customer> customers = customerServiceI.getAllCustomers();
		model.addAttribute("allCustomersList", customers);
		return "reports/customerReport";
	}
	
	@RequestMapping(value = "/supplierReport", method = RequestMethod.GET)
	public String supplierReport(ModelMap model, HttpSession session) {
		logger.info("Welcome customerReport");
		List<Supplier> suppliers = supplierServiceI.getAllSuppliers();
		model.addAttribute("allSupplierList", suppliers);
		return "reports/customerReport";
	}
	
	@RequestMapping(value = "/udhariReport", method = RequestMethod.GET)
	public String udhariReport(ModelMap model, HttpSession session) {
		logger.info("Welcome customerReport");
		List<Customer> customers = customerServiceI.getAllCustomers();
		model.addAttribute("allCustomersList", customers);
		return "reports/customerReport";
	}
	
	
	
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/monthlyCustomerReport", method = RequestMethod.GET)
	@ResponseBody
	public List monthlyCustomerReport(Locale locale, Model model) {
		logger.info("monthlyCustomerReport executed");
		List cList = customerServiceI.monthlyCustomerCountReport();
		return cList;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/monthlySalesOrderReport", method = RequestMethod.GET)
	@ResponseBody
	public List monthlySalesOrderReport(Locale locale, Model model) {
		logger.info("monthlySalesOrderReport executed");
		List soList = salesOrderServiceI.monthlySalesOrderCountReport();
		return soList;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/monthlyActiveGahanReport", method = RequestMethod.GET)
	@ResponseBody
	public List monthlyActiveGahanReport(Locale locale, Model model) {
		logger.info("monthlyActiveGahanReport executed");
		List agList = gahanServiceI.monthlyActiveGahanCountReport();
		return agList;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/monthlyDeactivatedGahanReport", method = RequestMethod.GET)
	@ResponseBody
	public List monthlyDeactivatedGahanReport(Locale locale, Model model) {
		logger.info("monthlyDeactivatedGahanReport executed");
		List dgList = gahanServiceI.monthlyDeactivatedGahanCountReport();
		return dgList;
	}
}
