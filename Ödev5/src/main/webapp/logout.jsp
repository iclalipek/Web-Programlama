<%
    // Oturumu (session) sonlandır
    session.invalidate();
    // Kullanıcıyı giriş sayfasına yönlendir
    response.sendRedirect("login.jsp");
%>
