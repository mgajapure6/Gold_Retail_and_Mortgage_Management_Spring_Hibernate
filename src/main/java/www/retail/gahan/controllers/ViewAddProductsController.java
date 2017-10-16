package www.retail.gahan.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.retail.gahan.beans.Product;
import www.retail.gahan.services.ViewAddProductsServiceI;
import www.retail.gahan.utility.JsonUtil;

@Controller
@RequestMapping(value = "/viewAddProducts")
public class ViewAddProductsController {
	
	private static final Logger logger = LoggerFactory.getLogger(ViewAddProductsController.class);
	
	@Autowired
	private ViewAddProductsServiceI viewAddProductsServiceI;
	
	@RequestMapping(value = "/allProductList", method = RequestMethod.GET)
	public String allProductList(ModelMap model, HttpSession session) {
		logger.info("Welcome allProductListShow");
		List<Product> products = viewAddProductsServiceI.getAllProductList();
		model.addAttribute("allProductsList", products);
		return "productList/viewAddProducts";
	}
	
	@RequestMapping(value = "/addProductToList", method = RequestMethod.POST)
	@ResponseBody
	public String  addProductToList(ModelMap model, HttpSession session, HttpServletRequest request) {
		logger.info("Welcome addProductToList");
		String pname=request.getParameter("pname");
		String mtype=request.getParameter("mtype");
		 boolean b = viewAddProductsServiceI.isProductExist(pname,mtype);
		 if (b==true) {
			return "failed";
		}else{
			Product product = new Product();
			product.setProduct_name(pname);
			product.setProduct_metal_type(mtype);
			Integer i = viewAddProductsServiceI.addProductToList(product);
			if (i>0) {
				return JsonUtil.convertToJson("success");
			} else {
				return JsonUtil.convertToJson("failed");
			}
		}
	}

}
