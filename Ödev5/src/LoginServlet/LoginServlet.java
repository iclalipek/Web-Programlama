import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kullanıcı adı ve şifreyi al
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Oturum (session) başlat
        HttpSession session = request.getSession();

        // Kullanıcı adını ve şifreyi oturumda sakla
        session.setAttribute("username", username);
        session.setAttribute("password", password);

        // İkinci kez giriş yapacak mı kontrol et
        String rememberMe = request.getParameter("rememberMe");
        if (rememberMe != null && rememberMe.equals("on")) {
            // Çerez oluştur ve kullanıcıya gönder
            Cookie usernameCookie = new Cookie("username", username);
            Cookie passwordCookie = new Cookie("password", password);
            usernameCookie.setMaxAge(60 * 60 * 24 * 30); // 30 gün boyunca geçerli
            passwordCookie.setMaxAge(60 * 60 * 24 * 30); // 30 gün boyunca geçerli
            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);
        }

        // Ana sayfaya yönlendir
        response.sendRedirect("anasayfa.jsp");
    }
}
