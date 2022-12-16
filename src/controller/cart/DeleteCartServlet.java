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

@WebServlet("/deleteCart.do")
public class DeleteCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String delFoodId = req.getParameter("delCartFoodId");

        ArrayList<FoodDTO> cartList = (ArrayList<FoodDTO>) session.getAttribute("cartList");

        for(int i=0; i<cartList.size(); i++) {
            if(cartList.get(i).getFoodId().equals(delFoodId)) {
                cartList.remove(i);
            }
        }

        session.setAttribute("cartList", cartList);

        resp.sendRedirect("/cart.do");
    }
}
