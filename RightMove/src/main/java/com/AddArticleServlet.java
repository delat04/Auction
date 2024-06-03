package com;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Article;

public class AddArticleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    //private static List<Article> articles = new ArrayList<>();
   
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user input for new article
        String title = request.getParameter("title");
        float price = Float.parseFloat(request.getParameter("price"));
        float offer=0;

        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        // Create a new article with user information
        Article newArticle = new Article(title, price, new ArrayList<>(), username,offer);
        
        //System.out.println(username);

        // Add the new article to the list
        //articles.add(newArticle);
        ArticleManager.addArticle(newArticle);
        
        

        // Set the list of articles in the request attribute
        request.setAttribute("articles", ArticleManager.getArticles());
        //System.out.println(username+"111111111111111111111");

        // Forward to the JSP page for display
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/addArticleForm.jsp");
        dispatcher.forward(request, response);
}}