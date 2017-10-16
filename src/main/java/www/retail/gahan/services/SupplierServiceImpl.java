package www.retail.gahan.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import www.retail.gahan.beans.Supplier;
import www.retail.gahan.daos.SupplierDaoI;
import www.retail.gahan.utility.DateFormate;

public class SupplierServiceImpl implements SupplierServiceI {
	
	@Autowired
	private SupplierDaoI supplierDaoI;

	public void setSupplierDaoI(SupplierDaoI supplierDaoI) {
		this.supplierDaoI = supplierDaoI;
	}
	
	

	@Override
	public Integer getSupplierIdByMobile(String supplier_mobile) {
		return supplierDaoI.getSupplierIdByMobile(supplier_mobile);
	}

	@Override
	public Integer saveSupplier(Supplier supplier) {
		Integer maxId = supplierDaoI.getSupplierMaxId();
		if (maxId == 0 || maxId == null) {
			maxId = 1;
		} else {
			maxId = maxId+1;
		}
		supplier.setSupplier_id(maxId);
		supplier.setSupplier_create_date(DateFormate.dateTimeToString(new Date()));
		supplier.setSupplier_last_modified_date("");
		Integer flag =supplierDaoI.saveSupplier(supplier);
		if (flag!=null && flag>0 ) {
			return flag=1;
		}
		return flag=0;
	}

	@Override
	public Supplier getSupplierById(Integer sid) {
		return supplierDaoI.getSupplierById(sid);
	}



	@Override
	public Integer mergePurchaseOrderToSupplier(Supplier supplier) {
		return supplierDaoI.mergePurchaseOrderToSupplier(supplier);
	}



	@Override
	public List<Supplier> getAllSuppliers() {
		return supplierDaoI.getAllSuppliers();
	}



	@Override
	public Integer updateSupplier(Supplier supplier) {
		return supplierDaoI.updateSupplier(supplier);
	}

}
