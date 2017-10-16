package www.retail.gahan.services;

import java.util.List;

import www.retail.gahan.beans.Supplier;

public interface SupplierServiceI {

	public Integer getSupplierIdByMobile(String supplier_mobile);

	public Integer saveSupplier(Supplier supplier);

	public Supplier getSupplierById(Integer sid);

	public Integer mergePurchaseOrderToSupplier(Supplier supplier);

	public List<Supplier> getAllSuppliers();

	public Integer updateSupplier(Supplier supplier);

}
