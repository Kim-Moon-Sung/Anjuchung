package controller.cart;

import dao.FoodDAO;
import dto.FoodDTO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/cart.do")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "/WEB-INF/index.jsp";
        HttpSession session = req.getSession();
        String cartId = session.getId();

        if(session.getAttribute("loginMember") == null) {
            url = "/login.do";
            resp.sendRedirect(url);
        } else {
            ArrayList<FoodDTO> cartList = (ArrayList<FoodDTO>) session.getAttribute("cartList");

            if(session.getAttribute("cartList") == null) {
                cartList = new ArrayList<FoodDTO>();
            }

            url = "/WEB-INF/cart/cart.jsp?cartId=" + cartId;
            RequestDispatcher rd = req.getRequestDispatcher(url);
            rd.forward(req, resp);
        }
    }
}
