package www.retail.gahan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.beans.InventoryProduct;
import www.retail.gahan.daos.InventoryProductDaoI;

public class InventoryProductServiceImpl implements InventoryProductServiceI {
	
	@Autowired
	private InventoryProductDaoI inventoryProductDaoI;

	public void setInventoryProductDaoI(InventoryProductDaoI inventoryProductDaoI) {
		this.inventoryProductDaoI = inventoryProductDaoI;
	}

	@Override
	public List<InventoryProduct> getAllInventoryProducts() {
		return inventoryProductDaoI.getAllInventoryProducts();
	}

	@Override
	public InventoryProduct getInventoryProductByName(String productName) {
		return inventoryProductDaoI.getInventoryProductByName(productName);
	}

	@Override
	public Integer updateInventoryProduct(Integer inventoryProduct_id, Integer inventoryProduct_quantity,
			Double inventoryProduct_cost_price, Double inventoryProduct_selling_price) {
		return inventoryProductDaoI.updateInventoryProduct(inventoryProduct_id,inventoryProduct_quantity,
				inventoryProduct_cost_price, inventoryProduct_selling_price);
	}

	@Override
	public Integer saveInventoryProduct(InventoryProduct inventoryProduct) {
		Integer inventoryProductMaxId = inventoryProductDaoI.getInventoryProductMaxId();
		if(inventoryProductMaxId==0){
			inventoryProductMaxId=1;
		}else{
			inventoryProductMaxId = inventoryProductMaxId+1;
		}
		inventoryProduct.setInventoryProduct_id(inventoryProductMaxId);
		return inventoryProductDaoI.saveInventoryProduct(inventoryProduct);
	}

	@Override
	public Integer getInventoryProductMaxId() {
		return inventoryProductDaoI.getInventoryProductMaxId();
	}

	@Override
	public Integer updateInventoryProduct(Integer ipid, int i) {
		return null;
	}

}
