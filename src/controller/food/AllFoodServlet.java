package controller.food;

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

@WebServlet("/allFood.do")
public class AllFoodServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int currentPage = 1;
        int pageSize = 15;

        int start = (currentPage - 1) * pageSize + 1;
        int end = currentPage * pageSize;

        FoodDAO dao = FoodDAO.getInstance();
        ArrayList<FoodDTO> allFoodList = dao.getAllFoods();

        HttpSession session = req.getSession();
        session.setAttribute("AllFoodList", allFoodList);

        RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/food/allFood.jsp");
        rd.forward(req, resp);
    }
}
