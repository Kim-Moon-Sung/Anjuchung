package controller.review;

import dao.ReviewDAO;
import dto.ReviewDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/deleteReview.do")
public class DeleteReviewServlet extends HttpServlet {
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
        String reviewNo = (String)session.getAttribute("reviewNo");

        ReviewDAO dao = ReviewDAO.getInstance();
        ReviewDTO dto = dao.selectReview(reviewNo);

        int result = dao.deleteReview(dto);

        resp.sendRedirect("reviewList.do");
    }
}
