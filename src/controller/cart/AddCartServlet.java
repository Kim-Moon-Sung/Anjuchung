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

@WebServlet("/addCart.do")
public class AddCartServlet extends HttpServlet {
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
        String url = "/WEB-INF/index.jsp";

        if(session.getAttribute("loginMember") == null) {
            url = "/login.do";
            resp.sendRedirect(url);
            return;
        }
        String foodId = req.getParameter("id");
        FoodDAO dao = FoodDAO.getInstance();
        FoodDTO findFood = dao.findFoodById(foodId);

        if(findFood == null) {
            resp.sendRedirect("exceptionNoFoodId.jsp");
            return;
        }

        ArrayList<FoodDTO> allFoodList = dao.getAllFoods();
        FoodDTO food = new FoodDTO();
        for(int i=0; i<allFoodList.size(); i++) {
            food = allFoodList.get(i);
            if(food.getFoodId().equals(foodId)){
                break;
            }
        }

        ArrayList<FoodDTO> list = (ArrayList<FoodDTO>) session.getAttribute("cartList");
        if(list == null) {
            list = new ArrayList<FoodDTO>();
            session.setAttribute("cartList", list);
        }

        int cnt = 0;
        int orderQuantity = 0;
        FoodDTO foodQnt = new FoodDTO();
        String addQuantity = req.getParameter("addQuantity");
        for(int i=0; i< list.size(); i++) {
            foodQnt = list.get(i);
            if(foodQnt.getFoodId().equals(foodId)) {
                cnt++;
                if(addQuantity != null) {
                    int quantity = Integer.parseInt(addQuantity);
                    orderQuantity = food.getQuantity() + quantity + 1;
                } else {
                    orderQuantity = foodQnt.getQuantity() + 1;
                }
                foodQnt.setQuantity(orderQuantity);
            }
        }

        if(cnt == 0) {
            if(addQuantity != null) {
                int quantity = Integer.parseInt(addQuantity);
                food.setQuantity(quantity);
            } else {
                food.setQuantity(1);
            }
            list.add(food);
        }

        resp.sendRedirect("home.do");
    }
}
