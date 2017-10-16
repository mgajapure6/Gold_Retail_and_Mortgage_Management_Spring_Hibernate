package www.retail.gahan.daos;

import java.util.List;
import www.retail.gahan.beans.Supplier;

public interface SupplierDaoI {
	
	public Integer getSupplierMaxId();

	public Integer getSupplierIdByMobile(String supplier_mobile);

	public Integer saveSupplier(Supplier supplier);

	public Supplier getSupplierById(Integer sid);
	
	public List<Supplier> getAllSuppliers();

	public Integer mergePurchaseOrderToSupplier(Supplier supplier);

	public Integer updateSupplier(Supplier supplier);

}
