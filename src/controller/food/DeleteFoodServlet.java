package controller.food;

import dao.FoodDAO;
import dto.FoodDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/deleteFood.do")
public class DeleteFoodServlet extends HttpServlet {

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
        String deleteFoodId = req.getParameter("delFoodId");

        FoodDAO dao = FoodDAO.getInstance();
        int result = dao.deleteFood(deleteFoodId);
        ArrayList<FoodDTO> allFoodList = dao.getAllFoods();
        session.setAttribute("AllFoodList", allFoodList);

//        req.getRequestDispatcher("/WEB-INF/food/allFood.jsp").forward(req, resp);
        resp.sendRedirect("/allFood.do");
    }
}
