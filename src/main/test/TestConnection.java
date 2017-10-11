import org.junit.Assert;
import org.junit.Test;

import java.sql.*;

/**
 * @Author A.Albert
 * @Data 24.09.17
 * @Time 9:37
 * @Version 1.0
 * @Info empty
 */
public class TestConnection {

    private Connection connection;

    private PreparedStatement preparedStatement;

    private final String TEST_STR = "Альбертик";

    private final String QUERY = "SELECT * FROM SOUNDCHECK.testing";

    private final String Query2 = "SELECT * FROM public.testing";


    public static void main(String[] args) {

    }

    @Test
    public void testMysqlConnection() throws SQLException {
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/SOUNDCHECK?useEncoding=true&amp;characterEncoding=UTF-8", "root", "root");
            preparedStatement = connection.prepareStatement("INSERT INTO SOUNDCHECK.testing(id, name) VALUES (?,?)");
            preparedStatement.setInt(1,11);
            preparedStatement.setString(2, TEST_STR);
            preparedStatement.executeUpdate();

            Connection connect = connection;
            Statement statement = connect.createStatement();
            ResultSet resultSet = statement.executeQuery(QUERY);

            while (resultSet.next()) {
                String name;
                name = resultSet.getNString(2);

                Assert.assertEquals(name, TEST_STR);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connection.close();
            preparedStatement.close();
        }
    }

    @Test
    public void testPostgresql() throws SQLException {
        try {
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/test", "root2", "root2");
            preparedStatement = connection.prepareStatement("INSERT INTO public.testing(id, name) VALUES(?, ?)");
            preparedStatement.setInt(1, 11);
            preparedStatement.setString(2, TEST_STR);
            preparedStatement.executeUpdate();

            Connection connect = connection;
            Statement statement = connect.createStatement();
            ResultSet resultSet = statement.executeQuery(Query2);

            while (resultSet.next()) {
                String name;
                name = resultSet.getString(2);

                Assert.assertEquals(name, TEST_STR);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connection.close();
        }
    }

}
