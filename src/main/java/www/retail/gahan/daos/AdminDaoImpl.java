package www.retail.gahan.daos;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import www.retail.gahan.beans.Admin;

public class AdminDaoImpl implements AdminDaoI {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("finally")
	@Override
	public Integer saveAdmin(Admin admin) {
		Integer flag = 0;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			flag = (Integer) session.save(admin);
			transaction.commit();
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		}finally {
			session.close();
			return flag;
		}
	}

	@Override
	public Admin adminLogin(Admin admin) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		System.out.println(admin.getAdmin_password());
		String hql = "from www.retail.gahan.beans.Admin as a where a.admin_username =? and a.admin_password =?";
		try {
			Query query = session.createQuery(hql);
			query.setParameter(0, admin.getAdmin_username());
			query.setParameter(1, admin.getAdmin_password());
			admin = (Admin) query.uniqueResult();
			transaction.commit(); 
			session.close();
			return admin;
		} catch (HibernateException e) {
			transaction.rollback();
			session.close();
		}
		return admin;
	}

	@Override
	public Admin adminLock(Admin admin) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String hql = "from www.retail.gahan.beans.Admin as a where a.admin_name =? and a.admin_password =?";
		try {
			Query query = session.createQuery(hql);
			query.setParameter(0, admin.getAdmin_name());
			query.setParameter(1, admin.getAdmin_password());
			admin = (Admin) query.uniqueResult();
			transaction.commit();
			session.close();
		} catch (HibernateException e) {
			transaction.rollback();
			session.close();
		}
		return admin;
	}

	@Override
	public boolean isAdminExist() {
		Integer count;
		System.out.println("DAO isAdminExist executed");
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			count =  (Integer) ( (Number) session.createQuery("select count(*) from www.retail.gahan.beans.Admin").iterate().next() ).intValue();
			transaction.commit();
			session.close();
			if (count >0  && count!=null) {
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
	public Long countTotalCustomers() {
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

	@Override
	public String getPassword(Integer aid) {
		Session session = sessionFactory.openSession();
		String pass = "";
		Transaction transaction = session.beginTransaction();
		String hql = "select a.admin_password from www.retail.gahan.beans.Admin as a where a.admin_id =?";
		try {
			Query query = session.createQuery(hql);
			query.setParameter(0, aid);
			pass = (String) query.uniqueResult();
			transaction.commit();
			session.close();
		} catch (HibernateException e) {
			transaction.rollback();
			session.close();
		}
		return pass;
	}

	@Override
	public String changePassword(String newPassword, Integer aid) {
		Session session = sessionFactory.openSession();
		String hql = "update Admin set admin_password = :newPass where admin_id = :aid";
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			query.setParameter("newPass",newPassword );
			query.setParameter("aid",aid );
			int rowsAffected = query.executeUpdate();
			transaction.commit();
			session.close();
			if (rowsAffected > 0) {
				return "New Password updated successfully";
			}
			
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
			session.close();
			return "failed to update new password";
		}
		return "failed to update new password";
	}

}
