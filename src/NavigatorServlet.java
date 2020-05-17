import usermanagement.dao.ProductDAO;
import usermanagement.dao.UserDAO;
import usermanagement.model.Product;
import usermanagement.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "navigator")
public class NavigatorServlet extends HttpServlet {
    private UserDAO userDAO;
    private ProductDAO productDAO;

    public void init() {
        userDAO = new UserDAO();
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            if (request.getParameter("logout") != null) {
                HttpSession session = request.getSession();
                session.invalidate();
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            } else if (request.getParameter("addToCart") != null) {
                Product product = productDAO.selectProduct(Integer.parseInt(request.getParameter("addToCart")));
                addProductToSession(request, response, product);
                doGet(request, response);
            } else {
                checkUser(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("removeProduct") != null) {
            removeProductToSession(request, response, Integer.parseInt(request.getParameter("removeProduct")));
            RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
            dispatcher.forward(request, response);
            return;
        } else if (request.getParameter("buy") != null) {
            try {
                buyProducts(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("sessionUser");
        RequestDispatcher dispatcher = null;
        if (user == null) {
            dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (user.isAdmin()) {
            dispatcher = request.getRequestDispatcher("admin-dashboard.jsp");
        } else {
            List<Product> listUser = productDAO.selectAllProduct();
            request.setAttribute("listProduct", listUser);
            response.setCharacterEncoding("UTF-8");
            dispatcher = request.getRequestDispatcher("home.jsp");
        }
        dispatcher.forward(request, response);

    }

    private void checkUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        RequestDispatcher dispatcher = null;
        User user = userDAO.checkUserExist(email, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("sessionUser", user);
            if (user.isAdmin()) {
                dispatcher = request.getRequestDispatcher("admin-dashboard.jsp");
            } else {
                List<Product> listUser = productDAO.selectAllProduct();
                request.setAttribute("listProduct", listUser);
                response.setCharacterEncoding("UTF-8");
                dispatcher = request.getRequestDispatcher("home.jsp");
            }
        } else {
            String errorMessage = "Böyle bir kullanıcı bulunamadı, lütfen bilgilerinizi tekrar kontrol edin";
            request.setAttribute("errorMessage", errorMessage);
            dispatcher = request.getRequestDispatcher("Error.jsp");
        }
        dispatcher.forward(request, response);
    }

    public boolean addProductToSession(HttpServletRequest request, HttpServletResponse response, Product product) throws IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/javascript");
        List<Product> cartProducts;
        HttpSession session = request.getSession();
        cartProducts = (List<Product>) session.getAttribute("cartProducts");
        if (cartProducts == null)
            cartProducts = new ArrayList<>();
        boolean isProductAtCart = false;
        for (Product p : cartProducts) {
            if (p.getId() == product.getId()) {
                isProductAtCart = true;
                break;
            }
        }
        if (!isProductAtCart) {
            cartProducts.add(product);
            session.setAttribute("cartProducts", cartProducts);
            return true;
        } else {
            return false;
        }
    }

    public void removeProductToSession(HttpServletRequest request, HttpServletResponse response, int id) throws IOException {
        List<Product> cartProducts;
        HttpSession session = request.getSession();
        cartProducts = (List<Product>) session.getAttribute("cartProducts");
        for (Product p :
                cartProducts) {
            if (p.getId() == id) {
                cartProducts.remove(p);
                break;
            }
        }
        session.setAttribute("cartProducts", cartProducts);
    }

    public void buyProducts(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        List<Product> cartProducts;
        HttpSession session = request.getSession();
        cartProducts = (List<Product>) session.getAttribute("cartProducts");
        User user = (User) session.getAttribute("sessionUser");
        for (Product p : cartProducts) {
            p.setUserId(user.getId());
            productDAO.insertOrder(p);
        }
        session.setAttribute("cartProducts", null);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}
