<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giriş</title>
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
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333333;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555555;
        }
        input[type="text"],
        input[type="password"],
        input[type="checkbox"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form action="./anasayfa.jsp" method="post">
        <h1>Giriş Sayfası</h1>
        <label for="username">Kullanıcı Adı:</label>
        <input type="text" id="username" name="username"><br><br>
        
        <label for="password">Şifre:</label>
        <input type="password" id="password" name="password"><br><br>
        
        <label for="rememberMe">Sonraki Girişte Beni Hatırla:</label>
        <input type="checkbox" id="rememberMe" name="rememberMe"><br><br>
        
        <input type="submit" value="Giriş Yap">
    </form>
</body>
</html>
