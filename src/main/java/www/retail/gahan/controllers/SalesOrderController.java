package www.retail.gahan.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import www.retail.gahan.beans.Customer;
//import www.retail.gahan.beans.InventoryProduct;
import www.retail.gahan.beans.SalesOrder;
import www.retail.gahan.beans.SalesPayment;
import www.retail.gahan.beans.SalesProduct;
import www.retail.gahan.services.CustomerServiceI;
import www.retail.gahan.services.InventoryProductServiceI;
import www.retail.gahan.services.SalesOrderServiceI;
import www.retail.gahan.services.SalesPaymentServiceI;
import www.retail.gahan.services.ViewAddProductsServiceI;
import www.retail.gahan.utility.DateFormate;
import www.retail.gahan.utility.FileUploadUtilityClass;
import www.retail.gahan.utility.JsonUtil;

@Controller
@RequestMapping(value = "/salesOrder")
public class SalesOrderController {
	private static final Logger logger = LoggerFactory.getLogger(SalesOrderController.class);
	
	@Autowired
	private InventoryProductServiceI inventoryProductServiceI;
	
	@Autowired
	private SalesPaymentServiceI salesPaymentServiceI;
	
	@Autowired
	private ViewAddProductsServiceI viewAddProductsServiceI;
	
//	@Autowired
//	private SalesProductServiceI SalesProductServiceI;
	
	@Autowired
	private SalesOrderServiceI salesOrderServiceI;
	
	@Autowired
	private CustomerServiceI customerServiceI;
	
	private Map<String, SalesProduct> salesOrderProductMap= new HashMap<String, SalesProduct>();
	private Map<Integer, Double> salesOrderProductPaymentMap= new HashMap<Integer, Double>();
	private MultipartFile productImageFile;

	public Map<String, SalesProduct> getsalesOrderProductMap() {
		return salesOrderProductMap;
	}

	public void setsalesOrderProductMap(Map<String, SalesProduct> salesOrderProductMap) {
		this.salesOrderProductMap = salesOrderProductMap;
	}

	public Map<Integer, Double> getSalesOrderProductPaymentMap() {
		return salesOrderProductPaymentMap;
	}

	public void setSalesOrderProductPaymentMap(Map<Integer, Double> salesOrderProductPaymentMap) {
		this.salesOrderProductPaymentMap = salesOrderProductPaymentMap;
	}
	
	
	
	public MultipartFile getProductImageFile() {
		return productImageFile;
	}

	public void setProductImageFile(MultipartFile productImageFile) {
		this.productImageFile = productImageFile;
	}

	@RequestMapping(value = "/addWebcamProductImage", method = RequestMethod.POST)
	@ResponseBody
	public String webcamData(@RequestParam("webcam") MultipartFile webcamMultipartData,Model model, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("Welcome addWebcamProductImage.");
		productImageFile=null;
		setProductImageFile(webcamMultipartData);
		return JsonUtil.convertToJson("success");	
	}

	@RequestMapping(value = "/newSalesOrder/{customerName}/{cid}", method = RequestMethod.GET)
	public String showAddNewSales(@PathVariable("customerName") String customerName, @PathVariable("cid") Integer cid, Locale locale, Model model) {
		logger.info("Welcome showAddNewSales");
		model.addAttribute("allInventoryProductsList", inventoryProductServiceI.getAllInventoryProducts());
		model.addAttribute("customer", customerServiceI.getCustomerById(cid));
		model.addAttribute("allProductsList", viewAddProductsServiceI.getAllProductList());
		salesOrderProductMap.clear();
		salesOrderProductPaymentMap.clear();
		return "sales/newSalesOrder";
	}
	

	@RequestMapping(value = "/addToSalesOrderProductMap", method = RequestMethod.POST)
	@ResponseBody
	public String addTosalesOrderProductMap(Locale locale, Model model,HttpServletRequest request) throws IOException, ServletException {
		logger.info("Welcome addToSalesOrderProductMap");
		String metalType= request.getParameter("metalType");
		Double metalRate = Double.parseDouble(request.getParameter("metalRate"));
		Double productWeight = Double.parseDouble(request.getParameter("productWeight"));
		Double makingCharge = Double.parseDouble(request.getParameter("makingCharge"));
		String productName =  request.getParameter("productName");
		Double productPrice = Double.parseDouble(request.getParameter("productPrice"));
		Integer quantities = Integer.parseInt(request.getParameter("quantities"));
		Double totalQuantityPrice = Double.parseDouble(request.getParameter("totalQuantityPrice"));
		
		SalesProduct salesProduct = new SalesProduct();
		salesProduct.setSales_product_metal_type(metalType);
		salesProduct.setTodays_metal_rate(metalRate);
		salesProduct.setSales_product_name(productName);
		salesProduct.setSales_product_weight(productWeight);
		salesProduct.setSales_product_making_charge(makingCharge);
		salesProduct.setSales_product_price(productPrice);
		salesProduct.setSales_product_imageFile(getProductImageFile());
		salesProduct.setSales_product_quantity(quantities);
		salesProduct.setSales_product_quantity_price(totalQuantityPrice);
		salesProduct.setSales_product_create_date(DateFormate.dateTimeToString(new Date()));
		getsalesOrderProductMap().put(productName, salesProduct);
		return JsonUtil.convertToJson("success");
	}
	
	@RequestMapping(value = "/removeProductFromMap", method = RequestMethod.GET)
	@ResponseBody
	public String removeProductFromMap(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome removeProductFromMap");
		String productName = request.getParameter("productName");
		if(salesOrderProductMap.size() > 1){
			salesOrderProductMap.remove(productName);
			return  JsonUtil.convertToJson("success");
		}
		salesOrderProductMap.remove(productName);
		return  JsonUtil.convertToJson("Empty");	
	}
	
	@RequestMapping(value = "/getTotalProductsInMap", method = RequestMethod.GET)
	@ResponseBody
	public Integer getTotalProductsInMap(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome getTotalProductsInMap");
		Integer totalProductsInMaps = 0;
		totalProductsInMaps += salesOrderProductMap.size();
		return  totalProductsInMaps;	
	}
	
	@RequestMapping(value = "/getTotalProductQuantitiesInMap", method = RequestMethod.GET)
	@ResponseBody
	public Integer getTotalProductQuantitiesInMap(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome getTotalProductQuantitiesInMap");
		Integer totalProductQuantitiesInMaps = 0;
		
		List<SalesProduct> salesProducts = new ArrayList<SalesProduct>();
		salesProducts.clear();
		for (Map.Entry<String, SalesProduct> entry : salesOrderProductMap.entrySet()) {
			salesProducts.add(entry.getValue());
		}
		
		for (SalesProduct salesProduct : salesProducts) {
			totalProductQuantitiesInMaps += salesProduct.getSales_product_quantity();
		}
		return  totalProductQuantitiesInMaps;	
	}
	
	
	@RequestMapping(value = "/saveComplateSalesOrder/{cid}", method = RequestMethod.POST)
	@ResponseBody
	public String saveComplateSalesOrder(@PathVariable("cid") Integer cid, Locale locale, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome saveComplateSalesOrder");
		Double totalAmtBeforeDiscount = Double.parseDouble(request.getParameter("totalAmtBeforeDiscount"));
		Double discountAmt = Double.parseDouble(request.getParameter("discountAmt"));
		Double totalAmtAfterDiscount = Double.parseDouble(request.getParameter("totalAmtAfterDiscount"));
		Double paymentAmt = Double.parseDouble(request.getParameter("paymentAmt"));
		Double balanceAmt = Double.parseDouble(request.getParameter("balanceAmt"));
		String paidMethod = request.getParameter("paidMethod");
		
		List<SalesProduct> salesProducts = new ArrayList<SalesProduct>();
		salesProducts.clear();
		for(Map.Entry<String, SalesProduct> entry : salesOrderProductMap.entrySet()){
			salesProducts.add(entry.getValue());
		}
		
		
		
		//SalesPayment start
		List<SalesPayment> salesPayments = new ArrayList<SalesPayment>();
		SalesPayment salesPayment = new SalesPayment();
		Integer salesPaymentMaxId = salesPaymentServiceI.getSalesPaymentMaxId();
		if(salesPaymentMaxId==0){
			salesPaymentMaxId=1;
		}else{
			salesPaymentMaxId = salesPaymentMaxId+1;
		}
		salesPayment.setSalesPayment_id(salesPaymentMaxId);
		salesPayment.setSalesPayment_total_amount(totalAmtAfterDiscount);
		salesPayment.setSalesPayment_balance_amount(balanceAmt);
		salesPayment.setSalesPayment_paid_amount(paymentAmt);
		salesPayment.setSalesPayment_paid_method(paidMethod);
		salesPayment.setSalesPayment_paid_amount_date(DateFormate.dateTimeToString(new Date()));
		salesPayments.add(salesPayment);
		//SalesPayment end
		
		Integer totalProductQuantities= 0;
		for (SalesProduct salesProduct : salesProducts) {
			totalProductQuantities += salesProduct.getSales_product_quantity();
		}
		
		//SalesOrder start

		SalesOrder salesOrder = new SalesOrder();
		Integer salesOrderMaxId = salesOrderServiceI.getSalesOrderMaxId();
		if(salesOrderMaxId==0){
			salesOrderMaxId=1;
		}else{
			salesOrderMaxId = salesOrderMaxId+1;
		}
		
		Integer salesOrderNum = salesOrderServiceI.getMaxSalesOrderNumber();
		if (salesOrderNum == 0) {
			salesOrderNum = 1;
		} else {
			salesOrderNum = salesOrderNum+1;
		}
		salesOrder.setSalesOrder_id(salesOrderMaxId);
		salesOrder.setSalesOrder_number(salesOrderNum);
		salesOrder.setSalesOrder_total_price_before_discount(totalAmtBeforeDiscount);
		salesOrder.setSalesOrder_discount(discountAmt);
		salesOrder.setSalesOrder_total_price_after_discount(totalAmtAfterDiscount);
		salesOrder.setSalesOrder_paid_amount(paymentAmt);
		salesOrder.setSalesOrder_balance_amount(balanceAmt);
		//salesOrder.setSalesProducts(salesProducts);
		salesOrder.setSalesOrder_date(DateFormate.dateToString(new Date()));
		salesOrder.setSalesOrder_total_products(salesOrderProductMap.size());
		salesOrder.setSalesOrder_total_quantities(totalProductQuantities);
		for (SalesProduct salesProduct : salesProducts) {
			if (salesProduct.getSales_product_imageFile() == null) {
				
			}
			else{
					String sp_name = salesProduct.getSales_product_name()+"_"+salesProduct.getSales_product_weight()+"_"+salesProduct.getSales_product_create_date();
					String c_image_name = FileUploadUtilityClass.webcamSalesProductImageUpload(salesProduct.getSales_product_imageFile(),sp_name);
					salesProduct.setSales_product_image_name(c_image_name);
			}
		
			salesOrder.getSalesProducts().add(salesProduct);
		}
		for (SalesPayment salesPayment1 : salesPayments) {
			salesOrder.getSalesPayments().add(salesPayment1);
		}
		//SalesOrder end
		
		Customer customer = customerServiceI.getCustomerById(cid);
		customer.getSalesOrders().add(salesOrder);
		Integer status = customerServiceI.mergeSalesOrderToCustomer(customer);
		if(status > 0){
			return  JsonUtil.convertToJson("success");	
		}
		return  JsonUtil.convertToJson("Failed to save Sales order. please try again.");	
	}
	
	@RequestMapping(value = "/getAllSalesOrders", method = RequestMethod.GET)
	public String getAllSalesOrders(Locale locale, Model model) {
		logger.info("Welcome getAllSalesOrders");
		//model.addAttribute("allSalesOrderList", salesOrderServiceI.getAllSalesOrders());
		model.addAttribute("allCustomerList", customerServiceI.getAllCustomers());
		return "sales/salesOrderList";
	}
}
