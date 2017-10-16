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
import www.retail.gahan.beans.Supplier;
import www.retail.gahan.services.SupplierServiceI;
import www.retail.gahan.utility.JsonUtil;

@Controller
@RequestMapping(value = "/supplier")
public class SupplierController {
	private static final Logger logger = LoggerFactory.getLogger(SupplierController.class);
	
	@Autowired
	private SupplierServiceI supplierServiceI;
	
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
		return JsonUtil.convertToJson("success");	
	}
	
	@RequestMapping(value = "/addNewSupplier", method = RequestMethod.GET)
	public String addNewSupplier(Locale locale, Model model) {
		logger.info("addNewSupplier executed");
		return "supplier/addNewSupplier";
	}
	
	@RequestMapping(value = "/addNewSupplier", method = RequestMethod.POST)
	@ResponseBody
	public String prodessNewSupplier(@ModelAttribute("supplier") Supplier supplier, Locale locale, Model model) throws Exception {
		logger.info("prodessNewSupplier executed");
		Integer flag;
		Integer sid;
		if (supplier != null ) {
			 sid = supplierServiceI.getSupplierIdByMobile(supplier.getSupplier_mobile());
			if (sid>0) {
				return JsonUtil.convertToJson("avilable");
			} else {
					if (!supplier.getSupplier_image().isEmpty()) {
						String s_mob = supplier.getSupplier_mobile();
						String s_image_name = FileUploadUtilityClass.supplierProfileUpload(supplier.getSupplier_image(),s_mob);
						supplier.setSupplier_image_name(s_image_name);
					}else {
						if(webcamImage == null){
							
						}else{
							String s_mob = supplier.getSupplier_mobile();
							String s_image_name = FileUploadUtilityClass.webcamSupplierProfileUpload(webcamImage,s_mob);
							supplier.setSupplier_image_name(s_image_name);
						}
					}
				flag = supplierServiceI.saveSupplier(supplier);
				if (flag>0) {
					return JsonUtil.convertToJson("success");
				}
			}
		}
		return JsonUtil.convertToJson("Unable to save supplier information.");
	}
	
	@RequestMapping(value = "/profile/{sid}", method = RequestMethod.GET)
	public String showSupplierProfile(@PathVariable("sid") Integer sid, Locale locale, Model model) {
		logger.info("Welcome showSupplierProfile");
		model.addAttribute("supplier", supplierServiceI.getSupplierById(sid));
		return "supplier/profile";
	}
	
	@RequestMapping(value = "/getAllSuppliers", method = RequestMethod.GET)
	public String allSuppliers(Locale locale, Model model) {
		logger.info("Welcome allSuppliers");
		model.addAttribute("allSupplierList", supplierServiceI.getAllSuppliers());
		return "supplier/supplierList";
	}
	
	@RequestMapping(value = "/updateSupplier", method = RequestMethod.POST)
	@ResponseBody
	public String prodessUpdateSupplier(@ModelAttribute("supplier") Supplier supplier, Locale locale, Model model) throws Exception {
		logger.info("prodessNewSupplier executed");
		Integer flag;
		Integer sid = supplier.getSupplier_id();
		if (supplier != null ) {
			if (!supplier.getSupplier_image().isEmpty()) {
				String s_mob = supplier.getSupplier_mobile();
				String s_image_name = FileUploadUtilityClass.supplierProfileUpload(supplier.getSupplier_image(),s_mob);
				supplier.setSupplier_image_name(s_image_name);
			}else {
				if(webcamImage == null){
					Supplier supplier2 = supplierServiceI.getSupplierById(sid);
					supplier.setSupplier_image_name(supplier2.getSupplier_image_name());
				}else{
					String s_mob = supplier.getSupplier_mobile();
					String s_image_name = FileUploadUtilityClass.webcamSupplierProfileUpload(webcamImage,s_mob);
					supplier.setSupplier_image_name(s_image_name);
				}
			}
			flag = supplierServiceI.updateSupplier(supplier);
			if (flag>0) {
				return JsonUtil.convertToJson("success");
			}
		}
		return JsonUtil.convertToJson("Unable to save supplier information.");
	}
	
	@RequestMapping(value = "/supplierAutocomplateSearch", method = RequestMethod.GET)
	@ResponseBody
	public String supplierAutocomplateSearch() {
		logger.info("Welcome supplierAutocomplateSearch");
		return JsonUtil.convertToJson(supplierServiceI.getAllSuppliers());
	}
	
}
