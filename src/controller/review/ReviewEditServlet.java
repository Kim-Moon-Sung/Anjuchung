package controller.review;

import dao.ReviewDAO;
import dto.ReviewDTO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/reviewEdit.do")
public class ReviewEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String reviewNo = req.getParameter("reviewNo");

        ReviewDAO dao = ReviewDAO.getInstance();
        ReviewDTO dto = dao.selectReview(reviewNo);

        HttpSession session = req.getSession();
        session.setAttribute("review", dto);

        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/review/review_edit.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ReviewDTO dto = (ReviewDTO) session.getAttribute("review");

        String reviewNo = dto.getReviewNo();

        String reviewTitle = req.getParameter("reviewTitle");
        String reviewContent = req.getParameter("reviewContent");
        String foodName = req.getParameter("foodName");

        dto.setReviewTitle(reviewTitle);
        dto.setReviewContent(reviewContent);
        dto.setReviewFoodName(foodName);

        ReviewDAO dao = ReviewDAO.getInstance();
        int result = dao.updateEdit(dto);

        resp.sendRedirect("reviewList.do");
    }
}
