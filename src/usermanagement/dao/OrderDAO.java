package usermanagement.dao;

import usermanagement.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false&allowPublicKeyRetrieval=true";
    private String jdbcUsername = "root";
    private String jdbcPassword = "haliltprkk";

    private static final String INSERT_PRODUCT = "INSERT INTO orders" + "  (userId, image, title,description,price) VALUES " + " (?, ?, ? , ?,?);";
    private static final String SELECT_PRODUCT_BY_ID = "select id,userId,image,title,description,price from orders where id =?";
    private static final String SELECT_ALL_USERS = "select * from orders";
    private static final String DELETE_PRODUCT_SQL = "delete from orders where id = ?;";
    private static final String UPDATE_PRODUCT_SQL = "update orders set image = ?,title= ?,description= ?,price= ? where id = ?;";

    public OrderDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public boolean updateProduct(Product product) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT_SQL);) {
            statement.setString(1, product.getImage());
            statement.setString(2, product.getTitle());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getPrice());
            statement.setInt(5, product.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    public void insertProduct(Product product) throws SQLException {
        System.out.println(INSERT_PRODUCT);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT)) {
            preparedStatement.setInt(1, product.getUserId());
            preparedStatement.setString(2, product.getImage() == null ? "" : product.getImage());
            preparedStatement.setString(3, product.getTitle());
            preparedStatement.setString(4, product.getDescription() == null ? "" : product.getDescription());
            preparedStatement.setInt(5, product.getPrice());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }


    public Product selectProduct(int id) {
        Product product = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int userId = rs.getInt("userId");
                String image = rs.getString("image");
                String title = rs.getString("title");
                String description = rs.getString("description");
                int price = rs.getInt("price");
                product = new Product(id, userId, image, title, description, price);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }


    public List<Product> selectAllProduct() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Product> users = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("userId");
                String image = rs.getString("image");
                String title = rs.getString("title");
                String description = rs.getString("description");
                int price = rs.getInt("price");
                users.add(new Product(id, userId, image, title, description, price));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }


    public boolean deleteProduct(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
