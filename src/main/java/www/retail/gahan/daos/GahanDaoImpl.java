package www.retail.gahan.daos;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.beans.Customer;
import www.retail.gahan.beans.Gahan;

public class GahanDaoImpl implements GahanDaoI {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Integer getGahanMaxId() {
		Integer i = 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Criteria criteria = session.createCriteria(Gahan.class).setProjection(Projections.max("gahan_id"));
			i = (Integer)criteria.uniqueResult();
			transaction.commit();
			session.close();
			System.out.println("i:"+i);
			if (i==null) {
				return i=0;
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
	public Integer getMaxGahanNumber() {
		Integer i=0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Criteria criteria = session.createCriteria(Gahan.class).setProjection(Projections.max("gahan_number"));
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
		session.close();
		return i;
	}

	@Override
	public List<Gahan> getAllGahans() {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Gahan> gahanList = session.createQuery("From www.retail.gahan.beans.Gahan Order by gahan_number DESC").list();
		return gahanList;
	}

	@Override
	public Integer mergeGahanToCustomer(Customer customer) {
		Integer flag = null;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Customer c1 = (Customer) session.merge(customer);
			transaction.commit();
			session.close();
			if(c1 != null){
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
	public Gahan getGahanByGahanNumber(Integer gahanNumber) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("From  www.retail.gahan.beans.Gahan where gahan_number = :gahanNumber");
			query.setParameter("gahanNumber", gahanNumber);
			Gahan gahan = (Gahan) query.uniqueResult();
			transaction.commit();
			return gahan;
	}

	@Override
	public Integer mergeGahanPaymentToGahan(Gahan gahan) {
		Integer flag = null;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Gahan g = (Gahan) session.merge(gahan);
			transaction.commit();
			session.close();
			if(g != null){
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
	public Long getTotalActiveGahanCount() {
		Long count = (long) 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			count =  (long) ( (Number) session.createQuery("select count(*) from www.retail.gahan.beans.Gahan where gahan_status='active'").iterate().next() ).longValue();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return count;
	}

	@Override
	public Integer deactivateGahan(Integer gnum) {
		String action= "Deactivate";
		String hql = "update Gahan set gahan_status :action where gahan_number = :gnum";
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			query.setParameter("action", action);
			query.setParameter("gnum", gnum);
			Integer i = query.executeUpdate();
			transaction.commit();
			session.close();
			if(i > 0){
				return i=1;
			}else{
				return i=0;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List monthlyActiveGahanCountReport() {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String mySqlFunctionQuery = "select date_format(str_to_date(`gahan_making_date`,'%h:%i %p %b-%d-%Y'), '%b-%Y') as `monthYear`, count(*) as activeGahanCount from gahan where gahan_status='active'  group by date_format(str_to_date(`gahan_making_date`,'%h:%i %p %b-%d-%Y'), '%m-%Y')";
		try {
			SQLQuery sqlQuery = session.createSQLQuery(mySqlFunctionQuery);
			sqlQuery.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List recevableList=sqlQuery.list();
			transaction.commit();
			session.close();
			if (recevableList!=null) {
				return recevableList;
			}
			
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return new ArrayList();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List monthlyDeactivatedGahanCountReport() {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String mySqlFunctionQuery = "select date_format(str_to_date(`gahan_making_date`,'%h:%i %p %b-%d-%Y'), '%b-%Y') as `monthYear`, count(*) as activeGahanCount from gahan where gahan_status='Deactivate'  group by date_format(str_to_date(`gahan_making_date`,'%h:%i %p %b-%d-%Y'), '%m-%Y')";
		try {
			SQLQuery sqlQuery = session.createSQLQuery(mySqlFunctionQuery);
			sqlQuery.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List recevableList=sqlQuery.list();
			transaction.commit();
			session.close();
			if (recevableList!=null) {
				return recevableList;
			}
			
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return new ArrayList();
	}

}
