package DBBean;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class foodingBean {

	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = null;

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	Calendar cal = Calendar.getInstance();
	String today = formatter.format(cal.getTime());
	Timestamp ts = Timestamp.valueOf(today);
	
	//메소드 선언되어있지 않은 sql문을 실행하기 위한 dbconnection 메소드
	public void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			System.out.println("Driver Loading Error");
		}

		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/fooding_db";
			String dbId = "foodingid";
			String dbPass = "foodingpw";

			con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//sql문 실행결과를 result set 객체로 받아오는 메소드
	public ResultSet resultQuery(String sql) {
		DBclose();
		try {
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
			rs = null;
		}
		return rs;
	}
	//실행 결과가 없는 sql문을 실행하는 메소드
	public void nonResultQuery(String sql) {
		DBclose();
		try {
			con = getConnection();
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//id를 이용하여 해당유저의 닉네임을 반환하는 메소드
	public String findnkname(String id) {
		DBclose();
		try {
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select nkname from user where id='" + id + "';");
			if (rs.next()) {
				str = rs.getString("nkname");
			}
		} catch (Exception e) {
			e.printStackTrace();
			rs = null;
			str = "";
		} finally {
			DBclose();
		}
		return str;
	}
	//아이디를 이용해 해당 유저의 어드민 권한여부 값을 받아오는 메소드
	public int isAdmincheck(String id) {
		DBclose();
		int isAdminresult = 0;
		try {
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select isAdmin from user where id='" + id + "';");
			if (rs.next()) {
				isAdminresult = rs.getInt("isAdmin");
			}
		} catch (Exception e) {
			e.printStackTrace();
			rs = null;
			isAdminresult = 0;
		} finally {
			DBclose();
		}
		return isAdminresult;
	}
	//db관련 객체를 전부 닫는 메소드
	public void DBclose() {
		stmtClosing();
		pstmtClosing();
		resultclosing();
		ConClosing();
	}
	//statement 객체를 닫는 메소드
	public void stmtClosing() {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
			}
		}
	}
	//prepared statement 객체를 닫는 메소드
	public void pstmtClosing() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
			}
		}
	}
	//resultset 객체를 닫는 메소드
	public void resultclosing() {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
			}
		}
	}
	//connection 객체를 닫는 메소드
	public void ConClosing() {
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
			}
		}
	}

	private static foodingBean instance = new foodingBean();

	// DAO 인스턴스를 반환받기위한 메소드
	public static foodingBean getInstance() {
		return instance;
	}

	// db연결이 된 connection 객체를 반환하는 메소드 
	private Connection getConnection() throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			System.out.println("Driver Loading Error");
		}
		String jdbcUrl = "jdbc:mysql://localhost:3306/fooding_db";
		String dbId = "foodingid";
		String dbPass = "foodingpw";

		return DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	}
	//회원가입이 완료된 유저의 정보를 DB에 입력하는 메소드
	public int insertUserArticle(userDataBean article) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		int sucessed = 0;

		String sql = "";

		try {
			con = getConnection();
			sql = "insert into user(nkname,id,passwd,email,addrnum,address,detailaddr,gender,reg_date,userface";
			sql += ") values(?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getNkname());
			pstmt.setString(2, article.getId());
			pstmt.setString(3, article.getPasswd());
			pstmt.setString(4, article.getEmail());
			pstmt.setString(5, article.getAddrnum());
			pstmt.setString(6, article.getAddress());
			pstmt.setString(7, article.getDetailaddr());
			pstmt.setString(8, article.getGender());
			pstmt.setTimestamp(9, article.getReg_date());
			pstmt.setString(10, article.getUserface());

			pstmt.executeUpdate();

			sucessed = 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return sucessed;
	}
	//입력받은 아이디를 가진 유저의 정보를 가져오는 메소드
	public userDataBean getuserArticle(String userid) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		userDataBean article = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select * from user where id = ?");
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new userDataBean();
				article.setNkname(rs.getString("nkname"));
				article.setId(rs.getString("id"));
				article.setPasswd(rs.getString("passwd"));
				article.setEmail(rs.getString("email"));
				article.setAddrnum(rs.getString("addrnum"));
				article.setAddress(rs.getString("address"));
				article.setDetailaddr(rs.getString("detailaddr"));
				article.setGender(rs.getString("gender"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setMileage(rs.getInt("mileage"));
				article.setIsAdmin(rs.getInt("isAdmin"));
				article.setUserface(rs.getString("userface"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//유저의 포인트 변화를 반영하고 이유와 함께 정보를 포인트 내역 db에 입력하는 메소드
	public void pointupdate(String userid, int updatevalue, String adjestreason) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";

		try {
			con = getConnection();
			sql = "update user set mileage=mileage+" + updatevalue + " where id='" + userid + "'";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

			sql = "insert into pointhistory(owner,pointadjest,adjestreason,reg_date) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, updatevalue);
			pstmt.setString(3, adjestreason);
			pstmt.setTimestamp(4, ts);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
	//지정된 유저의 지정된 일수 내의 포인트 등락 내역을 반환하는 메소드
	public List<pointDataBean> getPointArticle(String userid, int getlimitBydate) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		List<pointDataBean> articleList = new ArrayList<pointDataBean>();

		try {
			con = getConnection();
			sql = "select * from pointhistory where owner='" + userid + "'";
			if (getlimitBydate != 0) {
				sql += " and reg_date>=(select date_add(now(),INTERVAL ? Day) from dual)";
			}

			pstmt = con.prepareStatement(sql);

			if (getlimitBydate != 0) {
				pstmt.setInt(1, -1 * getlimitBydate);
			}
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					pointDataBean article = new pointDataBean();
					article.setNum(rs.getInt("num"));
					article.setOwner(rs.getString("owner"));
					article.setPointadjest(rs.getInt("pointadjest"));
					article.setAdjestreason(rs.getString("adjestreason"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					articleList.add(article);
				} while (rs.next());
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//유저 전체의 정보를 목록으로 반환하는 메소드
	public List<userDataBean> getuserArticles() throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		userDataBean article = null;
		List<userDataBean> articleList = new ArrayList<userDataBean>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select * from user where isLeft=0");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					article = new userDataBean();
					article.setNkname(rs.getString("nkname"));
					article.setId(rs.getString("id"));
					article.setPasswd(rs.getString("passwd"));
					article.setEmail(rs.getString("email"));
					article.setAddrnum(rs.getString("addrnum"));
					article.setAddress(rs.getString("address"));
					article.setDetailaddr(rs.getString("detailaddr"));
					article.setGender(rs.getString("gender"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setMileage(rs.getInt("mileage"));
					article.setIsAdmin(rs.getInt("isAdmin"));
					article.setUserface(rs.getString("userface"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//유저 회원탈퇴를 진행하는 메소드
	public int userWannaLeft(String userid) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		int sucessed = 0;

		try {
			con = getConnection();
			sql = "update user set passwd='',email='',addrnum='',address='',detailaddr=''";
			sql += ",gender='',reg_date=null,mileage=0,isAdmin=0,userface='../img/userface/defaultface.png',isLeft=1";
			sql += " where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
			sucessed = 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return sucessed;
	}

	// 레시피 작성에서 입력받은 값을 db에 저장하는 메소드
	public void insertArticle(BoardDataBean article) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;

		String sql = "";

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select max(num) from recipes");
			rs = pstmt.executeQuery();
			sql = "insert into recipes(title,contury,foodtype,ingredients,tools,writerid,reg_date,content,thumbnail";
			sql += ") values(?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContury());
			pstmt.setString(3, article.getFoodtype());
			pstmt.setString(4, article.getIngredients());
			pstmt.setString(5, article.getTools());
			pstmt.setString(6, article.getWriterid());
			pstmt.setTimestamp(7, article.getReg_date());
			pstmt.setString(8, article.getContent());
			pstmt.setString(9, article.getThumbnail());

			pstmt.executeUpdate();

			pointupdate(article.getWriterid(), 5, "레시피 작성");

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//검색,인기 여부를 만족하는 레시피의 총 수를 반환하는 메소드
	public int getArticleCount(String type, String search, int fame) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";

		int x = 0;

		try {
			con = getConnection();

			if (type.equals("제목")) {
				sql = "select count(*) from recipes	where (contury like '%" + search + "%' or foodtype like '%" + search
						+ "%' or title like '%" + search + "%') ";
			} else if (type.equals("글쓴이")) {
				sql = "select count(*) from recipes	where writerid in(select id from user where nkname like '%" + search
						+ "%') ";
			} else if (type.equals("재료")) {
				sql = "select count(*) from recipes	where ingredients like '%" + search + "%' ";
			} else if (type.equals("도구")) {
				sql = "select count(*) from recipes	where tools like '%" + search + "%' ";
			}
			if (fame == 1) {
				sql += " and reg_date>=(select date_add(now(),INTERVAL -1 MONTH) from dual) and readcount>=50 ";
			}
			//맞춤레시피 검색의 경우 그에 필요한 sql문을 작성하기 위한 부분
			if (type.equals("맞춤")) {
				String searchArray[] = search.split(",");
				sql = "select sum((";
				for (int i = 0; i < searchArray.length; i++) {
					if (i != 0) {
						sql += "+";
					}
					String searchDetail[] = searchArray[i].split(":");

					if (searchDetail[0].equals("재료")) {
						sql += "(ingredients like '%" + searchDetail[1] + "%')";
					} else if (searchDetail[0].equals("도구")) {
						sql += "(tools like '%" + searchDetail[1] + "%')";
					} else if (searchDetail[0].equals("나라")) {
						sql += "(contury like '%" + searchDetail[1] + "%')";
					} else if (searchDetail[0].equals("종류")) {
						sql += "(foodtype like '%" + searchDetail[1] + "%')";
					} else if (searchDetail[0].equals("상황")) {
						sql += "((title like '%" + searchDetail[1] + "%')";
						sql += "|(content like '%" + searchDetail[1] + "%'))";
					} else if (searchDetail[0].equals("사용자지정")) {
						sql += "((ingredients like '%" + searchDetail[1] + "%')";
						sql += "|(tools like '%" + searchDetail[1] + "%'))";
					}
				}
				sql += ")>=" + (searchArray.length * 0.25) + 1 + ")as priority from recipes ";
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//시작,끝,검색,인기 여부를 만족하는 레시피 들의 정보를 받아오는 메소드
	public List<BoardDataBean> getArticles(int start, int end, String type, String search, int fame) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		List<BoardDataBean> articleList = null;
		try {
			con = getConnection();

			if (type.equals("제목")) {
				sql = "select * from recipes	where (contury like '%" + search + "%' or foodtype like '%" + search
						+ "%' or title like '%" + search + "%') ";
			} else if (type.equals("글쓴이")) {
				sql = "select * from recipes	where writerid in(select id from user where nkname like '%" + search
						+ "%') ";
			} else if (type.equals("재료")) {
				sql = "select * from recipes	where ingredients like '%" + search + "%' ";
			} else if (type.equals("도구")) {
				sql = "select * from recipes	where tools like '%" + search + "%' ";
			}
			if (fame == 1) {
				sql += "and reg_date>=(select date_add(now(),INTERVAL -1 MONTH) from dual) and readcount>=50 order by readcount desc limit ?,?";
			} else {
				sql += "order by num desc limit ?,?";
			}
			//맞춤 레시피에서 검색한 경우, 그를위한 sql문을 작성하기 위한 부분,
			if (type.equals("맞춤")) {
				String searchArray[] = search.split(",");
				sql = "select num,title,contury,foodtype,ingredients,tools,writerid,reg_date,readcount,content,thumbnail,(";
				for (int i = 0; i < searchArray.length; i++) {
					if (i != 0) {
						sql += "+";
					}
					String searchDetail[] = searchArray[i].split(":");
					if (searchDetail[0].equals("재료")) {
						sql += "(ingredients like '%" + searchDetail[1] + "%')";
					} else if (searchDetail[0].equals("도구")) {
						sql += "(tools like '%" + searchDetail[1] + "%')";
					} else if (searchDetail[0].equals("나라")) {
						sql += "(contury like '%" + searchDetail[1] + "%')";
					} else if (searchDetail[0].equals("종류")) {
						sql += "(foodtype like '%" + searchDetail[1] + "%')";
					} else if (searchDetail[0].equals("상황")) {
						sql += "((title like '%" + searchDetail[1] + "%')";
						sql += "|(content like '%" + searchDetail[1] + "%'))";
					} else if (searchDetail[0].equals("사용자지정")) {
						sql += "((ingredients like '%" + searchDetail[1] + "%')";
						sql += "|(tools like '%" + searchDetail[1] + "%'))";
					}
				}
				sql += ")as priority from recipes having priority>=" + (searchArray.length * 0.25) + 1
						+ " order by priority desc,num desc limit ?,?";
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setContury(rs.getString("contury"));
					article.setFoodtype(rs.getString("foodtype"));
					article.setIngredients(rs.getString("ingredients"));
					article.setTools(rs.getString("tools"));
					article.setTitle(rs.getString("title"));
					article.setWriterid(rs.getString("writerid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					article.setThumbnail(rs.getString("thumbnail"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//인기 여부를 만족하는 레시피의 총 수를 받아오는 메소드
	public int getArticleCount(int fame) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";

		int x = 0;

		try {
			con = getConnection();

			sql = "select count(*) from recipes ";
			if (fame == 1) {
				sql += "where reg_date>=(select date_add(now(),INTERVAL -1 MONTH) from dual) and readcount>=50 ";
			} else {
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt("count(*)");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//시작,끝,인기 여부를 만족하는 레시피를 받아오는 메소드
	public List<BoardDataBean> getArticles(int start, int end, int fame) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		List<BoardDataBean> articleList = null;
		try {
			con = getConnection();

			sql = "select * from recipes ";
			if (fame == 1) {
				sql += "where reg_date>=(select date_add(now(),INTERVAL -1 MONTH) from dual) and readcount>=50 order by readcount desc limit ?,?";
			} else {
				sql += "order by num desc limit ?,?";
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setContury(rs.getString("contury"));
					article.setFoodtype(rs.getString("foodtype"));
					article.setIngredients(rs.getString("ingredients"));
					article.setTools(rs.getString("tools"));
					article.setTitle(rs.getString("title"));
					article.setWriterid(rs.getString("writerid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					article.setThumbnail(rs.getString("thumbnail"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//대상 레시피의 조회수를 1 더하고 정보를 받아오는 메소드
	public BoardDataBean getArticle(int num) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		BoardDataBean article = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("update recipes set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement("select * from recipes where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setContury(rs.getString("contury"));
				article.setFoodtype(rs.getString("foodtype"));
				article.setIngredients(rs.getString("ingredients"));
				article.setTools(rs.getString("tools"));
				article.setWriterid(rs.getString("writerid"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setThumbnail(rs.getString("thumbnail"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//대상 레시피를 업데이트하기위해 정보를 받아오는 메소드
	public BoardDataBean updateGetArticle(int num) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		BoardDataBean article = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("select * from recipes where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setContury(rs.getString("contury"));
				article.setFoodtype(rs.getString("foodtype"));
				article.setIngredients(rs.getString("ingredients"));
				article.setTools(rs.getString("tools"));
				article.setWriterid(rs.getString("writerid"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setThumbnail(rs.getString("thumbnail"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//정보를 받아와 대상 레시피를 업데이트 하는 메소드
	public int updateArticle(BoardDataBean article) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;

		String sql = "";
		int x = -1;
		try {
			con = getConnection();

			sql = "update recipes set title=?,contury=?,foodtype=?,ingredients=?";
			sql += ",tools=? ,content=?, thumbnail=? where num=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContury());
			pstmt.setString(3, article.getFoodtype());
			pstmt.setString(4, article.getIngredients());
			pstmt.setString(5, article.getTools());
			pstmt.setString(6, article.getContent());
			pstmt.setString(7, article.getThumbnail());
			pstmt.setInt(8, article.getNum());
			pstmt.executeUpdate();
			x = 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//대상 레시피 삭제 메소드
	public int deleteArticle(int num) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		int x = -1;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("delete from recipes where num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			x = 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//대상 레시피의 댓글,답글 입력 메소드
	public void insertCommentsArticle(commentDataBean article, int rootin) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;

		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int maxNumber = 0;

		String sql = "";

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select max(num) from recipe_comment");
			rs = pstmt.executeQuery();

			if (rs.next())
				maxNumber = rs.getInt(1) + 1;
			else
				maxNumber = 1;

			if (num != 0) {
				sql = "update recipe_comment set re_step=re_step+1 ";
				sql += "where ref=? and re_step >? and rootin=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.setInt(3, rootin);
				pstmt.executeUpdate();
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {
				ref = maxNumber;
				re_step = 0;
				re_level = 0;
			}

			sql = "insert into recipe_comment(rootin,writerid,reg_date,ref,re_step,re_level,content";
			sql += ") values(?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rootin);
			pstmt.setString(2, article.getWriterid());
			pstmt.setTimestamp(3, article.getReg_date());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, re_step);
			pstmt.setInt(6, re_level);
			pstmt.setString(7, article.getContent());

			pstmt.executeUpdate();

			pointupdate(article.getWriterid(), 1, "댓글 작성");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//대상 레시피의 댓글 목록을 반환하는 메소드
	public List<commentDataBean> getCommentsArticles(int start, int end, int num) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		List<commentDataBean> articleList = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
					"select * from recipe_comment where rootin=? order by ref desc, re_step asc limit ?,? ");
			pstmt.setInt(1, num);
			pstmt.setInt(2, start - 1);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<commentDataBean>(end);
				do {
					commentDataBean article = new commentDataBean();
					article.setNum(rs.getInt("num"));
					article.setRootin(rs.getInt("rootin"));
					article.setWriterid(rs.getString("writerid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//대상 레시피의 댓글 수를 반환하는 메소드
	public int getCommentArticleCount(int num) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;

		int x = 0;

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select count(*) from recipe_comment where rootin=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//대상 레시피댓글 삭제 메소드
	public void deleteCommentArticle(int num) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;

		try {
			con = getConnection();

			pstmt = con.prepareStatement("delete from recipe_comment where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//초보용 레시피 작성에서 입력받은 값을 db에 저장하는 메소드 <><>
	public void insertexrecipeArticle(BoardDataBean article) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";

		try {
			con = getConnection();
			pstmt = con.prepareStatement("select max(num) from exrecipe");
			rs = pstmt.executeQuery();
			sql = "insert into exrecipe(title,contury,foodtype,ingredients,tools,writerid,reg_date,content,difficulty";
			sql += ") values(?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContury());
			pstmt.setString(3, article.getFoodtype());
			pstmt.setString(4, article.getIngredients());
			pstmt.setString(5, article.getTools());
			pstmt.setString(6, article.getWriterid());
			pstmt.setTimestamp(7, article.getReg_date());
			pstmt.setString(8, article.getContent());
			pstmt.setInt(9, article.getDifficulty());

			pstmt.executeUpdate();

			pointupdate(article.getWriterid(), 5, "레시피 작성");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//검색,난이도 여부를 만족하는 초보용 레시피의 총 수를 반환하는 메소드
	public int getexrecipeArticleCount(String type, String search, int difficulty) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";

		int x = 0;

		try {
			con = getConnection();

			if (type.equals("")) {
				sql = "select count(*) from exrecipe where 1=1 ";
			} else if (type.equals("제목")) {
				sql = "select count(*) from exrecipe where (contury like '%" + search + "%' or foodtype like '%"
						+ search + "%' or title like '%" + search + "%') ";
			} else if (type.equals("글쓴이")) {
				sql = "select count(*) from exrecipe where writerid in(select id from user where nkname like '%"
						+ search + "%') ";
			} else if (type.equals("재료")) {
				sql = "select count(*) from exrecipe where ingredients like '%" + search + "%' ";
			} else if (type.equals("도구")) {
				sql = "select count(*) from exrecipe where tools like '%" + search + "%' ";
			}

			if (difficulty != 0) {
				sql += "and difficulty=" + difficulty;
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//시작,끝,검색,난이도 여부를 만족하는 초보용 레시피 들의 정보를 받아오는 메소드
	public List<BoardDataBean> getexrecipeArticles(int start, int end, String type, String search, int difficulty)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		List<BoardDataBean> articleList = null;
		try {
			con = getConnection();
			if (type.equals("")) {
				sql = "select * from exrecipe where 1=1 ";
			} else if (type.equals("제목")) {
				sql = "select * from exrecipe where (title like '%" + search + "%') ";
			} else if (type.equals("글쓴이")) {
				sql = "select * from exrecipe where writerid in(select id from user where nkname like '%" + search
						+ "%') ";
			}
			if (difficulty != 0) {
				sql += "and difficulty=" + difficulty + " order by num desc limit ?,?";
			} else {
				sql += "order by num desc limit ?,?";
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setContury(rs.getString("contury"));
					article.setFoodtype(rs.getString("foodtype"));
					article.setTitle(rs.getString("title"));
					article.setWriterid(rs.getString("writerid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					article.setDifficulty(rs.getInt("difficulty"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//대상 초보용 레시피의 조회수를 1 더하고 정보를 받아오는 메소드
	public BoardDataBean getexrecipeArticle(int num) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		BoardDataBean article = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("update exrecipe set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement("select * from exrecipe where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setContury(rs.getString("contury"));
				article.setFoodtype(rs.getString("foodtype"));
				article.setIngredients(rs.getString("ingredients"));
				article.setTools(rs.getString("tools"));
				article.setWriterid(rs.getString("writerid"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setDifficulty(rs.getInt("difficulty"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//대상 초보용 레시피를 업데이트하기위해 정보를 받아오는 메소드
	public BoardDataBean updateexrecipeGetArticle(int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		BoardDataBean article = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("select * from exrecipe where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setContury(rs.getString("contury"));
				article.setFoodtype(rs.getString("foodtype"));
				article.setIngredients(rs.getString("ingredients"));
				article.setTools(rs.getString("tools"));
				article.setWriterid(rs.getString("writerid"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setDifficulty(rs.getInt("difficulty"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//정보를 받아와 대상 초보용 레시피를 업데이트 하는 메소드
	public int updateexrecipeArticle(BoardDataBean article) throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		String sql = "";
		int x = -1;
		try {
			con = getConnection();

			sql = "update exrecipe set title=?,contury=?,foodtype=?,ingredients=?";
			sql += ",tools=? ,content=?,difficulty=? where num=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContury());
			pstmt.setString(3, article.getFoodtype());
			pstmt.setString(4, article.getIngredients());
			pstmt.setString(5, article.getTools());
			pstmt.setString(6, article.getContent());
			pstmt.setInt(7, article.getDifficulty());
			pstmt.setInt(8, article.getNum());

			pstmt.executeUpdate();
			x = 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//대상 초보용 레시피 삭제 메소드
	public int deleteexrecipeArticle(int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		int x = -1;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("delete from exrecipe where num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			x = 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//대상 초보용 레시피의 댓글,답글 입력 메소드
	public void insertexrecipeCommentsArticle(commentDataBean article, int rootin) throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int maxNumber = 0;

		String sql = "";

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select max(num) from exrecipe_comment");
			rs = pstmt.executeQuery();

			if (rs.next())
				maxNumber = rs.getInt(1) + 1;
			else
				maxNumber = 1;

			if (num != 0) {
				sql = "update exrecipe_comment set re_step=re_step+1 ";
				sql += "where ref=? and re_step >? and rootin=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.setInt(3, rootin);
				pstmt.executeUpdate();
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {
				ref = maxNumber;
				re_step = 0;
				re_level = 0;
			}
			sql = "insert into exrecipe_comment(rootin,writerid,reg_date,ref,re_step,re_level,content";
			sql += ") values(?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rootin);
			pstmt.setString(2, article.getWriterid());
			pstmt.setTimestamp(3, article.getReg_date());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, re_step);
			pstmt.setInt(6, re_level);
			pstmt.setString(7, article.getContent());

			pstmt.executeUpdate();

			pointupdate(article.getWriterid(), 1, "댓글 작성");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//대상 초보용 레시피의 댓글 목록을 반환하는 메소드
	public List<commentDataBean> getexrecipeCommentsArticles(int start, int end, int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		List<commentDataBean> articleList = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
					"select * from exrecipe_comment where rootin=? order by ref desc, re_step asc limit ?,? ");
			pstmt.setInt(1, num);
			pstmt.setInt(2, start - 1);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<commentDataBean>(end);
				do {
					commentDataBean article = new commentDataBean();
					article.setNum(rs.getInt("num"));
					article.setRootin(rs.getInt("rootin"));
					article.setWriterid(rs.getString("writerid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//대상 초보용 레시피의 댓글 수를 반환하는 메소드
	public int getexrecipeCommentArticleCount(int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int x = 0;

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select count(*) from exrecipe_comment where rootin=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//요리강의 작성에서 입력받은 값을 db에 저장하는 메소드
	public void insertcookhelpArticle(BoardDataBean article) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select max(num) from cookhelp");
			rs = pstmt.executeQuery();
			sql = "insert into cookhelp(title,writerid,reg_date,content,thumbnail";
			sql += ") values(?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getWriterid());
			pstmt.setTimestamp(3, article.getReg_date());
			pstmt.setString(4, article.getContent());
			pstmt.setString(5, article.getThumbnail());

			pstmt.executeUpdate();

			pointupdate(article.getWriterid(), 5, "게시글 작성");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//검색 여부를 만족하는 요리강의의 총 수를 반환하는 메소드
	public int getcookhelpArticleCount(String search) throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int x = 0;

		try {
			con = getConnection();

			pstmt = con.prepareStatement(
					"select count(*) from cookhelp	where (tools like '%" + search + "%' or title like '%" + search
							+ "%' or writerid in(select id from user where nkname like '%" + search + "%'))");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//시작,끝,검색 여부를 만족하는 요리강의 들의 정보를 받아오는 메소드
	public List<BoardDataBean> getcookhelpArticles(int start, int end, String search) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		List<BoardDataBean> articleList = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("select * from cookhelp where (tools like '%" + search + "%' or title like '%"
					+ search + "%' or writerid in(select id from user where nkname like '%" + search
					+ "%')) order by num desc limit ?,? ");
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setTitle(rs.getString("title"));
					article.setWriterid(rs.getString("writerid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					article.setThumbnail(rs.getString("thumbnail"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//대상 요리강의의 조회수를 1 더하고 정보를 받아오는 메소드
	public int getcookhelpArticleCount() throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int x = 0;

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select count(*) from cookhelp");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//시작,끝 을 만족하는 요리강의 목록을 반환하는 메소드
	public List<BoardDataBean> getcookhelpArticles(int start, int end) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		List<BoardDataBean> articleList = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("select * from cookhelp order by num desc limit ?,? ");
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setTitle(rs.getString("title"));
					article.setWriterid(rs.getString("writerid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					article.setThumbnail(rs.getString("thumbnail"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//요리강의 조회수를 1 늘리고 정보를 반환하는 메소드
	public BoardDataBean getcookhelpArticle(int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		BoardDataBean article = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("update cookhelp set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement("select * from cookhelp where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();

				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setWriterid(rs.getString("writerid"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setThumbnail(rs.getString("thumbnail"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//대상 요리강의를 업데이트하기위해 정보를 받아오는 메소드
	public BoardDataBean updatecookhelpGetArticle(int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		BoardDataBean article = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("select * from cookhelp where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setWriterid(rs.getString("writerid"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setThumbnail(rs.getString("thumbnail"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//정보를 받아와 대상 요리강의를 업데이트 하는 메소드
	public int updatecookhelpArticle(BoardDataBean article) throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		String sql = "";
		int x = -1;
		try {
			con = getConnection();

			sql = "update cookhelp set title=?";
			sql += " ,content=?,thumbnail=? where num=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContent());
			pstmt.setString(3, article.getThumbnail());
			pstmt.setInt(4, article.getNum());
			pstmt.executeUpdate();

			x = 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//대상 요리강의 삭제 메소드 <><>
	public int deletecookhelpArticle(int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		int x = -1;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("delete from cookhelp where num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			x = 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//질답게시판 작성에서 입력받은 값을 db에 저장하는 메소드
	public void insertquestionArticle(QuestionDataBean article) throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int maxNumber = 0;

		String sql = "";

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select max(num) from question");
			rs = pstmt.executeQuery();

			if (rs.next())
				maxNumber = rs.getInt(1) + 1;
			else
				maxNumber = 1;

			if (num != 0) {
				sql = "update question set re_step=re_step+1 ";
				sql += "where ref=? and re_step >?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);

				pstmt.executeUpdate();
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {
				ref = maxNumber;
				re_step = 0;
				re_level = 0;
			}

			sql = "insert into question(title,writerid,content,reg_date,ref,re_step,re_level";
			sql += ") values(?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getWriterid());
			pstmt.setString(3, article.getContent());
			pstmt.setTimestamp(4, article.getReg_date());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);

			pstmt.executeUpdate();

			pointupdate(article.getWriterid(), 5, "질문/답변 작성");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//검색 여부를 만족하는 질답게시글의 총 수를 반환하는 메소드
	public int getquestionArticleCount(String search) throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int x = 0;

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select count(*) from question	where (title like '%" + search
					+ "%' or writerid in(select id from user where nkname like '%" + search + "%'))");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//시작,끝,검색 여부를 만족하는 질답게시글 들의 정보를 받아오는 메소드
	public List<QuestionDataBean> getquestionArticles(int start, int end, String search) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		List<QuestionDataBean> articleList = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("select * from question where (title like '%" + search
					+ "%' or writerid in(select id from user where nkname like '%" + search
					+ "%')) order by ref desc, re_step asc limit ?,? ");
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<QuestionDataBean>(end);
				do {
					QuestionDataBean article = new QuestionDataBean();
					article.setNum(rs.getInt("num"));
					article.setTitle(rs.getString("title"));
					article.setWriterid(rs.getString("writerid"));
					article.setContent(rs.getString("content"));
					article.setIsComplete(rs.getInt("isComplete"));
					article.setReadcount(rs.getInt("readcount"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//조건 없이 질답게시글의 총 수를 반환하는 메소드
	public int getquestionArticleCount() throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int x = 0;

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select count(*) from question");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//시작,끝 여부를 만족하는 질답게시판 들의 정보를 받아오는 메소드
	public List<QuestionDataBean> getquestionArticles(int start, int end) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		List<QuestionDataBean> articleList = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("select * from question order by ref desc, re_step asc limit ?,? ");
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<QuestionDataBean>(end);
				do {
					QuestionDataBean article = new QuestionDataBean();
					article.setNum(rs.getInt("num"));
					article.setTitle(rs.getString("title"));
					article.setWriterid(rs.getString("writerid"));
					article.setContent(rs.getString("content"));
					article.setIsComplete(rs.getInt("isComplete"));
					article.setReadcount(rs.getInt("readcount"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//대상 질답게시판의 조회수를 1 더하고 정보를 받아오는 메소드
	public QuestionDataBean getquestionArticle(int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		QuestionDataBean article = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("update question set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement("select * from question where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new QuestionDataBean();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setWriterid(rs.getString("writerid"));
				article.setContent(rs.getString("content"));
				article.setIsComplete(rs.getInt("isComplete"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//대상 질답게시판를 업데이트하기위해 정보를 받아오는 메소드
	public QuestionDataBean updatequestionGetArticle(int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		QuestionDataBean article = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("select * from question where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new QuestionDataBean();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setWriterid(rs.getString("writerid"));
				article.setContent(rs.getString("content"));
				article.setIsComplete(rs.getInt("isComplete"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//정보를 받아와 대상 질답게시판를 업데이트 하는 메소드
	public int updatequestionArticle(QuestionDataBean article) throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		String sql = "";
		int x = -1;
		try {
			con = getConnection();

			sql = "update question set title=?,content=?,isComplete=?";
			sql += " where num=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContent());
			pstmt.setInt(3, article.getIsComplete());
			pstmt.setInt(4, article.getNum());
			pstmt.executeUpdate();
			x = 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//대상 질답게시판 삭제 메소드
	public int deletequestionArticle(int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		int x = -1;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("delete from question where num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			x = 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//공지사항 작성에서 입력받은 값을 db에 저장하는 메소드
	public void insertannounceArticle(announceDataBean article) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select max(num) from announce");
			rs = pstmt.executeQuery();

			sql = "insert into announce(title,writerid,isEvent,reg_date,content,end_date,thumbnail";
			sql += ") values(?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getWriterid());
			pstmt.setString(3, article.getIsEvent());
			pstmt.setTimestamp(4, article.getReg_date());
			pstmt.setString(5, article.getContent());
			pstmt.setTimestamp(6, article.getEnd_date());
			pstmt.setString(7, article.getThumbnail());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//검색,이벤트 여부를 만족하는 공지사항의 총 수를 반환하는 메소드
	public int getannounceArticleCount(String search, String isEvent) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";

		int x = 0;

		try {
			con = getConnection();

			sql = "select count(*) from announce where title like '%" + search + "%'";
			if (isEvent != "2") {
				sql += " and isEvent = " + isEvent;
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//시작,끝,검색,이벤트 여부를 만족하는 공지사항 들의 정보를 받아오는 메소드
	public List<announceDataBean> getannounceArticles(int start, int end, String search, String isEvent,int isAvailable)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		List<announceDataBean> articleList = null;
		try {
			con = getConnection();

			sql = "select * from announce where title like '%" + search + "%' ";
			if (isEvent != "2") {
				sql += "and isEvent = " + isEvent;
			}
			if(isAvailable==1) {
				sql += " and end_date>=(select date_add(now(),INTERVAL 0 MONTH) from dual)";
			}
			sql += " order by num desc limit ?,?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<announceDataBean>(end);
				do {
					announceDataBean article = new announceDataBean();
					article.setNum(rs.getInt("num"));
					article.setTitle(rs.getString("title"));
					article.setIsEvent(rs.getString("isEvent"));
					article.setWriterid(rs.getString("writerid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setEnd_date(rs.getTimestamp("end_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					article.setThumbnail(rs.getString("thumbnail"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//이벤트 여부를 만족하는 공지사항의 총 수를 반환하는 메소드
	public int getannounceArticleCount(String isEvent) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";

		int x = 0;

		try {
			con = getConnection();

			sql = "select count(*) from announce";
			if (isEvent != "2") {
				sql += " where isEvent = " + isEvent;
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//시작,끝,이벤트 여부를 만족하는 공지사항 들의 정보를 받아오는 메소드
	public List<announceDataBean> getannounceArticles(int start, int end, String isEvent,int isAvailable) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		List<announceDataBean> articleList = null;
		try {
			con = getConnection();

			sql = "select * from announce";
			if (isEvent != "2") {
				sql += " where isEvent = " + isEvent;
			}
			if(isAvailable==1) {
				sql += " and end_date>=(select date_add(now(),INTERVAL 0 MONTH) from dual)";
			}
			sql += " order by num desc limit ?,?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<announceDataBean>(end);
				do {
					announceDataBean article = new announceDataBean();
					article.setNum(rs.getInt("num"));
					article.setTitle(rs.getString("title"));
					article.setIsEvent(rs.getString("isEvent"));
					article.setWriterid(rs.getString("writerid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setEnd_date(rs.getTimestamp("end_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					article.setThumbnail(rs.getString("thumbnail"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//대상 공지사항의 조회수를 1 더하고 정보를 받아오는 메소드
	public announceDataBean getannounceArticle(int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		announceDataBean article = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("update announce set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement("select * from announce where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new announceDataBean();

				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setIsEvent(rs.getString("isEvent"));
				article.setWriterid(rs.getString("writerid"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setThumbnail(rs.getString("thumbnail"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//대상 공지사항을 업데이트하기위해 정보를 받아오는 메소드
	public announceDataBean updateannounceGetArticle(int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		announceDataBean article = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("select * from announce where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new announceDataBean();

				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setIsEvent(rs.getString("isEvent"));
				article.setWriterid(rs.getString("writerid"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setEnd_date(rs.getTimestamp("end_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setThumbnail(rs.getString("thumbnail"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//정보를 받아와 대상 공지사항을 업데이트 하는 메소드
	public int updateannounceArticle(announceDataBean article) throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		String sql = "";
		int x = -1;
		try {
			con = getConnection();

			sql = "update announce set title=?,isEvent=?,end_date=?,content=?,thumbnail=? where num=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getIsEvent());
			pstmt.setTimestamp(3, article.getEnd_date());
			pstmt.setString(4, article.getContent());
			pstmt.setString(5, article.getThumbnail());
			pstmt.setInt(6, article.getNum());
			pstmt.executeUpdate();

			x = 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//대상 공지사항 삭제 메소드
	public int deleteannounceArticle(int num) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		int x = -1;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("delete from announce where num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			x = 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//제품 작성에서 입력받은 값을 db에 저장하는 메소드
	public void insertproductArticle(productDataBean article) throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		String sql = "";

		try {
			con = getConnection();

			sql = "insert into product(productName,isTool,productType,price,discountRate,productThumb";
			sql += ") values(?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, article.getProductName());
			pstmt.setInt(2, article.getIsTool());
			pstmt.setInt(3, article.getProductType());
			pstmt.setInt(4, article.getPrice());
			pstmt.setInt(5, article.getDiscountRate());
			pstmt.setString(6, article.getProductThumb());

			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}

	}
	//검색,인기 여부를 만족하는 제품의 총 수를 반환하는 메소드
	public int getproductArticleCount(int isTool, int type, String search) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";

		int x = 0;

		try {
			con = getConnection();

			sql = "select count(*) from product where 1=1";

			if (isTool != 0) {
				sql += " and isTool=" + isTool;
			}
			if (type != 0) {
				sql += " and productType=" + type;
			}
			if (search != null) {
				sql += " and productName like '%" + search + "%'";
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt("count(*)");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	//시작,끝,도구,타입 여부를 만족하는 제품 들의 정보를 받아오는 메소드
	public List<productDataBean> getproductArticles(int start, int end, int isTool, int type, String search)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		List<productDataBean> articleList = null;
		try {
			con = getConnection();

			sql = "select * from product where 1=1";

			if (isTool != 0) {
				sql += " and isTool=" + isTool;
			}
			if (type != 0) {
				sql += " and productType=" + type;
			}
			if (search != null) {
				sql += " and productName like '%" + search + "%'";
			}

			sql += " order by productName asc limit ?,?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<productDataBean>(end);
				do {
					productDataBean article = new productDataBean();
					article.setProductId(rs.getInt("productId"));
					article.setProductName(rs.getString("productName"));
					article.setIsTool(rs.getInt("isTool"));
					article.setProductType(rs.getInt("productType"));
					article.setPrice(rs.getInt("price"));
					article.setDiscountRate(rs.getInt("discountRate"));
					article.setProductThumb(rs.getString("productThumb"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//대상 제품의 정보를 받아오는 메소드
	public productDataBean getproductArticle(int productId) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		productDataBean article = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("select * from product where productId = ?");
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new productDataBean();
				article.setProductId(rs.getInt("productId"));
				article.setProductName(rs.getString("productName"));
				article.setIsTool(rs.getInt("isTool"));
				article.setProductType(rs.getInt("productType"));
				article.setPrice(rs.getInt("price"));
				article.setDiscountRate(rs.getInt("discountRate"));
				article.setProductThumb(rs.getString("productThumb"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//정보를 받아와 대상 제품을 업데이트 하는 메소드
	public void updateproductArticle(productDataBean article) throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		String sql = "";
		try {
			con = getConnection();

			sql = "update product set productName=?,isTool=?,productType=?,price=?,discountRate=?,productThumb=? where productId=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, article.getProductName());
			pstmt.setInt(2, article.getIsTool());
			pstmt.setInt(3, article.getProductType());
			pstmt.setInt(4, article.getPrice());
			pstmt.setInt(5, article.getDiscountRate());
			pstmt.setString(6, article.getProductThumb());
			pstmt.setInt(7, article.getProductId());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//대상 제품 삭제 메소드
	public void deleteproductArticle(int productId) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("delete from product where productId=?");
			pstmt.setInt(1, productId);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//장바구니 에 추가된 제품의 정보를 유저 id와 갯수를 함께 db에 저장하는 메소드
	public void insertcartArticle(int productId, int productcount, String ownerid) throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement("select * from product where productId = ?");
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String sql = "insert into cart(owner,productCount,productId,";
				sql += "productName,isTool,productType,price,discountRate,productThumb";
				sql += ") values(?,?,?,?,?,?,?,?,?)";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, ownerid);
				pstmt.setInt(2, productcount);
				pstmt.setInt(3, productId);
				pstmt.setString(4, rs.getString("productName"));
				pstmt.setInt(5, rs.getInt("isTool"));
				pstmt.setInt(6, rs.getInt("productType"));
				pstmt.setInt(7, rs.getInt("price"));
				pstmt.setInt(8, rs.getInt("discountRate"));
				pstmt.setString(9, rs.getString("productThumb"));

				pstmt.executeUpdate();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//대상 유저의 장바구니의 총 수를 반환하는 메소드
	public int getcartArticlecount(String ownerid) {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		int count = 0;
		try {
			con = getConnection();
			sql = "select count(*) from cart where owner=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, ownerid);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return count;
	}
	//대상 유저의 장바구니 들의 정보를 받아오는 메소드
	public List<productDataBean> getcartArticles(String ownerid) {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		List<productDataBean> articleList = null;
		try {
			con = getConnection();
			sql = "select * from cart where owner=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, ownerid);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<productDataBean>();
				do {
					productDataBean article = new productDataBean();
					article.setCartId(rs.getInt("cartId"));
					article.setOwner(rs.getString("owner"));
					article.setProductCount(rs.getInt("productCount"));
					article.setProductId(rs.getInt("productId"));
					article.setProductName(rs.getString("productName"));
					article.setIsTool(rs.getInt("isTool"));
					article.setProductType(rs.getInt("productType"));
					article.setPrice(rs.getInt("price"));
					article.setDiscountRate(rs.getInt("DiscountRate"));
					article.setProductThumb(rs.getString("productThumb"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//대상 장바구니 번호의 장바구니 정보를 받아오는 메소드
	public List<productDataBean> getcartArticles(int[] cartid) {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		List<productDataBean> articleList = null;
		try {
			con = getConnection();
			sql = "select * from cart where cartid in(" + cartid[0];
			for (int i = 1; i < cartid.length; i++) {
				sql += "," + cartid[i];
			}
			sql += ")";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<productDataBean>();
				do {
					productDataBean article = new productDataBean();
					article.setCartId(rs.getInt("cartId"));
					article.setOwner(rs.getString("owner"));
					article.setProductCount(rs.getInt("productCount"));
					article.setProductId(rs.getInt("productId"));
					article.setProductName(rs.getString("productName"));
					article.setIsTool(rs.getInt("isTool"));
					article.setProductType(rs.getInt("productType"));
					article.setPrice(rs.getInt("price"));
					article.setDiscountRate(rs.getInt("DiscountRate"));
					article.setProductThumb(rs.getString("productThumb"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//대상 장바구니 삭제 메소드
	public void deletecartArticle(int cartid) {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "delete from cart where cartid =" + cartid;
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//대상 유저의 장바구니 삭제 메소드
	public void deletecartArticle(String owner) {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "delete from cart where owner=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, owner);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//결제 메소드, 결제 내역 작성, 장바구니 비우기, 포인트 등락 내역 저장을 하는 메소드
	public void SendCartToBuy(int[] cartid, buyDataBean requestArticle) {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		String owner = "";
		int pointused = requestArticle.getPointused();
		int totalprice = 0;
		int pointadd = 0;
		int maxnumber = 0;
		String productnameforpointhist = "";
		int rslength = 0;
		String sanction = "";

		try {
			con = getConnection();

			sql = "select max(buyId) from buy";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxnumber = rs.getInt(1) + 1;
			}

			sql = "select productCount,price,discountRate from cart where cartid in(" + cartid[0];
			for (int i = 1; i < cartid.length; i++) {
				sql += "," + cartid[i];
			}
			sql += ")";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					int count = rs.getInt("productCount");
					int price = rs.getInt("price") * (100 - rs.getInt("discountRate")) / 100;
					totalprice += count * price;
				} while (rs.next());
			}

			if (totalprice < pointused) {
				pointused = totalprice;
			}
			pointadd = totalprice / 100;

			sql = "select * from cart where cartid in(" + cartid[0];
			for (int i = 1; i < cartid.length; i++) {
				sql += "," + cartid[i];
			}
			sql += ")";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (requestArticle.getAccountId() == 0) {
				sanction = "상품준비중";
			} else {
				sanction = "입금대기중";
			}

			if (rs.next()) {
				productnameforpointhist = rs.getString("productName");
				do {
					rslength++;
					sql = "insert into buy(ref,pointused,owner,productCount,productId,productName";
					sql += ",isTool,productType,price,discountRate,productThumb";
					sql += ",accountName,accountid,deliveryName,deliveryTel,deliveryMessage,deliveryAddrnum";
					sql += ",deliveryAddress,deliveryDetailAdd,buydate,sanction";
					sql += ") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, maxnumber);
					pstmt.setInt(2, pointused);

					pstmt.setString(3, rs.getString("owner"));
					owner = rs.getString("owner");
					pstmt.setInt(4, rs.getInt("productCount"));
					pstmt.setInt(5, rs.getInt("productId"));
					pstmt.setString(6, rs.getString("productName"));
					pstmt.setInt(7, rs.getInt("isTool"));
					pstmt.setInt(8, rs.getInt("productType"));
					pstmt.setInt(9, rs.getInt("price"));
					pstmt.setInt(10, rs.getInt("discountRate"));
					pstmt.setString(11, rs.getString("productThumb"));
					pstmt.setString(12, requestArticle.getAccountName());
					pstmt.setInt(13, requestArticle.getAccountId());
					pstmt.setString(14, requestArticle.getDeliveryName());
					pstmt.setString(15, requestArticle.getDeliveryTel());
					pstmt.setString(16, requestArticle.getDeliveryMessage());
					pstmt.setString(17, requestArticle.getDeliveryAddrnum());
					pstmt.setString(18, requestArticle.getDeliveryAddress());
					pstmt.setString(19, requestArticle.getDeliveryDetailAdd());
					pstmt.setTimestamp(20, ts);
					pstmt.setString(21, sanction);

					pstmt.executeUpdate();

				} while (rs.next());
			}
			deletecartArticle(owner);
			if (requestArticle.getAccountId() == 0||requestArticle.getAccountId() > 5) {
				if (rslength == 1) {
					pointupdate(owner, pointadd, productnameforpointhist + " 구매");
				} else {
					pointupdate(owner, pointadd, productnameforpointhist + " 외" + (rslength - 1) + " 개 제품 구매");
				}
				if(pointused>=0) {
					pointupdate(owner, -1 * pointused, "물품 구매에 사용");
				}
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//대상 유저의 결제내역을 묶음 단위 값들만 반환하는 메소드
	public int[] getDistinctBuyRefs(String userId) {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		int refcount = 0;
		int refarray[] = null;
		String condition = "";
		if (userId.equals("") || userId == null) {
			condition = " 1+1 ";
		} else {
			condition = " owner='" + userId + "'";
		}
		try {
			con = getConnection();

			sql = "select count(distinct ref) from buy where " + condition;

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				refcount = rs.getInt(1);
				refarray = new int[refcount];
			}

			sql = "select distinct ref from buy where " + condition;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int i = 0;
				do {
					refarray[i] = rs.getInt(1);
					i++;
				} while (rs.next());
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return refarray;
	}
	//묶음 단위를 통해 구매한 제품의 세부정보를 가져오는 메소드
	public List<buyDataBean> getbuyArticles(int refnumber) {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		List<buyDataBean> articleList = null;

		try {
			con = getConnection();
			sql = "select * from buy where ref=" + refnumber;
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<buyDataBean>();
				do {
					buyDataBean article = new buyDataBean();
					article.setBuyId(rs.getInt("buyId"));
					article.setRef(rs.getInt("ref"));
					article.setPointused(rs.getInt("pointused"));
					article.setOwner(rs.getString("owner"));
					article.setProductCount(rs.getInt("productCount"));
					article.setProductId(rs.getInt("productId"));
					article.setProductName(rs.getString("productName"));
					article.setIsTool(rs.getInt("isTool"));
					article.setProductType(rs.getInt("productType"));
					article.setPrice(rs.getInt("price"));
					article.setDiscountRate(rs.getInt("discountRate"));
					article.setAccountName(rs.getString("accountName"));
					article.setAccountId(rs.getInt("accountId"));
					article.setDeliveryName(rs.getString("deliveryName"));
					article.setDeliveryTel(rs.getString("deliveryTel"));
					article.setDeliveryMessage(rs.getString("deliveryMessage"));
					article.setDeliveryAddrnum(rs.getString("deliveryAddrnum"));
					article.setDeliveryAddress(rs.getString("deliveryAddress"));
					article.setDeliveryDetailAdd(rs.getString("deliveryDetailAdd"));
					article.setBuydate(rs.getTimestamp("buydate"));
					article.setSanction(rs.getString("sanction"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	//묶음 단위의 제품 갯수를 반환하는 메소드
	public int getbuyArticleCount(int refnumber) {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		int articlecount = 0;

		try {
			con = getConnection();
			sql = "select count(*) from buy where ref=" + refnumber;
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			articlecount = rs.getInt(1);

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articlecount;
	}
	//은행 계정id를 통해 은행 계정의 정보를 받아오는 메소드
	public bankDataBean getbankArticle(int accountid) {
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		bankDataBean article = new bankDataBean();

		try {
			con = getConnection();

			sql = "select * from bank where accountid=" + accountid;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article.setAccountId(rs.getInt("accountid"));
				article.setBank(rs.getString("bank"));
				article.setBanknum(rs.getString("banknum"));
				article.setOwner(rs.getString("owner"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	//무통장 이체의 입금 확인시, 결제 상태변경, 포인트 등락 적용
	public void confirmPay(int buyref, int buytotalprice, int buypointused, String buytitle) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;

		String sql = "";
		String owner = "";
		try {
			con = getConnection();
			sql = "update buy set sanction=?,accountName=?,accountid=? where ref=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, "상품준비중");
			pstmt.setString(2, "무계좌 이체 완료");
			pstmt.setInt(3, 0);
			pstmt.setInt(4, buyref);
			pstmt.executeUpdate();

			sql = "select distinct owner from buy where ref=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, buyref);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				owner = rs.getString(1);
			}
			pointupdate(owner, buytotalprice / 100, buytitle + " 구매");
			if (buypointused >= 0) {
				pointupdate(owner, -1 * buypointused, "물품 구매에 사용");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	//결제 상태를 변경하는 메소드
	public void changebuystatus(int buyref, String buystatus) throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;

		String sql = "";
		try {
			con = getConnection();
			sql = "update buy set sanction=? where ref=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, buystatus);
			pstmt.setInt(2, buyref);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public void insertaskArticle(askDataBean article) {
		con = null;
		pstmt = null;
		rs = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select max(id) from ask");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int maxidnum=rs.getInt(1);
	
				String sql = "insert into ask(id,title,asktype,content,atteched,ref_date";
				sql += ") values(?,?,?,?,?,?)";
	
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, maxidnum);
				pstmt.setString(2, article.getTitle());
				pstmt.setString(3, article.getAsktype());
				pstmt.setString(4, article.getContent());
				pstmt.setString(5, article.getAtteched());
				pstmt.setTimestamp(6,ts);
				pstmt.executeUpdate();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public askDataBean getaskArticle(int id) {
		con = null;
		pstmt = null;
		rs = null;
		askDataBean article=new askDataBean();
		try {
			con = getConnection();
			String sql="select * from ask where id="+id;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article.setId(id);
				article.setTitle(rs.getString("title"));
				article.setWriterid(rs.getString("writerid"));
				article.setAsktype(rs.getString("asktype"));
				article.setContent(rs.getString("content"));
				article.setAtteched(rs.getString("atteched"));
				article.setReg_date(rs.getTimestamp("reg_date"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	public int getaskArticlecount(String search,String searchtype) {
		con = null;
		pstmt = null;
		rs = null;
		int idcount=0;
		try {
			con = getConnection();
			String sql="select count(id) from ask where 1+1 ";
			if(searchtype.equals("제목")) {
				sql+="and (title like '%"+search+"%' or asktype like '%"+search+"%') ";
			}else if(searchtype.equals("작성자")) {
				sql+="and writerid in(select id from user where nkname like '%"+search+"%')";
			}
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				idcount=rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return idcount;
	}
	public List<askDataBean> getaskArticles(String search,String searchtype) {
		con = null;
		pstmt = null;
		rs = null;
		List<askDataBean> articleList = new ArrayList<askDataBean>();
		try {
			con = getConnection();
			String sql="select * from ask where 1+1";
			
			if(searchtype.equals("제목")) {
				sql+="and (title like '%"+search+"%' or asktype like '%"+search+"%') ";
			}else if(searchtype.equals("작성자")) {
				sql+="and writerid in(select id from user where nkname like '%"+search+"%')";
			}
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					askDataBean article=new askDataBean();
					article.setId(rs.getInt("id"));
					article.setTitle(rs.getString("title"));
					article.setWriterid(rs.getString("writerid"));
					article.setAsktype(rs.getString("asktype"));
					article.setContent(rs.getString("content"));
					article.setAtteched(rs.getString("atteched"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					articleList.add(article);
				}while(rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public void deleteaskArticle(int id) {
		con = null;
		pstmt = null;
		rs = null;
		try {
			con = getConnection();
			String sql="delete from ask where id="+id;
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
}