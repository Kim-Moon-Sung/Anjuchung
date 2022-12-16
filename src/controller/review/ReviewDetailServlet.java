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

@WebServlet("/review.do")
public class ReviewDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }


    public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String reviewNo = req.getParameter("reviewNo");
        ReviewDAO dao = ReviewDAO.getInstance();
        dao.updateVisitCount(reviewNo);
//        ReviewDTO dto = dao.selectReview(reviewNo);

        HttpSession session = req.getSession();
//        session.setAttribute("review", dto);
        session.setAttribute("reviewNo", reviewNo);
        String url = "/WEB-INF/review/review.jsp";

        RequestDispatcher rd = req.getRequestDispatcher(url);
        rd.forward(req, resp);
    }
}
