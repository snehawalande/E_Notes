package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.DAO.postDAO;
import com.Db.DBConnect;
import com.User.Post;

@WebServlet("/addNote")
public class addNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		postDAO dao = new postDAO(DBConnect.getConn());
		boolean f =dao.AddNotes(title, content, uid);
		HttpSession session = request.getSession();
		if(f) {
		  session.setAttribute("msg", "data added successfully");
		  response.sendRedirect("addNotes.jsp");
		}
		else {
			  session.setAttribute("msg", "data added successfully");
			  response.sendRedirect("addNotes.jsp");
		}
	}

}
