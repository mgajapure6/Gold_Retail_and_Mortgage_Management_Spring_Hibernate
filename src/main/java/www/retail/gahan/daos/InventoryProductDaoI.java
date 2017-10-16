package www.retail.gahan.daos;

import java.util.List;

import www.retail.gahan.beans.InventoryProduct;


public interface InventoryProductDaoI {

	public List<InventoryProduct> getAllInventoryProducts();

	public InventoryProduct getInventoryProductByName(String productName);

	public Integer updateInventoryProduct(Integer inventoryProduct_id, Integer inventoryProduct_quantity,
			Double inventoryProduct_cost_price, Double inventoryProduct_selling_price);

	public Integer saveInventoryProduct(InventoryProduct inventoryProduct);

	public Integer getInventoryProductMaxId();

}
