package controller.member;

import dto.MemberDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/myPage.do")
public class MyPageServlet extends HttpServlet {

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

        MemberDTO member = (MemberDTO)session.getAttribute("loginMember");
        if(member == null) {
            req.getRequestDispatcher(url).forward(req, resp);
            return;
        } else {
            url = "/WEB-INF/member/myPage.jsp";
            req.getRequestDispatcher(url).forward(req, resp);
        }
    }
}
