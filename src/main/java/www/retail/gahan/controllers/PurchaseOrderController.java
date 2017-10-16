package www.retail.gahan.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import www.retail.gahan.beans.InventoryProduct;
import www.retail.gahan.beans.PurchaseOrder;
import www.retail.gahan.beans.PurchasePayment;
import www.retail.gahan.beans.PurchaseProduct;
import www.retail.gahan.beans.Supplier;
import www.retail.gahan.services.InventoryProductServiceI;
import www.retail.gahan.services.PurchaseOrderServiceI;
import www.retail.gahan.services.PurchasePaymentServiceI;
//import www.retail.gahan.services.PurchaseProductServiceI;
import www.retail.gahan.services.SupplierServiceI;
import www.retail.gahan.services.ViewAddProductsServiceI;
import www.retail.gahan.utility.DateFormate;
import www.retail.gahan.utility.JsonUtil;

@Controller
@RequestMapping(value = "/purchaseOrder")
public class PurchaseOrderController {
	private static final Logger logger = LoggerFactory.getLogger(PurchaseOrderController.class);
	
	@Autowired
	private InventoryProductServiceI inventoryProductServiceI;
	
	@Autowired
	private PurchasePaymentServiceI purchasePaymentServiceI;
	
	@Autowired
	private ViewAddProductsServiceI viewAddProductsServiceI;
	
//	@Autowired
//	private PurchaseProductServiceI purchaseProductServiceI;
	
	@Autowired
	private PurchaseOrderServiceI purchaseOrderServiceI;
	
	@Autowired
	private SupplierServiceI supplierServiceI;
	
	private Map<String, PurchaseProduct> pruchaseOrderProductMap= new HashMap<String, PurchaseProduct>();
	private Map<Integer, Double> purchaseOrderProductPaymentMap= new HashMap<Integer, Double>();
	

	public Map<String, PurchaseProduct> getPruchaseOrderProductMap() {
		return pruchaseOrderProductMap;
	}

	public void setPruchaseOrderProductMap(Map<String, PurchaseProduct> pruchaseOrderProductMap) {
		this.pruchaseOrderProductMap = pruchaseOrderProductMap;
	}

	public Map<Integer, Double> getPurchaseOrderProductPaymentMap() {
		return purchaseOrderProductPaymentMap;
	}

	public void setPurchaseOrderProductPaymentMap(Map<Integer, Double> purchaseOrderProductPaymentMap) {
		this.purchaseOrderProductPaymentMap = purchaseOrderProductPaymentMap;
	}
	
	@RequestMapping(value = "/newPurchaseOrder/{supplierName}/{sid}", method = RequestMethod.GET)
	public String showAddNewPurchase(@PathVariable("supplierName") String supplierName, @PathVariable("sid") Integer sid, Locale locale, Model model) {
		logger.info("Welcome showAddNewPurchase");
		model.addAttribute("supplier", supplierServiceI.getSupplierById(sid));
		model.addAttribute("allProductsList", viewAddProductsServiceI.getAllProductList());
		pruchaseOrderProductMap.clear();
		purchaseOrderProductPaymentMap.clear();
		return "purchase/newPurchaseOrder";
	}
	
	@RequestMapping(value = "/getInventoryProductByName/{productName}", method = RequestMethod.GET)
	@ResponseBody
	public InventoryProduct getInventoryProductByName(@PathVariable("productName") String productName, Locale locale, Model model) {
		logger.info("Welcome getInventoryProductByName");
		InventoryProduct iProduct = inventoryProductServiceI.getInventoryProductByName(productName);
		return iProduct;
	}

	@RequestMapping(value = "/addToPruchaseOrderProductMap", method = RequestMethod.POST)
	@ResponseBody
	public String addToPruchaseOrderProductMap(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome addToPruchaseOrderProductMap");
		String productName =  request.getParameter("productName");
		Double costPrice = Double.parseDouble(request.getParameter("costPrice"));
		Double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
		Integer quantities = Integer.parseInt(request.getParameter("quantities"));
		Double totalQuantityPrice = Double.parseDouble(request.getParameter("totalQuantityPrice"));
		
		PurchaseProduct purchaseProduct = new PurchaseProduct();
		purchaseProduct.setPurchaseProduct_name(productName);
		purchaseProduct.setPurchaseProduct_cost_price(costPrice);
		purchaseProduct.setPurchaseProduct_selling_price(sellingPrice);
		purchaseProduct.setPurchaseProduct_quantity(quantities);
		purchaseProduct.setPurchaseProduct_quantity_price(totalQuantityPrice);
		purchaseProduct.setPurchaseProduct_create_date(DateFormate.dateTimeToString(new Date()));
		getPruchaseOrderProductMap().put(productName, purchaseProduct);
		
		return JsonUtil.convertToJson("success");
	}
	
	@RequestMapping(value = "/removeProductFromMap", method = RequestMethod.GET)
	@ResponseBody
	public String removeProductFromMap(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome removeProductFromMap");
		String productName = request.getParameter("productName");
		if(pruchaseOrderProductMap.size() > 1){
			pruchaseOrderProductMap.remove(productName);
			return  JsonUtil.convertToJson("success");
		}
		pruchaseOrderProductMap.remove(productName);
		return  JsonUtil.convertToJson("Empty");	
	}
	
	@RequestMapping(value = "/getTotalProductsInMap", method = RequestMethod.GET)
	@ResponseBody
	public Integer getTotalProductsInMap(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome getTotalProductsInMap");
		Integer totalProductsInMaps = 0;
		totalProductsInMaps += pruchaseOrderProductMap.size();
		return  totalProductsInMaps;	
	}
	
	@RequestMapping(value = "/getTotalProductQuantitiesInMap", method = RequestMethod.GET)
	@ResponseBody
	public Integer getTotalProductQuantitiesInMap(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome getTotalProductQuantitiesInMap");
		Integer totalProductQuantitiesInMaps = 0;
		
		List<PurchaseProduct> purchaseProducts = new ArrayList<PurchaseProduct>();
		purchaseProducts.clear();
		for (Map.Entry<String, PurchaseProduct> entry : pruchaseOrderProductMap.entrySet()) {
			purchaseProducts.add(entry.getValue());
		}
		
		for (PurchaseProduct purchaseProduct : purchaseProducts) {
			totalProductQuantitiesInMaps += purchaseProduct.getPurchaseProduct_quantity();
		}
		return  totalProductQuantitiesInMaps;	
	}
	
	
	@RequestMapping(value = "/saveComplatePurchaseOrder/{sid}", method = RequestMethod.POST)
	@ResponseBody
	public String saveComplatePurchaseOrder(@PathVariable("sid") Integer sid, Locale locale, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome saveComplatePurchaseOrder");
		System.out.println("Map = "+pruchaseOrderProductMap );
		Double totalAmtBeforeDiscount = Double.parseDouble(request.getParameter("totalAmtBeforeDiscount"));
		Double discountAmt = Double.parseDouble(request.getParameter("discountAmt"));
		Double totalAmtAfterDiscount = Double.parseDouble(request.getParameter("totalAmtAfterDiscount"));
		Double paymentAmt = Double.parseDouble(request.getParameter("paymentAmt"));
		Double balanceAmt = Double.parseDouble(request.getParameter("balanceAmt"));
		String paidMethod = request.getParameter("paidMethod");
		
		List<PurchaseProduct> purchaseProducts = new ArrayList<PurchaseProduct>();
		purchaseProducts.clear();
		for(Map.Entry<String, PurchaseProduct> entry : pruchaseOrderProductMap.entrySet()){
			purchaseProducts.add(entry.getValue());
		}
		
		// add or update inventory product start
		for (PurchaseProduct purchaseProduct : purchaseProducts) {
			String productName = purchaseProduct.getPurchaseProduct_name();
			InventoryProduct inventoryProduct = inventoryProductServiceI.getInventoryProductByName(productName);
			
			// if purchase product already available in inventory product then update its data else save whole purchase product in inventory product
			if(inventoryProduct.getInventoryProduct_id() == null ){
				//save purchase product in inventory product
				inventoryProduct.setInventoryProduct_name(purchaseProduct.getPurchaseProduct_name());
				inventoryProduct.setInventoryProduct_cost_price(purchaseProduct.getPurchaseProduct_cost_price());
				inventoryProduct.setInventoryProduct_quantity(purchaseProduct.getPurchaseProduct_quantity());
				inventoryProduct.setInventoryProduct_create_date(DateFormate.dateTimeToString(new Date()));
				inventoryProduct.setInventoryProduct_last_modified_date("");
				Integer i = inventoryProductServiceI.saveInventoryProduct(inventoryProduct);
				if(i>0){
					System.out.println(productName+" save successfully in inventory " );
				}
			}
			else{
				inventoryProduct.setInventoryProduct_quantity( inventoryProduct.getInventoryProduct_quantity()+purchaseProduct.getPurchaseProduct_quantity());
				inventoryProduct.setInventoryProduct_cost_price(purchaseProduct.getPurchaseProduct_cost_price());
//				Integer i = inventoryProductServiceI.updateInventoryProduct(inventoryProduct.getInventoryProduct_id(), 
//						inventoryProduct.getInventoryProduct_quantity(), inventoryProduct.getInventoryProduct_cost_price(), 
//						inventoryProduct.getInventoryProduct_selling_price());
//				if(i>0){
//					System.out.println(productName+" update successfully in inventory " );
//				}
			}
		}
		// add or update inventory product end
		
		//purchasePayment start
		List<PurchasePayment> purchasePayments = new ArrayList<PurchasePayment>();
		PurchasePayment purchasePayment = new PurchasePayment();
		Integer purchasePaymentMaxId = purchasePaymentServiceI.getPurchasePaymentMaxId();
		if(purchasePaymentMaxId==0){
			purchasePaymentMaxId=1;
		}else{
			purchasePaymentMaxId = purchasePaymentMaxId+1;
		}
		purchasePayment.setPurchasePayment_id(purchasePaymentMaxId);
		purchasePayment.setPurchasePayment_total_amount(totalAmtAfterDiscount);
		purchasePayment.setPurchasePayment_balance_amount(balanceAmt);
		purchasePayment.setPurchasePayment_paid_amount(paymentAmt);
		purchasePayment.setPurchasePayment_paid_method(paidMethod);
		purchasePayment.setPurchasePayment_paid_amount_date(DateFormate.dateTimeToString(new Date()));
		purchasePayments.add(purchasePayment);
		//purchasePayment end
		
		//purchaseProduct with new id start
		//List<PurchaseProduct> purchaseProductsWithId = new ArrayList<PurchaseProduct>();
		Integer totalProductQuantities= 0;
		for (PurchaseProduct purchaseProduct : purchaseProducts) {
			//Integer purchaseProductMaxId = purchaseProductServiceI.getPurchaseProductMaxId();
//			if(purchaseProductMaxId==0){
//				purchaseProductMaxId=1;
//			}else{
//				purchaseProductMaxId = purchaseProductMaxId+1;
//			}
//			purchaseProduct.setPurchaseProduct_id(purchaseProductMaxId);
//			purchaseProductsWithId.add(purchaseProduct);
			totalProductQuantities += purchaseProduct.getPurchaseProduct_quantity();
		}
		//purchaseProduct with new id end
		
		//purchaseOrder start
		List<PurchaseOrder> purchaseOrders = new ArrayList<PurchaseOrder>();
		purchaseOrders.clear();
		PurchaseOrder purchaseOrder = new PurchaseOrder();
		Integer purchaseOrderMaxId = purchaseOrderServiceI.getPurchaseOrderMaxId();
		if(purchaseOrderMaxId==0){
			purchaseOrderMaxId=1;
		}else{
			purchaseOrderMaxId = purchaseOrderMaxId+1;
		}
		
		Integer purchaseOrderNum = purchaseOrderServiceI.getMaxPurchseOrderNumber();
		if (purchaseOrderNum == 0) {
			purchaseOrderNum = 1001;
		} else {
			purchaseOrderNum = purchaseOrderNum+1;
		}
		purchaseOrder.setPurchaseOrder_id(purchaseOrderMaxId);
		purchaseOrder.setPurchaseOrder_number(purchaseOrderNum);
		purchaseOrder.setPurchaseOrder_total_price_before_discount(totalAmtBeforeDiscount);
		purchaseOrder.setPurchaseOrder_discount(discountAmt);
		purchaseOrder.setPurchaseOrder_total_price_after_discount(totalAmtAfterDiscount);
		purchaseOrder.setPurchaseOrder_paid_amount(paymentAmt);
		purchaseOrder.setPurchaseOrder_balance_amount(balanceAmt);
		purchaseOrder.setPurchaseProducts(purchaseProducts);
		purchaseOrder.setPurchaseOrder_date(DateFormate.dateTimeToString(new Date()));
		purchaseOrder.setPurchaseOrder_total_products(pruchaseOrderProductMap.size());
		purchaseOrder.setPurchaseOrder_total_quantities(totalProductQuantities);
		purchaseOrder.setPurchasePayments(purchasePayments);
		purchaseOrders.add(purchaseOrder);
		//purchaseOrder end
		
		Supplier supplier = supplierServiceI.getSupplierById(sid);
		supplier.getPurchaseOrders().add(purchaseOrder);
		Integer status = supplierServiceI.mergePurchaseOrderToSupplier(supplier);
		if(status > 0){
			return  JsonUtil.convertToJson("success");	
		}
		return  JsonUtil.convertToJson("Failed to save purchase order. please try again.");	
	}
	
	@RequestMapping(value = "/getAllPurchaseOrders", method = RequestMethod.GET)
	public String getAllPurchaseOrders(Locale locale, Model model) {
		logger.info("Welcome getAllPurchaseOrders");
		model.addAttribute("allPurchaseOrderList", purchaseOrderServiceI.getAllPurchaseOrders());
		return "purchase/purchaseOrderList";
	}
}
