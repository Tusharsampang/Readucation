package in.co.book.store.model;

import java.sql.*;
import in.co.book.store.bean.ContactBean;
import in.co.book.store.util.JDBCDataSource;

public class ContactModel {

	public long add(ContactBean bean) throws Exception {
	    Connection conn = null;
	    PreparedStatement ps = null;
	    long pk = 0;

	    try {
	        conn = JDBCDataSource.getConnection();
	        conn.setAutoCommit(false);

	        // Set default timestamps if null
	        Timestamp created = bean.getCreatedDatetime() != null
	            ? bean.getCreatedDatetime()
	            : new Timestamp(System.currentTimeMillis());

	        Timestamp modified = bean.getModifiedDatetime() != null
	            ? bean.getModifiedDatetime()
	            : new Timestamp(System.currentTimeMillis());

	        ps = conn.prepareStatement(
	        	    "INSERT INTO BS_CONTACT (NAME, EMAIL, MESSAGE, CREATED_DATETIME, MODIFIED_DATETIME) " +
	        	    "VALUES (?, ?, ?, ?, ?)",
	        	    Statement.RETURN_GENERATED_KEYS
	        	);

	        ps.setString(1, bean.getName());
	        ps.setString(2, bean.getEmail());
	        ps.setString(3, bean.getMessage());
	       
	        ps.setTimestamp(4, created);
	        ps.setTimestamp(5, modified);

	        ps.executeUpdate();

	        ResultSet rs = ps.getGeneratedKeys();
	        if (rs.next()) {
	            pk = rs.getLong(1);
	        }

	        conn.commit();
	        ps.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	        if (conn != null) conn.rollback();
	        throw e;
	    } finally {
	        JDBCDataSource.closeConnection(conn);
	    }

	    return pk;
	}

    
}
