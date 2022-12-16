package controller.member;

import dao.MemberDAO;
import dto.MemberDTO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "/WEB-INF/member/login.jsp";

        HttpSession session = req.getSession();
        if (session.getAttribute("loginMember") != null) {
            url = "/WEB-INF/index.jsp";
        }

        RequestDispatcher rd = req.getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String url = "/WEB-INF/member/login.jsp";

        String memberId = req.getParameter("memberId");
        String memberPwd = req.getParameter("password");

        MemberDAO dao = MemberDAO.getInstance();
        int result = dao.login(memberId, memberPwd);
        HttpSession session = req.getSession();

        if(result == 1) {
            MemberDTO member = dao.findMember(memberId);

            session.setAttribute("loginResult", result);
            session.setAttribute("loginMember", member);
            session.setAttribute("isAdmin", member.getIsAdmin());

            req.setAttribute("message", "로그인 되었습니다.");
            resp.sendRedirect("/home.do");
        } else if (result == 0) {
            session.setAttribute("loginResult", result);
            req.setAttribute("message", "비밀번호가 틀립니다.");
            RequestDispatcher rd = req.getRequestDispatcher(url);
            rd.forward(req, resp);
        } else if (result == -1) {
            session.setAttribute("loginResult", result);
            req.setAttribute("message", "존재하지 않는 아이디입니다.");
            RequestDispatcher rd = req.getRequestDispatcher(url);
            rd.forward(req, resp);
        }
    }
}
