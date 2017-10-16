package www.retail.gahan.controllers;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import www.retail.gahan.beans.Admin;
import www.retail.gahan.beans.ChangePassword;
import www.retail.gahan.services.AdminServiceI;
import www.retail.gahan.utility.FileUploadUtilityClass;
import www.retail.gahan.utility.JsonUtil;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminServiceI adminServiceI;
	
	private MultipartFile adminImageFile;
	
	public MultipartFile getAdminImageFile() {
		return adminImageFile;
	}

	public void setAdminImageFile(MultipartFile adminImageFile) {
		this.adminImageFile = adminImageFile;
	}

	@RequestMapping(value = "/addWebcamAdminImage", method = RequestMethod.POST)
	@ResponseBody
	public String webcamData(@RequestParam("webcam") MultipartFile webcamMultipartData,Model model, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("Welcome addWebcamProductImage.");
		adminImageFile=null;
		setAdminImageFile(webcamMultipartData);
		return JsonUtil.convertToJson("success");	
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(ModelMap model, HttpSession session) {
		logger.info("Welcome home");
		 boolean b = adminServiceI.isAdminExist();
		if (b==true) {
			return "redirect:/admin/login";
		}else{
			return "redirect:/admin/admin_register";
		}
	}
	
	@RequestMapping(value = "/admin_register", method = RequestMethod.GET)
	public String showAdminRegistrationPage(Model model, HttpSession session) {
		logger.info("Welcome showAdminRegistrationPage");
		 boolean b= adminServiceI.isAdminExist();
		if (b==true) {
			return "redirect:/admin/login";
		}else{
			return "admin/register";
		}
		
	}
	
	@RequestMapping(value="/admin_register",method = RequestMethod.POST)
	public String processAdminRegistration(Locale locale, Model model, @ModelAttribute("admin") Admin admin, HttpSession session) throws IOException {
		logger.info("Welcome processAdminRegistration");
		if(admin!=null){
			if (!adminImageFile.isEmpty()) {
				String a_name = admin.getAdmin_name()+"_"+admin.getAdmin_email();
				String a_image_name = FileUploadUtilityClass.webcamAdminProfileUpload(getAdminImageFile(),a_name);
				admin.setAdmin_image_name(a_image_name);
			}else {
				if(adminImageFile == null){
					
				}else{
					String a_name = admin.getAdmin_name()+"_"+admin.getAdmin_email();
					String c_image_name = FileUploadUtilityClass.webcamAdminProfileUpload(getAdminImageFile(),a_name);
					admin.setAdmin_image_name(c_image_name);
				}
			}
			admin.setAdmin_id(1);
			Integer i = adminServiceI.saveAdmin(admin);
			if(i >0){
				return "redirect:/admin/login";
			}
		}
		model.addAttribute("err2", "Uable to process Admin Registration.");
		return "admin/register";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showAdminLoginPage(Model model, HttpSession session) {
		logger.info("Welcome showAdminLoginPage");
		if (session.getAttribute("name")!=null) {
			return "redirect:/dashboard";
		}
		return "admin/login";
	}
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String processAdminLogin(Locale locale, Model model, @ModelAttribute("admin") Admin admin, HttpSession session) {
		logger.info("Welcome processAdminLogin");
		if (admin.getAdmin_username()!=null && admin.getAdmin_password()!=null) {
			try {
				admin  = adminServiceI.adminLogin(admin);
				if(admin!=null){
					session.setAttribute("name", admin.getAdmin_name());
					session.setAttribute("image", admin.getAdmin_image_name());
					session.setAttribute("admin_id", admin.getAdmin_id());
					return "redirect:/dashboard";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "Invalid username and password1.");
				return "admin/login";
			}
		}
		model.addAttribute("msg", "Invalid username and password2.");
		return "admin/login";	
	}
	
	@RequestMapping(value="/logout",method = RequestMethod.GET)
	public String logout(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome logout! The client locale is {}.", locale);
		session.removeAttribute("name");
		session.removeAttribute("admin_id");
		return "redirect:/admin/login";
		}
	
	@RequestMapping(value="/lock",method = RequestMethod.GET)
	public String showLockScreen(Locale locale, Model model, HttpSession session) {
		return "admin/lockScreen";
	}
	
	@RequestMapping(value="/lock",method = RequestMethod.POST)
	public String processLockScreen(Locale locale, Model model, @ModelAttribute("admin") Admin admin, HttpSession session) {
		if (admin.getAdmin_password()!=null) {
			try {
				String aname = (String) session.getAttribute("name");
				admin.setAdmin_name(aname);
				admin = adminServiceI.adminLock(admin);
				if (admin.getAdmin_password()!=null) {
					return "redirect:/dashboard";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "Invalid password1.");
				return "admin/lockScreen";
			}
		}
		model.addAttribute("msg", "Invalid  password2.");
		return "admin/lockScreen";
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String showChangePassword(Model model,ModelMap map, HttpSession session){
		logger.info("Welcome showChangePassword.");
		map.put("action","ChangePassword");
		ChangePassword changePassword = new ChangePassword();
		model.addAttribute(changePassword);
		return "admin/changePassword";
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String doChangePassword(@ModelAttribute("changePassword") ChangePassword cp,Model model,ModelMap map, HttpSession session){
		logger.info("Welcome doChangePassword.");
		Integer aid = cp.getAdmin_id();
		String op=cp.getOld_password();
		String np=cp.getNew_password();
		String opass = adminServiceI.getPassword(aid);
		if (opass.equals(op)) {
			String response=adminServiceI.changePassword(np, aid);
			model.addAttribute("msg",response);
			return "admin/changePassword";
		} else {
			model.addAttribute("msg","Old password is incorrect.");
			return "admin/changePassword";
		}
	}
	
	@RequestMapping(value = "/overview", method = RequestMethod.GET)
	public String showAdminOverview(Model model,ModelMap map, HttpSession session){
		logger.info("Welcome showAdminOverview.");
		map.put("action","AdminProfile");
		return "admin/adminOverview";
	}
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String showAdminAccount(Model model,ModelMap map, HttpSession session){
		logger.info("Welcome showAdminAccount.");
		map.put("action","AdminProfile");
		return "admin/adminAccount";
	}
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String showAdminHelp(Model model,ModelMap map, HttpSession session){
		logger.info("Welcome showAdminHelp.");
		map.put("action","AdminProfile");
		return "admin/adminHelp";
	}
}
