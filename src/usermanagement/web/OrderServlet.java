package usermanagement.web;

import usermanagement.dao.OrderDAO;
import usermanagement.dao.ProductDAO;
import usermanagement.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDAO productDAO;

    public void init() {
        productDAO = new OrderDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/new-order":
                    showNewForm(request, response);
                    break;
                case "/insert-order":
                    insertUser(request, response);
                    break;
                case "/delete-order":
                    deleteUser(request, response);
                    break;
                case "/edit-order":
                    showEditForm(request, response);
                    break;
                case "/update-order":
                    updateUser(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Product> listUser = productDAO.selectAllProduct();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("order-list.jsp");
        response.setCharacterEncoding("UTF-8");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("order-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product existingUser = productDAO.selectProduct(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("order-form.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);

    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String image = request.getParameter("image");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        Product newProduct = new Product(0, image, title, description, Integer.parseInt(price));
        productDAO.insertProduct(newProduct);
        response.sendRedirect("list-order");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String image = request.getParameter("image");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String price = request.getParameter("price");

        Product book = new Product(id, 0, image, title, description, Integer.parseInt(price));
        productDAO.updateProduct(book);
        response.sendRedirect("list-order");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productDAO.deleteProduct(id);
        response.sendRedirect("list-order");

    }
}
