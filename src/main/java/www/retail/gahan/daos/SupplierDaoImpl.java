package www.retail.gahan.daos;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import www.retail.gahan.beans.Supplier;

public class SupplierDaoImpl implements SupplierDaoI {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Integer getSupplierIdByMobile(String supplier_mobile) {
		Integer i=0;
		Session session = sessionFactory.openSession();
		String hql = "select supplier_id from www.retail.gahan.beans.Supplier where supplier_mobile = ?";
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			query.setParameter(0, supplier_mobile);
			i= (Integer) query.uniqueResult();
			transaction.commit();
			session.close();
			if (i!=null) {
				return i=1;
			}else{
				return i=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			session.close();
		}
		return i=0;
	}

	@Override
	public Integer saveSupplier(Supplier supplier) {
		Integer flag = null;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			flag = (Integer) session.save(supplier);
			transaction.commit();
			session.close();
			if(flag>0){
				return flag=1;
			}else{
				return flag=0;
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		}
		return flag;
	}
	
	@Override
	public Integer getSupplierMaxId() {
		Integer i = 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Criteria criteria = session.createCriteria(Supplier.class).setProjection(Projections.max("supplier_id"));
			i = (Integer)criteria.uniqueResult();
			transaction.commit();
			session.close();
			if (i==null) {
				return 0;
			} else {
				return i;
			}
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return i;
	}

	@Override
	public Supplier getSupplierById(Integer sid) {
		Session session = sessionFactory.openSession();
		Supplier supplier = (Supplier) session.get(Supplier.class, sid);
		return supplier;
	}
	
	@Override
	public List<Supplier> getAllSuppliers() {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Supplier> slist = session.createQuery("From www.retail.gahan.beans.Supplier").list();
		return slist;
	}

	@Override
	public Integer mergePurchaseOrderToSupplier(Supplier supplier) {
		Integer flag = null;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Supplier supplier1 = (Supplier) session.merge(supplier);
			transaction.commit();
			session.close();
			if(supplier1 != null){
				return flag=1;
			}else{
				return flag=0;
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public Integer updateSupplier(Supplier supplier) {
		Integer sid = supplier.getSupplier_id();
		String sname = supplier.getSupplier_name();
		String sgender = supplier.getSupplier_gender();
		String semail = supplier.getSupplier_email();
		String smob = supplier.getSupplier_mobile();
		String scompany = supplier.getSupplier_company_name();
		String saddress = supplier.getSupplier_full_address();
		String slicenceno = supplier.getSupplier_licence_number();
		String simagename = supplier.getSupplier_image_name();
		String sstatus = supplier.getSupplier_status();
		String hql = "update Supplier set supplier_name =:sname, supplier_gender =:sgender,  supplier_email =:semail, supplier_mobile =:smob,"
				+ "supplier_company_name =:scompany, supplier_full_address =:saddress, supplier_licence_number =:slicenceno,"
				+ "supplier_image_name =:simagename,  supplier_status =:sstatus where supplier_id =:sid";
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			query.setParameter("sid", sid);
			query.setParameter("sname", sname);
			query.setParameter("sgender", sgender);
			query.setParameter("semail", semail);
			query.setParameter("smob", smob);
			query.setParameter("scompany", scompany);
			query.setParameter("saddress", saddress);
			query.setParameter("slicenceno", slicenceno);
			query.setParameter("sstatus", sstatus);
			query.setParameter("simagename", simagename);
			Integer i = query.executeUpdate();
			transaction.commit();
			session.close();
			if(i > 0){
				return i=1;
			}else{
				return i=0;
			}
		} catch (Exception e) {
			transaction.rollback();;
			session.close();
		}
		return 0;
	}

}
