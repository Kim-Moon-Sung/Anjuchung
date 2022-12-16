package controller.food;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
import java.util.Enumeration;

@WebServlet("/addFood.do")
public class AddFoodServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "/WEB-INF/food/addFood.jsp";

        HttpSession session = req.getSession();
        if (session.getAttribute("isAdmin").equals("false")) {
            url = "/WEB-INF/index.jsp";
        }

        FoodDAO dao = FoodDAO.getInstance();
        ArrayList<FoodDTO> allFoodList = dao.getAllFoods();
        session.setAttribute("AllFoodList", allFoodList);

        RequestDispatcher rd = req.getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String fileName = "";
        String uploadFolder = "/Users/moonsung/coding/MVCMainProject/web/resources/img/";
        int maxSize = 5 * 1024 * 1024;
        String encType = "utf-8";

        MultipartRequest multi = new MultipartRequest(req, uploadFolder, maxSize, encType, new DefaultFileRenamePolicy());

        String foodId = multi.getParameter("foodId");
        String fname = multi.getParameter("fname");
        Integer price = Integer.valueOf(multi.getParameter("price"));
        String category = multi.getParameter("category");
        String detail = multi.getParameter("detail");
        Integer stock = Integer.valueOf(multi.getParameter("stock"));

        Enumeration files = multi.getFileNames();
        String iName = (String) files.nextElement();
        String imageName = multi.getFilesystemName(iName);

        FoodDTO dto = new FoodDTO(foodId, fname, price, category, detail, stock, imageName);

        FoodDAO dao = FoodDAO.getInstance();
        int result = dao.registerFood(dto);
        String url = null;

        HttpSession session = req.getSession();
        if(result == 1) {
            session.setAttribute("foodId", dto.getFoodId());
            session.setAttribute("message", "음식 등록이 완료되었습니다.");
            url = "WEB-INF/food/allFood.jsp";
        } else {
            session.setAttribute("message", "음식 등록에 실패하였습니다.");
            url = "WEB-INF/food/addFood.jsp";
        }

        ArrayList<FoodDTO> allFoodList = dao.getAllFoods();
        session.setAttribute("AllFoodList", allFoodList);

        RequestDispatcher rd = req.getRequestDispatcher(url);
        rd.forward(req, resp);
    }
}
