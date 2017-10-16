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
import www.retail.gahan.beans.Gahan;
import www.retail.gahan.beans.GahanPayment;
import www.retail.gahan.beans.GahanProduct;
import www.retail.gahan.services.CustomerServiceI;
import www.retail.gahan.services.GahanServiceI;
import www.retail.gahan.services.ViewAddProductsServiceI;
import www.retail.gahan.utility.DateFormate;
import www.retail.gahan.utility.FileUploadUtilityClass;
import www.retail.gahan.utility.JsonUtil;

@Controller
@RequestMapping(value = "/gahan")
public class GahanController {
	private static final Logger logger = LoggerFactory.getLogger(GahanController.class);
	
	@Autowired
	private GahanServiceI gahanServiceI;
	
	@Autowired
	private CustomerServiceI customerServiceI;
	
	@Autowired
	private ViewAddProductsServiceI viewAddProductsServiceI;
	
	private Map<String, GahanProduct> gahanProductMap= new HashMap<String, GahanProduct>();
	private MultipartFile productImageFile;

	public Map<String, GahanProduct> getGahanProductMap() {
		return gahanProductMap;
	}

	public void setGahanProductMap(Map<String, GahanProduct> gahanProductMap) {
		this.gahanProductMap = gahanProductMap;
	}

	public MultipartFile getProductImageFile() {
		return productImageFile;
	}

	public void setProductImageFile(MultipartFile productImageFile) {
		this.productImageFile = productImageFile;
	}


	@RequestMapping(value = "/newGahan/{customerName}/{cid}", method = RequestMethod.GET)
	public String showAddNewSales(@PathVariable("customerName") String customerName, @PathVariable("cid") Integer cid, Locale locale, Model model) {
		logger.info("Welcome showAddNewSales");
		model.addAttribute("allProductsList", viewAddProductsServiceI.getAllProductList());
		model.addAttribute("customer", customerServiceI.getCustomerById(cid));
		gahanProductMap.clear();
		return "gahan/newGahan";
	}
	

	@RequestMapping(value = "/addWebcamProductImage", method = RequestMethod.POST)
	@ResponseBody
	public String webcamData(@RequestParam("webcam") MultipartFile webcamMultipartData,Model model, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("Welcome addWebcamProductImage.");
		productImageFile=null;
		setProductImageFile(webcamMultipartData);
		System.out.println(webcamMultipartData);
		return JsonUtil.convertToJson("success");	
	}

	@RequestMapping(value = "/addToGahanProductMap", method = RequestMethod.POST)
	@ResponseBody
	public String addToGahanProductMap(Locale locale, Model model,HttpServletRequest request) throws IOException, ServletException {
		logger.info("Welcome addToGahanProductMap");
		String productName= request.getParameter("productName");
		Double productWeight = Double.parseDouble(request.getParameter("productWeight"));
		Double productNetWeight = Double.parseDouble(request.getParameter("productNetWeight"));
		
		GahanProduct gahanProduct = new GahanProduct();
		gahanProduct.setGahanProduct_name(productName);
		gahanProduct.setGahanProduct_weight(productWeight);
		gahanProduct.setGahanProduct_net_weight(productNetWeight);
		gahanProduct.setGp_imageFile(getProductImageFile());
		gahanProduct.setGp_status("active");
		getGahanProductMap().put(productName, gahanProduct);
		System.out.println("gahan product : "+gahanProduct);
		return JsonUtil.convertToJson("success");
	}
	
	@RequestMapping(value = "/removeProductFromMap", method = RequestMethod.GET)
	@ResponseBody
	public String removeProductFromMap(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome removeProductFromMap");
		String productName = request.getParameter("productName");
		if(gahanProductMap.size() > 1){
			gahanProductMap.remove(productName);
			return  JsonUtil.convertToJson("success");
		}
		gahanProductMap.remove(productName);
		return  JsonUtil.convertToJson("Empty");	
	}
	
	
	@RequestMapping(value = "/saveComplateGahan/{cid}", method = RequestMethod.POST)
	@ResponseBody
	public String saveComplateSalesOrder(@PathVariable("cid") Integer cid, Locale locale, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome saveComplateSalesOrder");
		Double totalAmountWithInterest = Double.parseDouble(request.getParameter("totalAmountWithInterest"));
		Double interestAmount = Double.parseDouble(request.getParameter("interestAmount"));
		Double interestRate = Double.parseDouble(request.getParameter("interestRate"));
		Integer monthPeriod = Integer.parseInt(request.getParameter("monthPeriod"));
		Double withdrawalMoney = Double.parseDouble(request.getParameter("withdrawalMoney"));
		Double productNetWeight = Double.parseDouble(request.getParameter("productNetWeight"));
		String gahanDate= request.getParameter("gahanDate");
		
		Customer customer = customerServiceI.getCustomerById(cid);
		
		List<GahanProduct> gahanProducts = new ArrayList<GahanProduct>();
		gahanProducts.clear();
		for(Map.Entry<String, GahanProduct> entry : gahanProductMap.entrySet()){
			gahanProducts.add(entry.getValue());
		}
		
		List<GahanProduct> gahanProductsWithImage = new ArrayList<GahanProduct>();
		for (GahanProduct gahanProduct : gahanProducts) {
			if(gahanProduct.getGp_imageFile()!=null){
				String c_name = customer.getCustomer_name()+"_"+gahanProduct.getGahanProduct_name()+"_"+gahanProduct.getGahanProduct_net_weight()+"_"+customer.getCustomer_create_date();
				String gahanImageName = FileUploadUtilityClass.webcamGahanProductUpload(gahanProduct.getGp_imageFile(),c_name);
				gahanProduct.setGp_image_name(gahanImageName);
			}else{
				gahanProduct.setGp_image_name("");
			}
			gahanProductsWithImage.add(gahanProduct);
		}
		
		List<GahanPayment> gahanPayments = new ArrayList<GahanPayment>();
		GahanPayment payment = new GahanPayment();
		payment.setGp_withdrawal_amt(withdrawalMoney);
		payment.setGp_gahan_making_date(gahanDate);
		payment.setGp_paid_amount(0.0);
		payment.setGp_paid_amount_date(gahanDate);
		payment.setGp_i_amt_from_last_paid_date(0.0);
		payment.setPreBalance_of_ia(0.0);
		payment.setPreBalance_of_ia_plus_new_ia(0.0);
		payment.setGp_total_pending_amount(withdrawalMoney);
		gahanPayments.add(payment);
		
		//Gahan start
		Gahan gahan = new Gahan();
		Integer gahanMaxId = gahanServiceI.getGahanMaxId();
		if(gahanMaxId==0){
			gahanMaxId=1;
		}else{
			gahanMaxId = gahanMaxId+1;
		}
		
		Integer gahanNum = gahanServiceI.getMaxGahanNumber();
		if (gahanNum == 0) {
			gahanNum = 1;
		} else {
			gahanNum = gahanNum+1;
		}
		gahan.setGahan_id(gahanMaxId);
		gahan.setGahan_number(gahanNum);
		gahan.setGahan_making_date(DateFormate.dateTimeToString(new Date()));
		gahan.setGahanProducts_total_net_weight(productNetWeight);
		gahan.setGahan_widthdraw_money(withdrawalMoney);
		gahan.setGahan_month_period(monthPeriod);
		gahan.setGahan_interest_rate(interestRate);
		gahan.setGahan_interest_amount(interestAmount);
		gahan.setGahan_making_date(gahanDate);
		gahan.setGahan_total_products(gahanProductMap.size());
		gahan.setGahan_money_deposit_last_date(DateFormate.monthPeriodLastDate(gahanDate,monthPeriod));
		gahan.setGahan_total_money_to_be_paid(totalAmountWithInterest);
		gahan.setGahan_status("active");
		//gahan.setGahanProducts(gahanProducts);
		for (GahanProduct gahanProduct : gahanProductsWithImage) {
			gahan.getGahanProducts().add(gahanProduct);
		}
		for (GahanPayment gahanPayment : gahanPayments) {
			gahan.getGahanPayments().add(gahanPayment);
		}
		
		//Gahan end
		
		
		customer.getGahans().add(gahan);
		Integer status = gahanServiceI.mergeGahanToCustomer(customer);
		if(status > 0){
			return  JsonUtil.convertToJson("success");	
		}
		return  JsonUtil.convertToJson("Failed to save Sales order. please try again.");	
	}
	
	@RequestMapping(value = "/getAllGahan", method = RequestMethod.GET)
	public String getAllGahans(Locale locale, Model model) {
		logger.info("Welcome getAllGahans");
		model.addAttribute("allCustomerList", customerServiceI.getAllCustomers());
		return "gahan/gahanList";
	}
	
	@RequestMapping(value = "/addGahanPayment/{gahanNumber}", method = RequestMethod.POST)
	@ResponseBody
	public String addGahanPayment(Locale locale,@PathVariable("gahanNumber") Integer gahanNumber, Model model, HttpServletRequest request) {
		logger.info("Welcome addGahanPayment");
		Double interestAmt = Double.parseDouble(request.getParameter("interestAmt"));
		Double paidAmount = Double.parseDouble(request.getParameter("paidAmount"));
		String paidMethod = request.getParameter("paidMethod");
		
		Gahan gahan = gahanServiceI.getGahanByGahanNumber(gahanNumber);
		GahanPayment gahanPayment = new GahanPayment();
		gahanPayment.setGp_paid_amount(paidAmount);
		gahanPayment.setGp_withdrawal_amt(gahan.getGahan_widthdraw_money());
		gahanPayment.setGp_paid_amount_date(DateFormate.dateToString(new Date()));
		gahanPayment.setGp_gahan_making_date(gahan.getGahan_making_date());
		gahanPayment.setGp_i_amt_from_last_paid_date(interestAmt);
		
		
		Double totalWithdrawal = gahan.getGahan_widthdraw_money();
		
		if (paidAmount < interestAmt) {
			gahanPayment.setPreBalance_of_ia(interestAmt-paidAmount);
		}else if(paidAmount.equals(interestAmt)){
			gahanPayment.setPreBalance_of_ia(0.0);
		}else if(paidAmount.equals(totalWithdrawal+interestAmt)){
			gahanPayment.setPreBalance_of_ia(0.0);
		}
		
		gahanPayment.setGp_paying_method(paidMethod);
		gahanPayment.setGp_total_pending_amount((gahan.getGahan_widthdraw_money()+interestAmt)-paidAmount);
		gahan.getGahanPayments().add(gahanPayment);
		
		Integer i = gahanServiceI.mergeGahanPaymentToGahan(gahan);
		if (i>0) {
			return  JsonUtil.convertToJson("success");	
		} else {
			return  JsonUtil.convertToJson("failed");	
		}
		
	}
	
	@RequestMapping(value = "/deactivated/{gnum}", method = RequestMethod.POST)
	@ResponseBody
	public String webcamData(@PathVariable("gnum") Integer gnum,Model model, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("Welcome addWebcamProductImage.");
		Integer i = gahanServiceI.deactivateGahan(gnum);
		if (i>0) {
			return JsonUtil.convertToJson("success");	
		} else {
			return JsonUtil.convertToJson("failed");	
		}
		
	}
}
