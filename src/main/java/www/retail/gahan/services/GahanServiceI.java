package www.retail.gahan.services;

import java.util.List;

import www.retail.gahan.beans.Customer;
import www.retail.gahan.beans.Gahan;

public interface GahanServiceI {

	public Integer getGahanMaxId();

	public Integer getMaxGahanNumber();

	public List<Gahan> getAllGahans();

	public Integer mergeGahanToCustomer(Customer customer);

	public Gahan getGahanByGahanNumber(Integer gahanNumber);

	public Integer mergeGahanPaymentToGahan(Gahan gahan);

	public Long getTotalActiveGahanCount();

	public Integer deactivateGahan(Integer gnum);

	@SuppressWarnings("rawtypes")
	public List monthlyActiveGahanCountReport();

	@SuppressWarnings("rawtypes")
	public List monthlyDeactivatedGahanCountReport();

}
