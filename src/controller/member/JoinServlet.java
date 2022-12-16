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

@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/member/join.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        MemberDTO dto = new MemberDTO();
        dto.setName(req.getParameter("name"));
        dto.setMemberId(req.getParameter("memberId"));
        dto.setPassword(req.getParameter("password"));
        dto.setPhone(req.getParameter("phone"));
        dto.setEmail(req.getParameter("email"));
        dto.setAddress(req.getParameter("address"));

        MemberDAO dao = MemberDAO.getInstance();
        int result = dao.join(dto);
        String url = null;

        HttpSession session = req.getSession();
        if(result == 1) {
            session.setAttribute("memberId", dto.getMemberId());
            session.setAttribute("message", "회원 가입에 성공하였습니다.");
            url = "/WEB-INF/member/login.jsp";
        } else {
            session.setAttribute("message", "회원 가입에 실패하였습니다.");
            url = "/WEB-INF/member/join.jsp";
        }

        RequestDispatcher rd = req.getRequestDispatcher(url);
        rd.forward(req, resp);
    }
}
