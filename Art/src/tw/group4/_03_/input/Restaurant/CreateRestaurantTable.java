package tw.group4._03_.input.Restaurant;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import tw.group4._03_.input.CreativeShop.ShopsTable;

public class CreateRestaurantTable {

	private DataSource dataSource;

	public DataSource getDataSource() {// 只需get因為只要用不希望被改

		// lazy init，能有多晚用到就多晚產生，放constructor會先產出佔用記憶體
		if (dataSource == null) { // 不希望重複產生，
			BasicDataSource ds = new BasicDataSource();
			ds.setDriverClassName("oracle.jdbc.OracleDriver");
			ds.setUrl("jdbc:oracle:thin:@//localhost:1521/xepdb1");
			ds.setUsername("group4");
			ds.setPassword("oracle");
			ds.setMaxTotal(50);
			ds.setMaxIdle(50);

			dataSource = ds; // 把BasicDataSource放在屬性上
		}
		return dataSource;
	}

	public void dropRestaurantTable() {
		try (Connection connection = getDataSource().getConnection();) {
			Statement stmt = connection.createStatement();

			String sql = "DROP TABLE CS_RESTAURANT_TABLE CASCADE CONSTRAINTS";

			stmt.executeUpdate(sql);
			System.out.println("營業行事歷表格已刪除");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void createRestaurantTable() {
		try (Connection connection = getDataSource().getConnection();) {
			Statement stmt = connection.createStatement();

			String sql = "CREATE TABLE CS_RESTAURANT_TABLE("
					+ "RESTAURANTNO NUMBER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) PRIMARY KEY NOT NULL, "
					+ "DATETIME VARCHAR2(1000 BYTE), " + "YEAR NUMBER(8,0), " + "MONTH NUMBER(8,0), "
					+ "DAY NUMBER(8,0), "

					+ "H09 NUMBER, " + "H10 NUMBER, " + "H11 NUMBER, " + "H12 NUMBER, " + "H13 NUMBER, "

					+ "H14 NUMBER, " + "H15 NUMBER, " + "H16 NUMBER, " + "H17 NUMBER, " + "H18 NUMBER, "

					+ "H19 NUMBER, " + "H20 NUMBER, " + "H21 NUMBER, " + "MAXIMUM NUMBER(8,0), " + "OPEN NUMBER(8,0))";

			stmt.executeUpdate(sql);
			System.out.println("營業行事歷表格已建立");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<RestaurantTable> readJsonToTable() {

		ArrayList<RestaurantTable> list = new ArrayList<RestaurantTable>();

		// 未來路徑有變動可能
		try (InputStream is = new FileInputStream("inputJSON/DemoTimeTable.json");
				InputStreamReader isr = new InputStreamReader(is, "UTF8");
				BufferedReader br = new BufferedReader(isr);) {
			int c;
			StringBuilder strBuilder = new StringBuilder();
			while ((c = br.read()) != -1) {
				char d = (char) c;
				strBuilder.append(String.valueOf(d));
			}

			String tableStr = String.valueOf(strBuilder);
//			System.out.println(tableStr);

			Gson gson = new Gson();
			Type listType = new TypeToken<ArrayList<RestaurantTable>>() {
			}.getType();

			ArrayList<RestaurantTable> jsonArr = gson.fromJson(tableStr, listType);

			for (RestaurantTable item : jsonArr) {
				RestaurantTable restaurant = new RestaurantTable();

//				restaurant.setRestaurantNo(item.getRestaurantNo());
				restaurant.setDateTime(item.getDateTime());
				restaurant.setYear(item.getYear());
				restaurant.setMonth(item.getMonth());
				restaurant.setDay(item.getDay());

				restaurant.setH09(item.getH09());
				restaurant.setH10(item.getH10());
				restaurant.setH11(item.getH11());
				restaurant.setH12(item.getH12());
				restaurant.setH13(item.getH13());

				restaurant.setH14(item.getH14());
				restaurant.setH15(item.getH15());
				restaurant.setH16(item.getH16());
				restaurant.setH17(item.getH17());
				restaurant.setH18(item.getH18());

				restaurant.setH19(item.getH19());
				restaurant.setH20(item.getH20());
				restaurant.setH21(item.getH21());
				restaurant.setMaximum(item.getMaximum());
				restaurant.setOpen(item.getOpen());

				list.add(restaurant);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("已成功轉換json");
		return list;

	}

	public void creatCalendarInfoTable(ArrayList<RestaurantTable> list) {

		try (Connection connection = getDataSource().getConnection();
				PreparedStatement pstmt = connection.prepareStatement("INSERT INTO CS_RESTAURANT_TABLE "
						+ "(dateTime, year, month, day, "
						+ "h09, h10, h11, h12, h13, " 
						+ "h14, h15, h16, h17, h18, "
						+ "h19, h20, h21, maximum, open) " 
						+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");) {

			for (RestaurantTable restaurant : list) {

				pstmt.setString(1, restaurant.getDateTime());
				pstmt.setInt(2, Integer.parseInt(restaurant.getYear()));
				pstmt.setInt(3, Integer.parseInt(restaurant.getMonth()));
				pstmt.setInt(4, Integer.parseInt(restaurant.getDay()));

				pstmt.setInt(5, Integer.parseInt(restaurant.getH09()));
				pstmt.setInt(6, Integer.parseInt(restaurant.getH09()));
				pstmt.setInt(7, Integer.parseInt(restaurant.getH11()));
				pstmt.setInt(8, Integer.parseInt(restaurant.getH12()));
				pstmt.setInt(9, Integer.parseInt(restaurant.getH13()));

				pstmt.setInt(10, Integer.parseInt(restaurant.getH14()));
				pstmt.setInt(11, Integer.parseInt(restaurant.getH15()));
				pstmt.setInt(12, Integer.parseInt(restaurant.getH16()));
				pstmt.setInt(13, Integer.parseInt(restaurant.getH17()));
				pstmt.setInt(14, Integer.parseInt(restaurant.getH18()));

				pstmt.setInt(15, Integer.parseInt(restaurant.getH19()));
				pstmt.setInt(16, Integer.parseInt(restaurant.getH20()));
				pstmt.setInt(17, Integer.parseInt(restaurant.getH21()));
				pstmt.setInt(18, Integer.parseInt(restaurant.getMaximum()));
				pstmt.setInt(19, Integer.parseInt(restaurant.getOpen()));

				pstmt.executeUpdate();
				pstmt.clearParameters();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("11、12月營業行事曆資料已新增至DB");
	}

}
