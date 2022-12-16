package controller.shipping;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/shippingInfo.do")
public class ShippingInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/shipping/shippingInfo.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();

        String cartId = session.getId();
        String name = req.getParameter("name");
        String shippingDate = req.getParameter("shippingDate");
        String country = req.getParameter("country");
        String zipCode = req.getParameter("zipCode");
        String address = req.getParameter("address");

        Cookie cookieCartId = new Cookie("Shipping_cartId", URLEncoder.encode(cartId, "utf-8"));
        Cookie cookieName = new Cookie("Shipping_name", URLEncoder.encode(name, "utf-8"));
        Cookie cookieShippingDate = new Cookie("Shipping_date", URLEncoder.encode(shippingDate, "utf-8"));
        Cookie cookieCountry = new Cookie("Shipping_country", URLEncoder.encode(country, "utf-8"));
        Cookie cookieZipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(zipCode, "utf-8"));
        Cookie cookieAddress = new Cookie("Shipping_address", URLEncoder.encode(address, "utf-8"));

        cookieCartId.setMaxAge(60*24*24);
        cookieName.setMaxAge(60*24*24);
        cookieShippingDate.setMaxAge(60*24*24);
        cookieCountry.setMaxAge(60*24*24);
        cookieZipCode.setMaxAge(60*24*24);
        cookieAddress.setMaxAge(60*24*24);

        resp.addCookie(cookieCartId);
        resp.addCookie(cookieName);
        resp.addCookie(cookieShippingDate);
        resp.addCookie(cookieCountry);
        resp.addCookie(cookieZipCode);
        resp.addCookie(cookieAddress);

        resp.sendRedirect("orderConfirmation.do");
    }
}
