<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Anasayfa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .content {
            text-align: center;
        }
        h1, p, a {
            color: #333333;
            margin-bottom: 20px;
        }
        a {
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="content">
        <h1>Hoş Geldiniz!</h1>
        <p>Giriş işlemi başarıyla gerçekleştirildi.</p>
        <p>Kullanıcı adınız: <%= request.getParameter("username") %></p>
        <p><a href="logout.jsp">Çıkış Yap</a></p>
    </div>
</body>
</html>
