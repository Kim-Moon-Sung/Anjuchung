package controller.food;

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

@WebServlet("/likeFood.do")
public class LikeFoodServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "WEB-INF/index.jsp";
        HttpSession session = req.getSession();
        String likeListId = session.getId();

        if(session.getAttribute("loginMember") == null) {
            url = "/login.do";
            resp.sendRedirect(url);
        } else {
            ArrayList<FoodDTO> likeList = (ArrayList<FoodDTO>) session.getAttribute("likeList");

            if(session.getAttribute("likeList") == null) {
                likeList = new ArrayList<FoodDTO>();
            }

            url = "/WEB-INF/like/like.jsp?likeListId=" + likeListId;
            RequestDispatcher rd = req.getRequestDispatcher(url);
            rd.forward(req, resp);
        }
    }
}
