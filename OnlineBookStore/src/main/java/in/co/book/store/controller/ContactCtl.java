package in.co.book.store.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.book.store.bean.BaseBean;
import in.co.book.store.bean.ContactBean;
import in.co.book.store.model.ContactModel;
import in.co.book.store.util.DataUtility;
import in.co.book.store.util.ServletUtility;

@WebServlet(name = "ContactCtl", urlPatterns = {"/ContactCtl"})
public class ContactCtl extends BaseCtl {

    public static final String OP_SAVE = "Send";
    public static final String OP_RESET = "Reset";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = DataUtility.getString(request.getParameter("operation"));

        if (OP_SAVE.equalsIgnoreCase(op)) {
            ContactBean bean = (ContactBean) populateBean(request);

            try {
                ContactModel model = new ContactModel();
                model.add(bean);
                ServletUtility.setSuccessMessage("Message sent successfully!", request);
            } catch (Exception e) {
                e.printStackTrace();
                ServletUtility.setErrorMessage("Unable to send message.", request);
            }

            // ✅ Use getView() to ensure correct JSP is forwarded
            ServletUtility.forward(getView(), request, response);
        } else if (OP_RESET.equalsIgnoreCase(op)) {
            ServletUtility.redirect("ContactCtl", request, response);
        }
    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        ContactBean bean = new ContactBean();

        bean.setId(DataUtility.getLong(request.getParameter("id")));
        bean.setName(DataUtility.getString(request.getParameter("name")));
        bean.setEmail(DataUtility.getString(request.getParameter("email")));
        bean.setMessage(DataUtility.getString(request.getParameter("message")));

      
        bean.setCreatedDatetime(DataUtility.getTimestamp(request.getParameter("createdDatetime")));
        bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

        return bean;
    }

    @Override
    protected String getView() {
        // ✅ Make sure this file exists in WebContent/jsp/
        return "/jsp/ContactView.jsp";
    }
}
