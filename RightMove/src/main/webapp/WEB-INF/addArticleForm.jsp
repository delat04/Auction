<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Article</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f4f4f4;
            color: #000;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            justify-content: space-between; /* Adjusted to space between */
            width: 90%; /* Adjusted width to 80% */
        }

        .forms {
            width: 250px;
            margin: 50px;
        }

        h1, h2 {
            color: #3498db;
            border-bottom: 2px solid #3498db;
            padding-bottom: 5px;
            margin-bottom: 20px;
        }

        form {
            border: 2px solid #3498db;
            border-radius: 8px;
            padding: 20px;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #ecf0f1; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        label {
            margin-bottom: 10px;
            color: #3498db;
        }

        input {
            padding: 8px;
            margin: 5px;
            border: 1px solid #3498db;
            border-radius: 5px;
            background-color: #a4adb3;
            color: #fff;
            cursor: pointer;
        }
        button{
            padding: 8px;
            margin: 5px;
            border: 1px solid #3498db;
            border-radius: 5px;
            background-color: ##39a0db;
            color: #fff;
            cursor: pointer;
        }

        input:hover, button:hover {
            background-color: #ffffff;
            color: #fff;
        }

        table {
            width: 80%; /* Adjusted width to 70% */
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #3498db;
            padding: 8px;
            text-align: left;
        }

        .max-offer {
            background-color: #2ecc71;
            padding: 5px;
            border-radius: 5px;
            color: #fff;
        }

        .article-section {
            width: 100%;
        }

        a {
            color: #3498db;
            text-decoration: none;
            border: 1px solid #3498db;
            padding: 5px;
            border-radius: 5px;
            display: inline-block;
        }

        a:hover {
            background-color: #2980b9;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>Articles Offer and Informations</h1>
    
    <div class="container">
        <div class="forms">
        	<h2>Add Article</h2>
            <form action="url1" method="post">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required>
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" required>
                <input type="submit" value="Add Article">
            </form>

            <h2>Add Offer</h2>
            <form action="setOffer" method="post">
                <label for="articleTitle">Article Title:</label>
                <input type="text" id="articleTitle" name="articleTitle" required>
                <label for="offerPrice">Offer Price:</label>
                <input type="number" id="offerPrice" name="offerPrice" required>
                <input type="submit" value="Add Offer">
            </form>
        </div>

        <div class="article-section">
            <table>
                <tr>
                    <th>Title</th>
                    <th>Price</th>
                    <th>Added By</th>
                    <th>Max Offer</th>
                </tr>
                <c:forEach var="article" items="${articles}">
                    <tr>
                        <td>${article.title}</td>
                        <td>$${article.price}</td>
                        <td>${article.addedBy}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty article.maxOffer}">
                                    <span class="max-offer">$${article.maxOffer.offeresPrice} by ${article.maxOffer.addedBy}</span>
                                </c:when>
                                <c:otherwise>No offers</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <a href="${pageContext.request.contextPath}/index.jsp">Log Out</a>

    <script>
        function toggleArticleSection() {
            var articleSection = document.querySelector('.article-section');
            articleSection.style.display = (articleSection.style.display === 'none') ? 'block' : 'none';
        }
    </script>
</body>
</html>
	