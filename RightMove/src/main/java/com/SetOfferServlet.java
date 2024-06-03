package com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Article;
import model.Offre;


public class SetOfferServlet extends HttpServlet {

  
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user input for setting offer
        String articleTitle = request.getParameter("articleTitle");
        float offerPrice = Float.parseFloat(request.getParameter("offerPrice"));

        // Find the corresponding article
        Article targetArticle = null;
        for (Article article : ArticleManager.getArticles()) {
            if (article.getTitle().equals(articleTitle)) {
                targetArticle = article;
                break;
            }
        }

        // Add the offer to the article's list of offers
        if (targetArticle != null) {
            String username = (String) request.getSession().getAttribute("username");
            
            Offre newOffer = new Offre(articleTitle, offerPrice, username);
            targetArticle.getOffres().add(newOffer);
            
        }

        // Set the updated list of articles in the request attribute
        request.setAttribute("articles", ArticleManager.getArticles());

        // Forward to the JSP page for display
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/addArticleForm.jsp");
        dispatcher.forward(request, response);
    }
}
