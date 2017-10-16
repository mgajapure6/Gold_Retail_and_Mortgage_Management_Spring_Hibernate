package www.retail.gahan.daos;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import www.retail.gahan.beans.Product;

public class ViewAddProductsDaoImpl implements ViewAddProductsDaoI {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Integer addProductToList(Product product) {
		Integer flag = null;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			flag = (Integer) session.save(product);
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

	@SuppressWarnings("unchecked")
	@Override
	public boolean isProductExist(String pname, String mtype) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery("from www.retail.gahan.beans.Product where product_name=:pname and product_metal_type=:mtype");
			query.setParameter("pname", pname);
			query.setParameter("pname", mtype);
			List<Product> products =query.list();
			transaction.commit();
			session.close();
			if (!products.isEmpty()  && products!=null) {
				return true;
			}
		} catch (HibernateException e) {
			transaction.rollback();
			session.close();
			return false;
		}
		return false;	
	}

	@Override
	public List<Product> getAllProductList() {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Product> plist = session.createQuery("From www.retail.gahan.beans.Product").list();
		return plist;
	}

}
