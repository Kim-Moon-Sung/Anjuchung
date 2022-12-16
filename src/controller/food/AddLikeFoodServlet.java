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

@WebServlet("/addLikeFood.do")
public class AddLikeFoodServlet extends HttpServlet {
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
            url = "login.do";
            resp.sendRedirect(url);
        } else {
            String foodId = req.getParameter("id");
            FoodDAO dao = FoodDAO.getInstance();
            FoodDTO findFood = dao.findFoodById(foodId);

            if(findFood == null) {
                resp.sendRedirect("exceptionNoFoodId.jsp");
            }

            ArrayList<FoodDTO> allFoodList = dao.getAllFoods();
            FoodDTO food = new FoodDTO();
            for(int i=0; i<allFoodList.size(); i++) {
                food = allFoodList.get(i);
                if (food.getFoodId().equals(foodId)) {
                    break;
                }
            }

            ArrayList<FoodDTO> list = (ArrayList<FoodDTO>) session.getAttribute("likeList");
            if(list == null) {
                list = new ArrayList<FoodDTO>();
                session.setAttribute("likeList", list);
            }

            int cnt = 0;
            FoodDTO foodQnt = new FoodDTO();
            for(int i=0; i<list.size(); i++) {
                foodQnt = list.get(i);
                if(foodQnt.getFoodId().equals(foodId)) {
                    cnt++;
                }
            }

            if(cnt == 0) {
                list.add(food);
            }

            resp.sendRedirect("/foodDetail.do?id=" + foodId);
        }
    }
}
