package com.Servlet;

import java.sql.Connection;

import org.apache.catalina.connector.Response;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
   public void doPost(HttpServletRequest request, HttpServletResponse responce) throws  ServletException,IOException
   {
	   String name = request.getParameter("fname");
	   String email = request.getParameter("uemail");
	   String password = request.getParameter("upassword");
	   
	   UserDetails us = new UserDetails();
	   us.setName(name);
	   us.setEmail(email);
	   us.setPassword(password);
	   
	   UserDAO dao= new UserDAO(DBConnect.getConn());
	   boolean f=  dao.addUser(us);
	   HttpSession session;
	   
	   if(f) {
          session = request.getSession();
          session.setAttribute("reg-sucess","Registraion successfully...");
          responce.sendRedirect("register.jsp");  
          }
	   
	   else {
		   session = request.getSession();
	        session.setAttribute("reg-fail","Sorry, Something went wrong...");
	        responce.sendRedirect("register.jsp");
	   }
	   
	   
   }
}
