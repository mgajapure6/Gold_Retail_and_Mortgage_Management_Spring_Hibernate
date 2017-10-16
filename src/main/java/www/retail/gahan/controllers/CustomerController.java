package www.retail.gahan.controllers;

import java.io.IOException;
import java.util.Locale;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import www.retail.gahan.utility.FileUploadUtilityClass;
import www.retail.gahan.beans.Customer;
import www.retail.gahan.services.CustomerServiceI;
import www.retail.gahan.utility.JsonUtil;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerServiceI customerServiceI;
	
	private MultipartFile  webcamImage;
	
	public MultipartFile getWebcamImage() {
		return webcamImage;
	}
	public void setWebcamImage(MultipartFile webcamImage) {
		this.webcamImage = webcamImage;
	}
	
	
	@RequestMapping(value = "/webcamImageData", method = RequestMethod.POST)
	@ResponseBody
	public String webcamData(@RequestParam("webcam") MultipartFile webcamMulltipartData,Model model, HttpSession session) throws IllegalStateException, IOException {
		logger.info("Welcome webcamData.");
		setWebcamImage(webcamMulltipartData);
		System.out.println(webcamMulltipartData);
		return JsonUtil.convertToJson("success");	
	}
	
	@RequestMapping(value = "/addNewCustomer", method = RequestMethod.GET)
	public String addNewCustomer(Locale locale, Model model) {
		logger.info("addNewCustomer executed");
		return "customer/addNewCustomer";
	}
	
	@RequestMapping(value = "/addNewCustomer", method = RequestMethod.POST)
	@ResponseBody
	public String prodessNewCustomer(@ModelAttribute("customer") Customer customer, Locale locale, Model model) throws Exception {
		logger.info("prodessNewCustomer executed");
		Integer flag;
		if (customer != null ) {
					if (!customer.getCustomer_image().isEmpty()) {
						String c_mob = customer.getCustomer_name()+"_"+customer.getCustomer_mobile();
						String c_image_name = FileUploadUtilityClass.customerProfileUpload(customer.getCustomer_image(),c_mob);
						customer.setCustomer_image_name(c_image_name);
					}else {
						if(webcamImage == null){
							
						}else{
							String c_mob = customer.getCustomer_name()+"_"+customer.getCustomer_mobile();
							String c_image_name = FileUploadUtilityClass.webcamCustomerProfileUpload(webcamImage,c_mob);
							customer.setCustomer_image_name(c_image_name);
						}
					}
				flag = customerServiceI.saveCustomer(customer);
				if (flag>0) {
					return JsonUtil.convertToJson("success");
				}
		}
		return JsonUtil.convertToJson("Unable to save Customer information.");
	}
	
	@RequestMapping(value = "/profile/{cid}", method = RequestMethod.GET)
	public String showCustomerProfile(@PathVariable("cid") Integer cid, Locale locale, Model model) {
		logger.info("Welcome showCustomerProfile");
		model.addAttribute("customer", customerServiceI.getCustomerById(cid));
		return "customer/profile";
	}
	
	@RequestMapping(value = "/getAllCustomers", method = RequestMethod.GET)
	public String allCustomers(Locale locale, Model model) {
		logger.info("Welcome allCustomers");
		model.addAttribute("allCustomerList", customerServiceI.getAllCustomers());
		return "customer/customerList";
	}
	
	@RequestMapping(value = "/updateCustomer", method = RequestMethod.POST)
	@ResponseBody
	public String prodessUpdateCustomer(@ModelAttribute("customer") Customer customer, Locale locale, Model model) throws Exception {
		logger.info("prodessNewCustomer executed");
		Integer flag;
		Integer cid = customer.getCustomer_id();
		if (customer != null ) {
			if (!customer.getCustomer_image().isEmpty()) {
				String c_mob = customer.getCustomer_name()+"_"+customer.getCustomer_mobile();
				String c_image_name = FileUploadUtilityClass.customerProfileUpload(customer.getCustomer_image(),c_mob);
				customer.setCustomer_image_name(c_image_name);
			}else {
				if(webcamImage == null){
					Customer customer2 = customerServiceI.getCustomerById(cid);
					customer.setCustomer_image_name(customer2.getCustomer_image_name());
				}else{
					String c_mob = customer.getCustomer_name()+"_"+customer.getCustomer_mobile();
					String c_image_name = FileUploadUtilityClass.webcamCustomerProfileUpload(webcamImage,c_mob);
					customer.setCustomer_image_name(c_image_name);
				}
			}
			flag = customerServiceI.updateCustomer(customer);
			if (flag>0) {
				return JsonUtil.convertToJson("success");
			}
		}
		return JsonUtil.convertToJson("Unable to save Customer information.");
	}
	
	@RequestMapping(value = "/customerAutocomplateSearch", method = RequestMethod.GET)
	@ResponseBody
	public String customerAutocomplateSearch() {
		logger.info("Welcome customerAutocomplateSearch");
		return JsonUtil.convertToJson(customerServiceI.getAllCustomers());
	}
	
}
