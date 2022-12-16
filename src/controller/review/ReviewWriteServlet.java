package controller.review;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dao.ReviewDAO;
import dto.MemberDTO;
import dto.ReviewDTO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Enumeration;

@WebServlet("/reviewWrite.do")
public class ReviewWriteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "/WEB-INF/review/review_write.jsp";

        HttpSession session = req.getSession();
        if (session.getAttribute("loginMember") == null) {
            resp.sendRedirect("login.do");
            return;
        }

        RequestDispatcher rd = req.getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");

        String fileName = "";
        String uploadFolder = "/Users/moonsung/coding/MVCMainProject/web/resources/img/";
        int maxSize = 5 * 1024 * 1024;
        String encType = "utf-8";

        MultipartRequest multi = new MultipartRequest(req, uploadFolder, maxSize, encType, new DefaultFileRenamePolicy());

        String url = null;
        HttpSession session = req.getSession();

        if(session.getAttribute("loginMember") == null) {
            url = "/login.do";
            resp.sendRedirect(url);
        } else {
            MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");

            String reviewTitle = multi.getParameter("reviewTitle");
            String foodName = multi.getParameter("foodName");
            String reviewContent = multi.getParameter("reviewContent");

            Enumeration files = multi.getFileNames();
            String rName = (String) files.nextElement();
            String reviewImageName = multi.getFilesystemName(rName);

            ReviewDTO review = new ReviewDTO();
            review.setReviewTitle(reviewTitle);
            review.setReviewFoodName(foodName);
            review.setReviewContent(reviewContent);
            review.setPostDate(new Date(new java.util.Date().getTime()));
            review.setReviewWriterId(loginMember.getMemberId());
            review.setReviewImage(reviewImageName);

            ReviewDAO dao = ReviewDAO.getInstance();
            int result = dao.registerReview(review);

            if(result == 1) {
                resp.sendRedirect("reviewList.do");
                session.setAttribute("regMessage", "리뷰 등록 성공");
            } else {
                resp.sendRedirect("reviewWrite.do");
                session.setAttribute("regMessage", "리뷰 등록 실패");
            }
        }
    }
}
