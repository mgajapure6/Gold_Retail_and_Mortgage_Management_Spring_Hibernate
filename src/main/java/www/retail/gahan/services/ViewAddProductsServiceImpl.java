package www.retail.gahan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.beans.Product;
import www.retail.gahan.daos.ViewAddProductsDaoI;

public class ViewAddProductsServiceImpl implements ViewAddProductsServiceI {
	@Autowired
	private ViewAddProductsDaoI viewAddProductsDaoI;
	
	

	public void setViewAddProductsDaoI(ViewAddProductsDaoI viewAddProductsDaoI) {
		this.viewAddProductsDaoI = viewAddProductsDaoI;
	}

	@Override
	public List<Product> getAllProductList() {
		return viewAddProductsDaoI.getAllProductList();
	}

	@Override
	public boolean isProductExist(String pname,String mtype) {
		return viewAddProductsDaoI.isProductExist(pname,mtype);
	}

	@Override
	public Integer addProductToList(Product product) {
		return viewAddProductsDaoI.addProductToList(product);
	}

}
