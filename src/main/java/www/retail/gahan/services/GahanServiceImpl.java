package www.retail.gahan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.beans.Customer;
import www.retail.gahan.beans.Gahan;
import www.retail.gahan.daos.GahanDaoI;

public class GahanServiceImpl implements GahanServiceI {

	@Autowired
	private GahanDaoI gahanDaoI;
	
	public void setGahanDaoI(GahanDaoI gahanDaoI) {
		this.gahanDaoI = gahanDaoI;
	}

	@Override
	public Integer getGahanMaxId() {
		System.out.println("from service");
		return gahanDaoI.getGahanMaxId();
	}

	@Override
	public Integer getMaxGahanNumber() {
		return gahanDaoI.getMaxGahanNumber();
	}

	@Override
	public List<Gahan> getAllGahans() {
		return gahanDaoI.getAllGahans();
	}

	@Override
	public Integer mergeGahanToCustomer(Customer customer) {
		return gahanDaoI.mergeGahanToCustomer(customer);
	}

	@Override
	public Gahan getGahanByGahanNumber(Integer gahanNumber) {
		return gahanDaoI.getGahanByGahanNumber(gahanNumber);
	}

	@Override
	public Integer mergeGahanPaymentToGahan(Gahan gahan) {
		return gahanDaoI.mergeGahanPaymentToGahan(gahan);
	}

	@Override
	public Long getTotalActiveGahanCount() {
		return gahanDaoI.getTotalActiveGahanCount();
	}

	@Override
	public Integer deactivateGahan(Integer gnum) {
		return gahanDaoI.deactivateGahan(gnum);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List monthlyActiveGahanCountReport() {
		return gahanDaoI.monthlyActiveGahanCountReport();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List monthlyDeactivatedGahanCountReport() {
		return gahanDaoI.monthlyDeactivatedGahanCountReport();
	}

}
