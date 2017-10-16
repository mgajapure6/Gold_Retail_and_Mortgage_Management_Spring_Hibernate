package www.retail.gahan.services;

import java.util.List;

import www.retail.gahan.beans.Product;

public interface ViewAddProductsServiceI {

	public List<Product> getAllProductList();

	public boolean isProductExist(String pname,String mtype);

	public Integer addProductToList(Product product);

}
