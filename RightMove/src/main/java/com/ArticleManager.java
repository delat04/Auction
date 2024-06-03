package com;

import model.Article;

import java.util.ArrayList;
import java.util.List;

public class ArticleManager {
    private static List<Article> articles = new ArrayList<>();

    public static List<Article> getArticles() {
        return articles;
    }

    public static void addArticle(Article article) {
        articles.add(article);
    }

   
}
