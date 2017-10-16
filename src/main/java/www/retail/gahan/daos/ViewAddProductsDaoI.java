package www.retail.gahan.daos;

import java.util.List;

import www.retail.gahan.beans.Product;

public interface ViewAddProductsDaoI {

	public Integer addProductToList(Product product);

	public boolean isProductExist(String pname,String mtype);

	public List<Product> getAllProductList();

}
