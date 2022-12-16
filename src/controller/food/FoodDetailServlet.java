package controller.food;

import dao.FoodDAO;
import dao.ReviewDAO;
import dto.FoodDTO;
import dto.ReviewDTO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/foodDetail.do")
public class FoodDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String foodId = req.getParameter("id");
        FoodDAO foodDAO = FoodDAO.getInstance();
        FoodDTO findFood = foodDAO.findFoodById(foodId);

        ReviewDAO reviewDAO = ReviewDAO.getInstance();
        ArrayList<ReviewDTO> reviewList = reviewDAO.selectReviewsByFoodName(findFood.getFname());

        HttpSession session = req.getSession();
        session.setAttribute("food", findFood);
        session.setAttribute("reviewList", reviewList);
        String url = "/WEB-INF/food/foodDetail.jsp";

        RequestDispatcher rd = req.getRequestDispatcher(url);
        rd.forward(req, resp);
    }
}
