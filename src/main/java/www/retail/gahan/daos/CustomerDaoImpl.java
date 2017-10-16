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

public class CustomerDaoImpl implements CustomerDaoI {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public String getCustomerMobileByMobile(String customer_mobile) {
		String i;
		Session session = sessionFactory.openSession();
		String hql = "select customer_mobile from www.retail.gahan.beans.Customer where customer_mobile = ?";
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			query.setParameter(0, customer_mobile);
			i= (String) query.uniqueResult();
			transaction.commit();
			session.close();
			if (i!=null) {
				return i;
			}else{
				return i="0";
			}
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			session.close();
		}
		return i="0";
	}

	@Override
	public Integer saveCustomer(Customer customer) {
		Integer flag = null;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			flag = (Integer) session.save(customer);
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
	public Integer getCustomerMaxId() {
		Integer i = 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Criteria criteria = session.createCriteria(Customer.class).setProjection(Projections.max("customer_id"));
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
	public Customer getCustomerById(Integer cid) {
		Session session = sessionFactory.openSession();
		Customer customer = (Customer) session.get(Customer.class, cid);
		return customer;
	}
	
	@Override
	public List<Customer> getAllCustomers() {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Customer> clist = session.createQuery("From www.retail.gahan.beans.Customer").list();
		return clist;
	}

	@Override
	public Integer mergeSalesOrderToCustomer(Customer customer) {
		Integer flag = null;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Customer customer1 = (Customer) session.merge(customer);
			transaction.commit();
			session.close();
			if(customer1 != null){
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
	public Integer updateCustomer(Customer customer) {
		Integer cid = customer.getCustomer_id();
		String cname = customer.getCustomer_name();
		String cgender = customer.getCustomer_gender();
		String cemail = customer.getCustomer_email();
		String cmob = customer.getCustomer_mobile();
		String caddress = customer.getCustomer_full_address();
		String cimagename = customer.getCustomer_image_name();
		String cstatus = customer.getCustomer_status();
		String hql = "update Customer set customer_name =:cname, customer_gender =:cgender,  customer_email =:cemail, customer_mobile =:cmob,"
				+ "customer_full_address =:caddress, customer_image_name =:cimagename,  customer_status =:cstatus where customer_id =:cid";
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			query.setParameter("cid", cid);
			query.setParameter("cname", cname);
			query.setParameter("cgender", cgender);
			query.setParameter("cemail", cemail);
			query.setParameter("cmob", cmob);
			query.setParameter("caddress", caddress);
			query.setParameter("cstatus", cstatus);
			query.setParameter("cimagename", cimagename);
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

	@Override
	public Long getTotalCustomersCount() {
		Long count = (long) 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			count =  (long) ( (Number) session.createQuery("select count(*) from www.retail.gahan.beans.Customer").iterate().next() ).longValue();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			transaction.rollback();
			session.close();
		}
		return count;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List monthlyCustomerCountReport() {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String mySqlFunctionQuery = "select date_format(str_to_date(`customer_create_date`,'%h:%i %p %b-%d-%Y'), '%b-%Y') as `monthYear`, count(*) as customerCount from customer group by date_format(str_to_date(`customer_create_date`,'%h:%i %p %b-%d-%Y'), '%m-%Y')";
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
