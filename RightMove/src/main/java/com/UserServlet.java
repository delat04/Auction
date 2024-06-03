package com;

import java.io.IOException;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("signup".equals(action)) {
            signUp(request, response);
        } else if ("login".equals(action)) {
            login(request, response);
        }
    }

    private void signUp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        boolean signUpResult = UserController.signUp(user);

        if (signUpResult) {
            //response.getWriter().write("Signup successful!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        	dispatcher.forward(request, response);
        } else {
            response.getWriter().write("Username already exists. Signup failed.");
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        System.out.println(username);
     // During login
        HttpSession session = request.getSession();
        String username1 = username;
        session.setAttribute("username", username1);
        System.out.println("Username set in session: " + username1);

        

        boolean loginResult = UserController.login(user);

        if (loginResult) {
            //response.getWriter().write("Login successful!");
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/addArticleForm.jsp");
        	dispatcher.forward(request, response);


        } else {
            response.getWriter().write("Login failed. Check your username and password.");
        }
    }
}
