package controller.shipping;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLDecoder;

@WebServlet("/shippingEnd.do")
public class ShippingEndServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        HttpSession session = req.getSession();
        String cartId = session.getId();

        String shipping_cartId = "";
        String shipping_name = "";
        String shipping_date = "";
        String shipping_country = "";
        String shipping_zipCode = "";
        String shipping_address = "";

        Cookie[] cookies = req.getCookies();

        if(cookies != null) {
            for(int i=0; i<cookies.length; i++) {
                Cookie cookie = cookies[i];
                String cookieName = cookie.getName();

                if(cookieName.equals("Shipping_cartId")) {
                    cookie.setMaxAge(0);
                }

                if(cookieName.equals("Shipping_name")) {
                    cookie.setMaxAge(0);
                }

                if(cookieName.equals("Shipping_date")) {
                    cookie.setMaxAge(0);
                }

                if(cookieName.equals("Shipping_country")) {
                    cookie.setMaxAge(0);
                }

                if(cookieName.equals("Shipping_zipCode")) {
                    cookie.setMaxAge(0);
                }

                if(cookieName.equals("Shipping_address")) {
                    cookie.setMaxAge(0);
                }
                resp.addCookie(cookie);
            }
        }

        resp.sendRedirect("home.do");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/shipping/shippingEnd.jsp");
        rd.forward(req, resp);
    }
}
