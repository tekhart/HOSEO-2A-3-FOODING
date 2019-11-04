package DBBean; 

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class foodingBean {

	Connection con=null;
	Statement stmt=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String str=null;
	

	
	SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
	Calendar cal = Calendar.getInstance();
	String today = formatter.format(cal.getTime());
	Timestamp ts = Timestamp.valueOf(today);
	
	
	public void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(Exception e) {
			System.out.println("Driver Loading Error");
		}
	
		try {
			String jdbcUrl="jdbc:mysql://localhost:3306/fooding_db";
			String dbId="foodingid";
			String dbPass="foodingpw";
			
			con=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}	
	public ResultSet resultQuery(String sql) {
		DBclose();
		try {
			con = getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
		}catch(Exception e) {
			e.printStackTrace();
			rs=null;
		}
		return rs;
	}	
	public void nonResultQuery(String sql) {
		DBclose();
		try {
			con = getConnection();
			stmt=con.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBclose();
		}
	}
	public String findnkname(String id) {
		DBclose();
		try {
			con = getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery("select nkname from user where id='"+id+"';");
			if(rs.next()) {
				str=rs.getString("nkname");
			}
		}catch(Exception e) {
			e.printStackTrace();
			rs=null;
			str="";
		}finally {
			DBclose();
		}
		return str;
	}
	public int isAdmincheck(String id) {
		DBclose();
		int isAdminresult=0;
		try {
			con = getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery("select isAdmin from user where id='"+id+"';");
			if(rs.next()) {
				isAdminresult=rs.getInt("isAdmin");
			}
		}catch(Exception e) {
			e.printStackTrace();
			rs=null;
			isAdminresult=0;
		}finally {
			DBclose();
		}
		return isAdminresult;
	}
	public void DBclose() {
		stmtClosing();
		pstmtClosing();
		resultclosing();
		DBClosing();
	}
	public void stmtClosing() {
		if(stmt!=null) {
			try {
				stmt.close();
			}catch(Exception e) {}
		}
	}
	public void pstmtClosing() {
		if(pstmt!=null) {
			try {
				pstmt.close();
			}catch(Exception e) {}
		}
	}
	public void resultclosing() {
		if(rs!=null) {
			try {
				rs.close();
			}catch(Exception e) {}
		}
	}
	
	public void DBClosing() {
		if(con!=null) {
			try {
				con.close();
			}catch(Exception e) {}
		}
	}
	
	private static foodingBean instance = new foodingBean();
	//.jsp�럹�씠吏��뿉�꽌 DB�뿰�룞鍮덉씤 recipesDBBean�겢�옒�뒪�쓽 硫붿냼�뱶�뿉 �젒洹쇱떆 �븘�슂
	public static foodingBean getInstance() {
		return instance;
	}
	
	//而ㅻ꽖�뀡��濡쒕��꽣 Connection媛앹껜瑜� �뼸�뼱�깂
	private Connection getConnection() throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(Exception e) {
			System.out.println("Driver Loading Error");
		}
		String jdbcUrl="jdbc:mysql://localhost:3306/fooding_db";
		String dbId="foodingid";
		String dbPass="foodingpw";
		
		return DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	}
	
	public int insertUserArticle(userDataBean article)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		int sucessed=0;
		
		String sql="";

		try {
			con = getConnection();			
			// 荑쇰━瑜� �옉�꽦
			sql = "insert into user(nkname,id,passwd,email,addrnum,address,detailaddr,gender,reg_date,userface";
			sql+=") values(?,?,?,?,?,?,?,?,?,?)";

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
			
			sucessed=1;
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return sucessed;
	}
	public userDataBean getuserArticle(String userid)
			throws Exception{
		con = null;
		pstmt = null;
		rs = null;
		userDataBean article=null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(
				"select * from user where id = ?");
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
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	public void pointupdate(String userid,int updatevalue,String adjestreason)
			throws Exception{
		con = null;
		pstmt = null;
		rs = null;
		String sql="";
		
		try {
			con = getConnection();
			sql="update user set mileage=mileage+"+updatevalue+" where id='"+userid+"'";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql="insert into pointhistory(owner,pointadjest,adjestreason,reg_date) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, updatevalue);
			pstmt.setString(3, adjestreason);
			pstmt.setTimestamp(4, ts);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
	public List<pointDataBean> getPointArticle(String userid,int getlimitBydate)
			throws Exception{
		con = null;
		pstmt = null;
		rs = null;
		String sql="";
		List<pointDataBean> articleList=new ArrayList<pointDataBean>();
		
		try {
			con = getConnection();
			sql="select * from pointhistory where owner='"+userid+"'";
			if(getlimitBydate!=0) {
				sql+=" and reg_date>=(select date_add(now(),INTERVAL ? Day) from dual)";
			}

			pstmt = con.prepareStatement(sql);
			
			if(getlimitBydate!=0) {
				pstmt.setInt(1,-1*getlimitBydate);
			}
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				do{
					pointDataBean article = new pointDataBean();
					article.setNum(rs.getInt("num"));
					article.setOwner(rs.getString("owner"));
					article.setPointadjest(rs.getInt("pointadjest"));
					article.setAdjestreason(rs.getString("adjestreason")); 
					article.setReg_date(rs.getTimestamp("reg_date"));
					articleList.add(article);
				}while(rs.next());
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public List<userDataBean> getuserArticles()
			throws Exception{
		con = null;
		pstmt = null;
		rs = null;
		userDataBean article=null;
		List<userDataBean> articleList=new ArrayList<userDataBean>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(
				"select * from user");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do{
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
				}while(rs.next());
			}
			} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public int userWannaLeft(String userid)
			throws Exception{
		con = null;
		pstmt = null;
		rs = null;
		String sql="";
		int sucessed=0;
		
		try {
			con = getConnection();
			sql="update user set passwd='',email='',addrnum='',address='',detailaddr=''";
			sql+=",gender='',reg_date=null,mileage=0,isAdmin=0,userface='../img/userface/defaultface.png',isLeft=1";
			sql+=" where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.executeUpdate();
			sucessed=1;
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return sucessed;
	}
	//recipes�뀒�씠釉붿뿉 湲��쓣 異붽�(insert臾�)<=writePro.jsp�럹�씠吏��뿉�꽌 �궗�슜
	public void insertArticle(BoardDataBean article) 
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		
		String sql="";

		try {
			con = getConnection();
			
			
			pstmt = con.prepareStatement("select max(num) from recipes");
			rs = pstmt.executeQuery();
			
			// 荑쇰━瑜� �옉�꽦
			sql = "insert into recipes(title,contury,foodtype,ingredients,tools,writerid,reg_date,content,thumbnail";
			sql+=") values(?,?,?,?,?,?,?,?,?)";

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

			pointupdate(article.getWriterid(),5,"레시피 작성");
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public int getArticleCount(String type,String search,int fame)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql="";

		int x=0;

		try {
			con = getConnection();
			
			if(type.equals("제목")) {
				sql="select count(*) from recipes	where (contury like '%"+search+"%' or foodtype like '%"+search+"%' or title like '%"+search+"%') ";
			}else if(type.equals("글쓴이")) {
				sql="select count(*) from recipes	where writerid in(select id from user where nkname like '%"+search+"%') ";
			}else if(type.equals("재료")) {
				sql="select count(*) from recipes	where ingredients like '%"+search+"%' ";
			}else if(type.equals("도구")) {
				sql="select count(*) from recipes	where tools like '%"+search+"%' ";
			}
			if(fame==1) {
				sql+=" and reg_date>=(select date_add(now(),INTERVAL -1 MONTH) from dual) and readcount>=50 ";
			}
			
			if(type.equals("맞춤")) {
				String searchArray[]=search.split(",");
				sql="select sum((";
				for(int i=0;i<searchArray.length;i++) {
					if(i!=0) {
						sql+="+";
					}
					String searchDetail[]=searchArray[i].split(":");
					
					if(searchDetail[0].equals("재료")) {
						sql+="(ingredients like '%"+searchDetail[1]+"%')";
					}else if(searchDetail[0].equals("도구")) {
						sql+="(tools like '%"+searchDetail[1]+"%')";
					}else if(searchDetail[0].equals("나라")) {
						sql+="(contury like '%"+searchDetail[1]+"%')";
					}else if(searchDetail[0].equals("종류")) {
						sql+="(foodtype like '%"+searchDetail[1]+"%')";
					}else if(searchDetail[0].equals("상황")) {
						sql+="((title like '%"+searchDetail[1]+"%')";
						sql+="|(content like '%"+searchDetail[1]+"%'))";
					}else if(searchDetail[0].equals("사용자지정")) {
						sql+="((ingredients like '%"+searchDetail[1]+"%')";
						sql+="|(tools like '%"+searchDetail[1]+"%'))";
					}
				}
				sql+=")>="+(searchArray.length*0.25)+1+")as priority from recipes ";
			}
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	public List<BoardDataBean> getArticles(int start, int end,String type,String search,int fame)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql="";
		List<BoardDataBean> articleList=null;
		try {
			con = getConnection();
			
			if(type.equals("제목")) {
				sql="select * from recipes	where (contury like '%"+search+"%' or foodtype like '%"+search+"%' or title like '%"+search+"%') ";
			}else if(type.equals("글쓴이")) {
				sql="select * from recipes	where writerid in(select id from user where nkname like '%"+search+"%') ";
			}else if(type.equals("재료")) {
				sql="select * from recipes	where ingredients like '%"+search+"%' ";
			}else if(type.equals("도구")) {
				sql="select * from recipes	where tools like '%"+search+"%' ";
			}
			if(fame==1) {
				sql+="and reg_date>=(select date_add(now(),INTERVAL -1 MONTH) from dual) and readcount>=50 order by readcount desc limit ?,?";
			}else {
				sql+="order by num desc limit ?,?";
			}
			
			if(type.equals("맞춤")) {
				String searchArray[]=search.split(",");
				sql="select num,title,contury,foodtype,ingredients,tools,writerid,reg_date,readcount,content,thumbnail,(";
				for(int i=0;i<searchArray.length;i++) {
					if(i!=0) {
						sql+="+";
					}
					String searchDetail[]=searchArray[i].split(":");
					if(searchDetail[0].equals("재료")) {
						sql+="(ingredients like '%"+searchDetail[1]+"%')";
					}else if(searchDetail[0].equals("도구")) {
						sql+="(tools like '%"+searchDetail[1]+"%')";
					}else if(searchDetail[0].equals("나라")) {
						sql+="(contury like '%"+searchDetail[1]+"%')";
					}else if(searchDetail[0].equals("종류")) {
						sql+="(foodtype like '%"+searchDetail[1]+"%')";
					}else if(searchDetail[0].equals("상황")) {
						sql+="((title like '%"+searchDetail[1]+"%')";
						sql+="|(content like '%"+searchDetail[1]+"%'))";
					}else if(searchDetail[0].equals("사용자지정")) {
						sql+="((ingredients like '%"+searchDetail[1]+"%')";
						sql+="|(tools like '%"+searchDetail[1]+"%'))";
					}
				}
				sql+=")as priority from recipes having priority>="+(searchArray.length*0.25)+1+" order by priority desc,num desc limit ?,?";
			}
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				do{
				 BoardDataBean article= new BoardDataBean();
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
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public int getArticleCount(int fame)
			 throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql="";

		int x=0;

		try {
			con = getConnection();
			
			sql="select count(*) from recipes ";
			if(fame==1){
		 		sql+="where reg_date>=(select date_add(now(),INTERVAL -1 MONTH) from dual) and readcount>=50 ";
			}else {}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x= rs.getInt("count(*)");
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	public List<BoardDataBean> getArticles(int start, int end,int fame)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql="";
		List<BoardDataBean> articleList=null;
		try {
			con = getConnection();
			
			sql="select * from recipes ";
			if(fame==1) {
				sql+="where reg_date>=(select date_add(now(),INTERVAL -1 MONTH) from dual) and readcount>=50 order by readcount desc limit ?,?";
			}else {
				sql+="order by num desc limit ?,?";
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				do{
					BoardDataBean article= new BoardDataBean();
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
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public BoardDataBean getArticle(int num)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		BoardDataBean article=null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
				"update recipes set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement(
				"select * from recipes where num = ?");
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
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	public BoardDataBean updateGetArticle(int num)
				throws Exception {
		DBclose();
			con = null;
			pstmt = null;
			rs = null;
			BoardDataBean article=null;
			try {
				con = getConnection();

				pstmt = con.prepareStatement(
					"select * from recipes where num = ?");
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
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return article;
		}
	public int updateArticle(BoardDataBean article)
			throws Exception {
		DBclose();
			con = null;
			pstmt = null;
			rs= null;

			String sql="";
			int x=-1;
			try {
				con = getConnection();

				 
					sql="update recipes set title=?,contury=?,foodtype=?,ingredients=?";
					sql+=",tools=? ,content=?, thumbnail=? where num=?";
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
					x= 1;
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return x;
		}
	public int deleteArticle(int num)
			throws Exception {
		DBclose();
			con = null;
			pstmt = null;
			rs= null;
			int x=-1;
			try {
				con = getConnection();

						pstmt = con.prepareStatement(
							"delete from recipes where num=?");
						pstmt.setInt(1, num);
						pstmt.executeUpdate();
						x= 1; //湲��궘�젣 �꽦怨�
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return x;
		}
	
	public void insertCommentsArticle(commentDataBean article,int rootin) 
				throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
			
		

		
		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int maxNumber=0;

		String sql="";

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select max(num) from recipe_comment");
			rs = pstmt.executeQuery();
			
			if (rs.next())
				maxNumber=rs.getInt(1)+1;
			else
				maxNumber=1; 
			
			if (num!=0) {	
				sql="update recipe_comment set re_step=re_step+1 ";
				sql += "where ref=? and re_step >? and rootin=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_step);
			pstmt.setInt(3, rootin);
				pstmt.executeUpdate();
				re_step=re_step+1;
				re_level=re_level+1;
			 }else{
				ref=maxNumber;
				re_step=0;
				re_level=0;
			 }	
			
			
			sql = "insert into recipe_comment(rootin,writerid,reg_date,ref,re_step,re_level,content";
			sql+=") values(?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rootin);
			pstmt.setString(2, article.getWriterid());
			pstmt.setTimestamp(3, article.getReg_date());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, re_step);
			pstmt.setInt(6, re_level);
			pstmt.setString(7, article.getContent());
			
			pstmt.executeUpdate();

			pointupdate(article.getWriterid(),1,"댓글 작성");
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public List<commentDataBean> getCommentsArticles(int start, int end,int num)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		List<commentDataBean> articleList=null;
		try {
			con = getConnection();
			
			pstmt = con.prepareStatement(
				"select * from recipe_comment where rootin=? order by ref desc, re_step asc limit ?,? ");
			pstmt.setInt(1, num);
			pstmt.setInt(2, start-1);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				 articleList = new ArrayList<commentDataBean>(end);
				do{
					commentDataBean article= new commentDataBean();
					article.setNum(rs.getInt("num"));
					article.setRootin(rs.getInt("rootin"));
					article.setWriterid(rs.getString("writerid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					
						
						
					articleList.add(article);
					}while(rs.next());
				}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public int getCommentArticleCount(int num)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		
		int x=0;
		
		try {
			con = getConnection();
			
			pstmt = con.prepareStatement("select count(*) from recipe_comment where rootin=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x= rs.getInt(1);
 			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
 		return x;
	}

	public void insertexrecipeArticle(BoardDataBean article) 
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql="";
		
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select max(num) from exrecipe");
			rs = pstmt.executeQuery();
			
			
			// 荑쇰━瑜� �옉�꽦
			sql = "insert into exrecipe(title,contury,foodtype,ingredients,tools,writerid,reg_date,content,difficulty";
			sql+=") values(?,?,?,?,?,?,?,?,?)";

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

			pointupdate(article.getWriterid(),5,"레시피 작성");
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public void deleteCommentArticle(int num)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		
		int x=0;
		
		try {
			con = getConnection();
			
			pstmt = con.prepareStatement("delete from recipe_comment where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x= rs.getInt(1);
 			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public int getexrecipeArticleCount(String type,String search,int difficulty)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null; 
		String sql="";

		int x=0;

		try {
			con = getConnection();

			if(type.equals("")) {
				sql="select count(*) from exrecipe where 1=1 ";
			}else if(type.equals("제목")) {
				sql="select count(*) from exrecipe where (contury like '%"+search+"%' or foodtype like '%"+search+"%' or title like '%"+search+"%') ";
			}else if(type.equals("글쓴이")) {
				sql="select count(*) from exrecipe where writerid in(select id from user where nkname like '%"+search+"%') ";
			}else if(type.equals("재료")) {
				sql="select count(*) from exrecipe where ingredients like '%"+search+"%' ";
			}else if(type.equals("도구")) {
				sql="select count(*) from exrecipe where tools like '%"+search+"%' ";
			}
			
			if(difficulty!=0) {
				sql+="and difficulty="+difficulty;
			}
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x= rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	public List<BoardDataBean> getexrecipeArticles(int start, int end,String type,String search,int difficulty)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql="";
		List<BoardDataBean> articleList=null;
		try {
			con = getConnection();
			if(type.equals("")) {
				sql="select * from exrecipe where 1=1 ";
			}else if(type.equals("제목")) {
				sql="select * from exrecipe where (title like '%"+search+"%') ";
			}else if(type.equals("글쓴이")) {
				sql="select * from exrecipe where writerid in(select id from user where nkname like '%"+search+"%') ";
			}
			if(difficulty!=0) {
				sql+="and difficulty="+difficulty+" order by num desc limit ?,?";
			}else {
				sql+="order by num desc limit ?,?";
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				do{
						BoardDataBean article= new BoardDataBean();
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
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public BoardDataBean getexrecipeArticle(int num)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		BoardDataBean article=null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
				"update exrecipe set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement(
				"select * from exrecipe where num = ?");
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
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	public BoardDataBean updateexrecipeGetArticle(int num)
				throws Exception {
			con = null;
			pstmt = null;
			rs = null;
			BoardDataBean article=null;
			try {
				con = getConnection();

				pstmt = con.prepareStatement(
					"select * from exrecipe where num = ?");
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
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return article;
		}
	public int updateexrecipeArticle(BoardDataBean article)
			throws Exception {
			con = null;
			pstmt = null;
			rs= null;

			String sql="";
			int x=-1;
			try {
				con = getConnection();

				 
				sql="update exrecipe set title=?,contury=?,foodtype=?,ingredients=?";
				sql+=",tools=? ,content=?,difficulty=? where num=?";
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
				x= 1;
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return x;
		}
	public int deleteexrecipeArticle(int num)
			throws Exception {
			con = null;
			pstmt = null;
			rs= null;
			int x=-1;
			try {
				con = getConnection();

						pstmt = con.prepareStatement(
							"delete from exrecipe where num=?");
						pstmt.setInt(1, num);
						pstmt.executeUpdate();
						x= 1; //湲��궘�젣 �꽦怨�
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return x;
		}
	public void insertexrecipeCommentsArticle(commentDataBean article,int rootin) 
				throws Exception {
			con = null;
			pstmt = null;
				rs = null;

			int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int maxNumber=0;

			String sql="";

			try {
				con = getConnection();

				pstmt = con.prepareStatement("select max(num) from exrecipe_comment");
				rs = pstmt.executeQuery();
				
				if (rs.next())
					maxNumber=rs.getInt(1)+1;
				else
					maxNumber=1; 
				
				if (num!=0) {	
					sql="update exrecipe_comment set re_step=re_step+1 ";
					sql += "where ref=? and re_step >? and rootin=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.setInt(3, rootin);
					pstmt.executeUpdate();
					re_step=re_step+1;
					re_level=re_level+1;
				 }else{
						ref=maxNumber;
					re_step=0;
					re_level=0;
				 }	
				
				
				// 荑쇰━瑜� �옉�꽦
				sql = "insert into exrecipe_comment(rootin,writerid,reg_date,ref,re_step,re_level,content";
				sql+=") values(?,?,?,?,?,?,?)";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rootin);
				pstmt.setString(2, article.getWriterid());
				pstmt.setTimestamp(3, article.getReg_date());
				pstmt.setInt(4, ref);
				pstmt.setInt(5, re_step);
				pstmt.setInt(6, re_level);
				pstmt.setString(7, article.getContent());
				
				pstmt.executeUpdate();

				pointupdate(article.getWriterid(),1,"댓글 작성");
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
		}
	public List<commentDataBean> getexrecipeCommentsArticles(int start, int end,int num)
				throws Exception {
		 con = null;
		 pstmt = null;
		 rs = null;
		 List<commentDataBean> articleList=null;
		 try {
			 con = getConnection();
			 
			 pstmt = con.prepareStatement(
			 	"select * from exrecipe_comment where rootin=? order by ref desc, re_step asc limit ?,? ");
			 pstmt.setInt(1, num);
			 pstmt.setInt(2, start-1);
				 pstmt.setInt(3, end);
			 rs = pstmt.executeQuery();

			 if (rs.next()) {
				 articleList = new ArrayList<commentDataBean>(end);
				 do{
					 commentDataBean article= new commentDataBean();
					 article.setNum(rs.getInt("num"));
					 article.setRootin(rs.getInt("rootin"));
					 article.setWriterid(rs.getString("writerid"));
					 article.setReg_date(rs.getTimestamp("reg_date"));
					 article.setRef(rs.getInt("ref"));
					 article.setRe_step(rs.getInt("re_step"));
					 article.setRe_level(rs.getInt("re_level"));
					 article.setContent(rs.getString("content"));
						
					articleList.add(article);
					}while(rs.next());
				}
		 } catch(Exception ex) {
			 ex.printStackTrace();
		 } finally {
				DBclose();
		 }
			return articleList;
	 }
	public int getexrecipeCommentArticleCount(int num)
				throws Exception {
		 con = null;
		 pstmt = null;
		 rs = null;

		 int x=0;

		 try {
			 con = getConnection();
			 
			 pstmt = con.prepareStatement("select count(*) from exrecipe_comment where rootin=?");
			 pstmt.setInt(1, num);
			 rs = pstmt.executeQuery();

			 if (rs.next()) {
				x= rs.getInt(1);
 			}
		 } catch(Exception ex) {
			 ex.printStackTrace();
		 } finally {
		 	DBclose();
		 }
 		return x;
	 }
	
	public void insertcookhelpArticle(BoardDataBean article) 
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		String sql="";

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select max(num) from cookhelp");
			rs = pstmt.executeQuery();
			
			
			// 荑쇰━瑜� �옉�꽦
			sql = "insert into cookhelp(title,tools,writerid,reg_date,content,thumbnail";
			sql+=") values(?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getTools());
			pstmt.setString(3, article.getWriterid());
			pstmt.setTimestamp(4, article.getReg_date());
			pstmt.setString(5, article.getContent());
			pstmt.setString(6, article.getThumbnail());
			
			pstmt.executeUpdate();

			pointupdate(article.getWriterid(),5,"게시글 작성");
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public int getcookhelpArticleCount(String search)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int x=0;

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select count(*) from cookhelp	where (tools like '%"+search+"%' or title like '%"+search+"%' or writerid in(select id from user where nkname like '%"+search+"%'))");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x= rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	public List<BoardDataBean> getcookhelpArticles(int start, int end,String search)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		List<BoardDataBean> articleList=null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
				"select * from cookhelp where (tools like '%"+search+"%' or title like '%"+search+"%' or writerid in(select id from user where nkname like '%"+search+"%')) order by num desc limit ?,? ");
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				do{
				 BoardDataBean article= new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setWriterid(rs.getString("writerid"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setThumbnail(rs.getString("thumbnail"));


				 articleList.add(article);
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public int getcookhelpArticleCount()
			 throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int x=0;

		try {
			con = getConnection();
			
			pstmt = con.prepareStatement("select count(*) from cookhelp");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x= rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	public List<BoardDataBean> getcookhelpArticles(int start, int end)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		List<BoardDataBean> articleList=null;
		try {
			con = getConnection();
			
			pstmt = con.prepareStatement(
				"select * from cookhelp order by num desc limit ?,? ");
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				do{
				BoardDataBean article= new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
 				article.setWriterid(rs.getString("writerid"));
 				article.setReg_date(rs.getTimestamp("reg_date"));
 				article.setReadcount(rs.getInt("readcount"));
 				article.setContent(rs.getString("content"));
				article.setThumbnail(rs.getString("thumbnail"));
					
					
				 articleList.add(article);
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public BoardDataBean getcookhelpArticle(int num)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		BoardDataBean article=null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
				"update cookhelp set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement(
				"select * from cookhelp where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();
				
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setTools(rs.getString("tools"));
				article.setWriterid(rs.getString("writerid"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));	 
				article.setContent(rs.getString("content"));
				article.setThumbnail(rs.getString("thumbnail"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	public BoardDataBean updatecookhelpGetArticle(int num)
				throws Exception {
			con = null;
			pstmt = null;
			rs = null;
			BoardDataBean article=null;
			try {
				con = getConnection();

				pstmt = con.prepareStatement(
					"select * from cookhelp where num = ?");
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setTitle(rs.getString("title"));
					article.setTools(rs.getString("tools"));
					article.setWriterid(rs.getString("writerid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));	 
					article.setContent(rs.getString("content"));
					article.setThumbnail(rs.getString("thumbnail"));
				}
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return article;
		}
	public int updatecookhelpArticle(BoardDataBean article)
			throws Exception {
			con = null;
			pstmt = null;
			rs= null;

			String sql="";
			int x=-1;
			try {
				con = getConnection();

				 
					sql="update cookhelp set title=?";
					sql+=",tools=? ,content=?,thumbnail=? where num=?";
					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, article.getTitle());
					pstmt.setString(2, article.getTools());
					pstmt.setString(3, article.getContent());
					pstmt.setInt(4, article.getNum());
					pstmt.setString(5, article.getThumbnail());
					pstmt.executeUpdate();
					
						x= 1;
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return x;
		}
	public int deletecookhelpArticle(int num)
			throws Exception {
			con = null;
			pstmt = null;
			rs= null;
			int x=-1;
			try {
				con = getConnection();

						pstmt = con.prepareStatement(
							"delete from cookhelp where num=?");
						pstmt.setInt(1, num);
						pstmt.executeUpdate();
						x= 1; //湲��궘�젣 �꽦怨�
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return x;
		}
	public void insertcookhelpCommentsArticle(commentDataBean article,int rootin) 
				throws Exception {
			con = null;
			pstmt = null;
			rs = null;

			int num=article.getNum();
			int ref=article.getRef();
			int re_step=article.getRe_step();
			int re_level=article.getRe_level();
			int maxNumber=0;

			String sql="";

			try {
				con = getConnection();

				pstmt = con.prepareStatement("select max(num) from cookhelp_comment");
				rs = pstmt.executeQuery();
				
				if (rs.next())
					maxNumber=rs.getInt(1)+1;
				else
					maxNumber=1; 
				
				if (num!=0) {	
					sql="update cookhelp_comment set re_step=re_step+1 ";
					sql += "where ref=? and re_step >? and rootin=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.setInt(3, rootin);
					pstmt.executeUpdate();
					re_step=re_step+1;
					re_level=re_level+1;
				 }else{
						ref=maxNumber;
					re_step=0;
					re_level=0;
				 }	
				
				
				// 荑쇰━瑜� �옉�꽦
				sql = "insert into cookhelp_comment(rootin,writerid,reg_date,ref,re_step,re_level,content";
				sql+=") values(?,?,?,?,?,?,?)";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rootin);
				pstmt.setString(2, article.getWriterid());
				pstmt.setTimestamp(3, article.getReg_date());
				pstmt.setInt(4, ref);
				pstmt.setInt(5, re_step);
				pstmt.setInt(6, re_level);
				pstmt.setString(7, article.getContent());
				
				pstmt.executeUpdate();
				pointupdate(article.getWriterid(),5,"게시글 작성");
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
		}
	public List<commentDataBean> getcookhelpCommentsArticles(int start, int end,int num)
				throws Exception {
		 con = null;
		 pstmt = null;
		 rs = null;
		 List<commentDataBean> articleList=null;
		 try {
			 con = getConnection();
			 
			 pstmt = con.prepareStatement(
			 	"select * from cookhelp_comment where rootin=? order by ref desc, re_step asc limit ?,? ");
			 pstmt.setInt(1, num);
			 pstmt.setInt(2, start-1);
				 pstmt.setInt(3, end);
			 rs = pstmt.executeQuery();

			 if (rs.next()) {
				 articleList = new ArrayList<commentDataBean>(end);
				 do{
					 commentDataBean article= new commentDataBean();
					 article.setNum(rs.getInt("num"));
					 article.setRootin(rs.getInt("rootin"));
					 article.setWriterid(rs.getString("writerid"));
					 article.setReg_date(rs.getTimestamp("reg_date"));
					 article.setRef(rs.getInt("ref"));
					 article.setRe_step(rs.getInt("re_step"));
					 article.setRe_level(rs.getInt("re_level"));
					 article.setContent(rs.getString("content"));
					
						
						
					articleList.add(article);
					}while(rs.next());
				}
		 } catch(Exception ex) {
			 ex.printStackTrace();
		 } finally {
				DBclose();
		 }
			return articleList;
	 }
	public int getcookhelpCommentArticleCount(int num)
				throws Exception {
		 con = null;
		 pstmt = null;
		 rs = null;

		 int x=0;

		 try {
			 con = getConnection();
			 
			 pstmt = con.prepareStatement("select count(*) from cookhelp_comment where rootin=?");
			 pstmt.setInt(1, num);
			 rs = pstmt.executeQuery();

			 if (rs.next()) {
				x= rs.getInt(1);
 			}
		 } catch(Exception ex) {
			 ex.printStackTrace();
		 } finally {
		 	DBclose();
		 }
 		return x;
	 }

	public void insertquestionArticle(QuestionDataBean article) 
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int maxNumber=0;

			String sql="";

			try {
				con = getConnection();

				pstmt = con.prepareStatement("select max(num) from question");
				rs = pstmt.executeQuery();
				
				if (rs.next())
					maxNumber=rs.getInt(1)+1;
				else
					maxNumber=1; 
				
				if (num!=0) {	
					sql="update question set re_step=re_step+1 ";
					sql += "where ref=? and re_step >?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				
					pstmt.executeUpdate();
					re_step=re_step+1;
					re_level=re_level+1;
				 }else{
					ref=maxNumber;
					re_step=0;
					re_level=0;
				 }	
			
			
			sql = "insert into question(title,writerid,quesType,content,reg_date,ref,re_step,re_level";
			sql+=") values(?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getWriterid());
			pstmt.setString(3, article.getQuesType());
			pstmt.setString(4, article.getContent());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			
			pstmt.executeUpdate();

			pointupdate(article.getWriterid(),5,"질문/답변 작성");
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public int getquestionArticleCount(String search)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int x=0;

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select count(*) from question	where (title like '%"+search+"%' or writerid in(select id from user where nkname like '%"+search+"%'))");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x= rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	public List<QuestionDataBean> getquestionArticles(int start, int end,String search)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		List<QuestionDataBean> articleList=null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
				"select * from question where (title like '%"+search+"%' or writerid in(select id from user where nkname like '%"+search+"%')) order by ref desc, re_step asc limit ?,? ");
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<QuestionDataBean>(end);
				do{
				 QuestionDataBean article= new QuestionDataBean();
				 article.setNum(rs.getInt("num"));
				 article.setTitle(rs.getString("title"));
				 article.setWriterid(rs.getString("writerid"));
				 article.setQuesType(rs.getString("quesType"));
				 article.setContent(rs.getString("content"));
				 article.setIsComplete(rs.getInt("isComplete"));
				 article.setReadcount(rs.getInt("readcount"));
				 article.setReg_date(rs.getTimestamp("reg_date"));
				 article.setRef(rs.getInt("ref"));
				 article.setRe_step(rs.getInt("re_step"));
				 article.setRe_level(rs.getInt("re_level"));

				 articleList.add(article);
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public int getquestionArticleCount()
			 throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int x=0;

		try {
			con = getConnection();
			
			pstmt = con.prepareStatement("select count(*) from question");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x= rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	public List<QuestionDataBean> getquestionArticles(int start, int end)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		List<QuestionDataBean> articleList=null;
		try {
			con = getConnection();
			
			pstmt = con.prepareStatement(
				"select * from question order by ref desc, re_step asc limit ?,? ");
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<QuestionDataBean>(end);
				do{
				 QuestionDataBean article= new QuestionDataBean();
				 article.setNum(rs.getInt("num"));
				 article.setTitle(rs.getString("title"));
				 article.setWriterid(rs.getString("writerid"));
				 article.setQuesType(rs.getString("quesType"));
				 article.setContent(rs.getString("content"));
				 article.setIsComplete(rs.getInt("isComplete"));
				 article.setReadcount(rs.getInt("readcount"));
				 article.setReg_date(rs.getTimestamp("reg_date"));
				 article.setRef(rs.getInt("ref"));
				 article.setRe_step(rs.getInt("re_step"));
				 article.setRe_level(rs.getInt("re_level"));
					
					
				 articleList.add(article);
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public QuestionDataBean getquestionArticle(int num)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		QuestionDataBean article=null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
				"update question set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement(
				"select * from question where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new QuestionDataBean();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setWriterid(rs.getString("writerid"));
				article.setQuesType(rs.getString("quesType"));
				article.setContent(rs.getString("content"));
				article.setIsComplete(rs.getInt("isComplete"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	public QuestionDataBean updatequestionGetArticle(int num)
				throws Exception {
			con = null;
			pstmt = null;
			rs = null;
			QuestionDataBean article=null;
			try {
				con = getConnection();

				pstmt = con.prepareStatement(
					"select * from question where num = ?");
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					 article = new QuestionDataBean();
					 article.setNum(rs.getInt("num"));
					 article.setTitle(rs.getString("title"));
					 article.setWriterid(rs.getString("writerid"));
					 article.setQuesType(rs.getString("quesType"));
					 article.setContent(rs.getString("content"));
					 article.setIsComplete(rs.getInt("isComplete"));
					 article.setReg_date(rs.getTimestamp("reg_date"));
					 article.setRef(rs.getInt("ref"));
					 article.setRe_step(rs.getInt("re_step"));
					 article.setRe_level(rs.getInt("re_level"));
				}
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return article;
		}
	public int updatequestionArticle(QuestionDataBean article)
			throws Exception {
			con = null;
			pstmt = null;
			rs= null;

			String sql="";
			int x=-1;
			try {
				con = getConnection();

				 
					sql="update question set title=?,contury=?,foodtype=?,ingredients=?";
					sql+=",tools=? ,content=? where num=?";
					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, article.getTitle());
					pstmt.setString(2, article.getWriterid());
					pstmt.setString(3, article.getQuesType());
					pstmt.setString(4, article.getContent());
					pstmt.setInt(5, article.getIsComplete());
					pstmt.setTimestamp(6, article.getReg_date());
					pstmt.setInt(7, article.getRef());
					pstmt.setInt(8, article.getRe_step());
					pstmt.setInt(9, article.getRe_level());
					pstmt.setInt(7, article.getNum());
					pstmt.executeUpdate();
					x= 1;
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return x;
		}
	public int deletequestionArticle(int num)
			throws Exception {
			con = null;
			pstmt = null;
			rs= null;
			int x=-1;
			try {
				con = getConnection();

						pstmt = con.prepareStatement(
							"delete from question where num=?");
						pstmt.setInt(1, num);
						pstmt.executeUpdate();
						x= 1; 
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return x;
		}
	public void insertquestionCommentsArticle(commentDataBean article,int rootin) 
				throws Exception {
			con = null;
			pstmt = null;
				rs = null;

			int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int maxNumber=0;

			String sql="";

			try {
				con = getConnection();

				pstmt = con.prepareStatement("select max(num) from question_comment");
				rs = pstmt.executeQuery();
				
				if (rs.next())
					maxNumber=rs.getInt(1)+1;
				else
					maxNumber=1; 
				
				if (num!=0) {	
					sql="update question_comment set re_step=re_step+1 ";
					sql += "where ref=? and re_step >? and rootin=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.setInt(3, rootin);
					pstmt.executeUpdate();
					re_step=re_step+1;
					re_level=re_level+1;
				 }else{
					ref=maxNumber;
					re_step=0;
					re_level=0;
				 }	
				
				
			
				sql = "insert into question_comment(rootin,writerid,reg_date,ref,re_step,re_level,content";
				sql+=") values(?,?,?,?,?,?,?)";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rootin);
				pstmt.setString(2, article.getWriterid());
				pstmt.setTimestamp(3, article.getReg_date());
				pstmt.setInt(4, ref);
				pstmt.setInt(5, re_step);
				pstmt.setInt(6, re_level);
				pstmt.setString(7, article.getContent());
				
				pstmt.executeUpdate();

				pointupdate(article.getWriterid(),1,"댓글 작성");
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
		}
	public List<commentDataBean> getquestionCommentsArticles(int start, int end,int num)
				throws Exception {
		 con = null;
		 pstmt = null;
		 rs = null;
		 List<commentDataBean> articleList=null;
		 try {
			 con = getConnection();
			 
			 pstmt = con.prepareStatement(
			 	"select * from question_comment where rootin=? order by ref desc, re_step asc limit ?,? ");
			 pstmt.setInt(1, num);
			 pstmt.setInt(2, start-1);
				 pstmt.setInt(3, end);
			 rs = pstmt.executeQuery();

			 if (rs.next()) {
				 articleList = new ArrayList<commentDataBean>(end);
				 do{
					 commentDataBean article= new commentDataBean();
					 article.setNum(rs.getInt("num"));
					 article.setRootin(rs.getInt("rootin"));
					 article.setWriterid(rs.getString("writerid"));
					 article.setReg_date(rs.getTimestamp("reg_date"));
					 article.setRef(rs.getInt("ref"));
					 article.setRe_step(rs.getInt("re_step"));
					 article.setRe_level(rs.getInt("re_level"));
					 article.setContent(rs.getString("content"));
					
						
						
					articleList.add(article);
					}while(rs.next());
				}
		 } catch(Exception ex) {
			 ex.printStackTrace();
		 } finally {
				DBclose();
		 }
			return articleList;
	 }
	public int getquestionCommentArticleCount(int num)
				throws Exception {
		 con = null;
		 pstmt = null;
		 rs = null;

		 int x=0;

		 try {
			 con = getConnection();
			 
			 pstmt = con.prepareStatement("select count(*) from question_comment where rootin=?");
			 pstmt.setInt(1, num);
			 rs = pstmt.executeQuery();

			 if (rs.next()) {
				x= rs.getInt(1);
 			}
		 } catch(Exception ex) {
			 ex.printStackTrace();
		 } finally {
		 	DBclose();
		 }
 		return x;
	 }
	
	public void insertannounceArticle(announceDataBean article) 
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int periode=Integer.parseInt(article.getPeriode());
		String sql="";

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select max(num) from announce");
			rs = pstmt.executeQuery();
			
			sql = "insert into announce(title,writerid,isEvent,reg_date,content,periode";
			sql+=") values(?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getWriterid());
			pstmt.setString(3, article.getIsEvent());
			pstmt.setTimestamp(4, article.getReg_date());
			pstmt.setString(5, article.getContent());
			pstmt.setString(6, article.getPeriode());
			
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public int getannounceArticleCount(String search)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int x=0;

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select count(*) from announce	where (title like '%"+search+"%' or writerid in(select id from user where nkname like '%"+search+"%'))");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x= rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	public List<announceDataBean> getannounceArticles(int start, int end,String search)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		List<announceDataBean> articleList=null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
				"select * from announce where (title like '%"+search+"%' or writerid in(select id from user where nkname like '%"+search+"%')) order by num desc limit ?,? ");
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<announceDataBean>(end);
				do{
				 announceDataBean article= new announceDataBean();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setIsEvent(rs.getString("isEvent"));
				article.setWriterid(rs.getString("writerid"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));


				 articleList.add(article);
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public int getannounceArticleCount()
			 throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int x=0;

		try {
			con = getConnection();
			
			pstmt = con.prepareStatement("select count(*) from announce");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x= rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	public List<announceDataBean> getannounceArticles(int start, int end)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		List<announceDataBean> articleList=null;
		try {
			con = getConnection();
			
			pstmt = con.prepareStatement(
				"select * from announce order by num desc limit ?,? ");
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<announceDataBean>(end);
				do{
				announceDataBean article= new announceDataBean();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setIsEvent(rs.getString("isEvent"));
				article.setWriterid(rs.getString("writerid"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
					
					
				 articleList.add(article);
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public announceDataBean getannounceArticle(int num)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		announceDataBean article=null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
				"update announce set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement(
				"select * from announce where num = ?");
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
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	public announceDataBean updateannounceGetArticle(int num)
				throws Exception {
			con = null;
			pstmt = null;
			rs = null;
			announceDataBean article=null;
			try {
				con = getConnection();

				pstmt = con.prepareStatement(
					"select * from announce where num = ?");
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
				}
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return article;
		}
	public int updateannounceArticle(announceDataBean article)
			throws Exception {
			con = null;
			pstmt = null;
			rs= null;

			String sql="";
			int x=-1;
			try {
				con = getConnection();

				 
					sql="update announce set title=?,isEvent=?,periode=?,content=? where num=?";
					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, article.getTitle());
					pstmt.setString(2, article.getIsEvent());
					pstmt.setString(3, article.getPeriode());
					pstmt.setString(4, article.getContent());
						pstmt.setInt(5, article.getNum());
					pstmt.executeUpdate();
					
						x= 1;
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return x;
		}
	public int deleteannounceArticle(int num)
			throws Exception {
			con = null;
			pstmt = null;
			rs= null;
			int x=-1;
			try {
				con = getConnection();

						pstmt = con.prepareStatement(
							"delete from announce where num=?");
						pstmt.setInt(1, num);
						pstmt.executeUpdate();
						x= 1; //湲��궘�젣 �꽦怨�
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
			return x;
		}
	public void insertannounceCommentsArticle(commentDataBean article,int rootin) 
				throws Exception {
			con = null;
			pstmt = null;
				rs = null;
			
			int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int maxNumber=0;

			String sql="";

			try {
				con = getConnection();

				pstmt = con.prepareStatement("select max(num) from announce_comment");
				rs = pstmt.executeQuery();
				
				if (rs.next())
					maxNumber=rs.getInt(1)+1;
				else
					maxNumber=1; 
				
				if (num!=0) {	
					sql="update announce_comment set re_step=re_step+1 ";
					sql += "where ref=? and re_step >? and rootin=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.setInt(3, rootin);
					pstmt.executeUpdate();
					re_step=re_step+1;
					re_level=re_level+1;
				 }else{
					ref=maxNumber;
					re_step=0;
					re_level=0;
				 }	
				
				
				// 荑쇰━瑜� �옉�꽦
				sql = "insert into announce_comment(rootin,writerid,reg_date,ref,re_step,re_level,content";
				sql+=") values(?,?,?,?,?,?,?)";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rootin);
				pstmt.setString(2, article.getWriterid());
				pstmt.setTimestamp(3, article.getReg_date());
				pstmt.setInt(4, ref);
				pstmt.setInt(5, re_step);
				pstmt.setInt(6, re_level);
				pstmt.setString(7, article.getContent());
				
				pstmt.executeUpdate();
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				DBclose();
			}
		}
	public List<commentDataBean> getannounceCommentsArticles(int start, int end,int num)
				throws Exception {
		 con = null;
		 pstmt = null;
		 rs = null;
		 List<commentDataBean> articleList=null;
		 try {
			 con = getConnection();
			 
			 pstmt = con.prepareStatement(
			 	"select * from announce_comment where rootin=? order by ref desc, re_step asc limit ?,? ");
			 pstmt.setInt(1, num);
			 pstmt.setInt(2, start-1);
				 pstmt.setInt(3, end);
			 rs = pstmt.executeQuery();

			 if (rs.next()) {
				 articleList = new ArrayList<commentDataBean>(end);
				 do{
					 commentDataBean article= new commentDataBean();
					 article.setNum(rs.getInt("num"));
					 article.setRootin(rs.getInt("rootin"));
					 article.setWriterid(rs.getString("writerid"));
					 article.setReg_date(rs.getTimestamp("reg_date"));
					 article.setRef(rs.getInt("ref"));
					 article.setRe_step(rs.getInt("re_step"));
					 article.setRe_level(rs.getInt("re_level"));
					 article.setContent(rs.getString("content"));
					
						
						
					articleList.add(article);
					}while(rs.next());
				}
		 } catch(Exception ex) {
			 ex.printStackTrace();
		 } finally {
				DBclose();
		 }
			return articleList;
	 }
	public int getannounceCommentArticleCount(int num)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;

		int x=0;

		try {
			con = getConnection();
			
			pstmt = con.prepareStatement("select count(*) from cookhelp_comment where rootin=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x= rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}

	public void insertproductArticle(productDataBean article)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		
		String sql="";

		try {
			con = getConnection();
			
			sql = "insert into product(productName,isTool,productType,price,discountRate,productThumb";
			sql+=") values(?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, article.getProductName());
			pstmt.setInt(2,article.getIsTool());
			pstmt.setInt(3,article.getProductType());
			pstmt.setInt(4,article.getPrice());
			pstmt.setInt(5,article.getDiscountRate());
			pstmt.setString(6, article.getProductThumb());
			
			pstmt.executeUpdate();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		
	}
	public int getproductArticleCount(int isTool,int type,String search)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql="";

		int x=0;

		try {
			con = getConnection();
			

			sql="select count(*) from product where 1=1";
			
			if(isTool!=0) {
				sql+=" and isTool="+isTool;
			}if(type!=0) {
				sql+=" and productType="+type;
			}if(search!=null) {
				sql+=" and productName like '%"+search+"%'";
			}
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt("count(*)");
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	public List<productDataBean> getproductArticles(int start, int end,int isTool,int type,String search)
			throws Exception {
		DBclose();
		con = null;
		pstmt = null;
		rs = null;
		String sql="";
		List<productDataBean> articleList=null;
		try {
			con = getConnection();
			

			sql="select * from product where 1=1";
			
			if(isTool!=0) {
				sql+=" and isTool="+isTool;
			}if(type!=0) {
				sql+=" and productType="+type;
			}if(search!=null) {
				sql+=" and productName like '%"+search+"%'";
			}

			sql+=" order by productName asc limit ?,?";

			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<productDataBean>(end);
				do{
					productDataBean article= new productDataBean();
					article.setProductId(rs.getInt("productId"));
					article.setProductName(rs.getString("productName"));
					article.setIsTool(rs.getInt("isTool"));
					article.setProductType(rs.getInt("productType"));
					article.setPrice(rs.getInt("price"));
					article.setDiscountRate(rs.getInt("discountRate"));
					article.setProductThumb(rs.getString("productThumb"));
					
				 articleList.add(article);
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public productDataBean getproductArticle(int productId)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		productDataBean article=null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
				"select * from product where productId = ?");
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
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	}
	
	public int updateproductArticle(productDataBean article)
			throws Exception {
		con = null;
		pstmt = null;
		rs= null;

		String sql="";
		int x=-1;
		try {
			con = getConnection();

			 
				sql="update product set productName=?,isTool=?,productType=?,price=?,discountRate=?,productThumb=? where productId=?";
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, article.getProductName());
				pstmt.setInt(2,article.getIsTool());
				pstmt.setInt(3,article.getProductType());
				pstmt.setInt(4,article.getPrice());
				pstmt.setInt(5,article.getDiscountRate());
				pstmt.setString(5, article.getProductThumb());
				pstmt.setInt(7,article.getProductId());
				pstmt.executeUpdate();
				
					x= 1;
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	public int deleteproductArticle(int productId)
			throws Exception {
		con = null;
		pstmt = null;
		rs= null;
		int x=-1;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
				"delete from product where productId=?");
			pstmt.setInt(1, productId);
			pstmt.executeUpdate();
			x= 1; //湲��궘�젣 �꽦怨�
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return x;
	}
	
	public void insertcartArticle(int productId,int productcount,String ownerid)
			throws Exception {
		con = null;
		pstmt = null;
		rs= null;
		try {
			con = getConnection();
			
			pstmt = con.prepareStatement(
					"select * from product where productId = ?");
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String sql = "insert into cart(owner,productCount,productId,";
				sql+="productName,isTool,productType,price,discountRate,productThumb";
				sql+=") values(?,?,?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1,ownerid);
				pstmt.setInt(2,productcount);
				pstmt.setInt(3,productId);
				pstmt.setString(4,rs.getString("productName"));
				pstmt.setInt(5,rs.getInt("isTool"));
				pstmt.setInt(6,rs.getInt("productType"));
				pstmt.setInt(7,rs.getInt("price"));
				pstmt.setInt(8,rs.getInt("discountRate"));
				pstmt.setString(9,rs.getString("productThumb"));
				
				pstmt.executeUpdate();
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public int getcartArticlecount(String ownerid) {
		con = null;
		pstmt = null;
		rs= null;
		String sql="";
		int count=0;
		try {
			con = getConnection();
			sql = "select count(*) from cart where owner=?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,ownerid);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return count;
	}
	public List<productDataBean> getcartArticles(String ownerid) {
		con = null;
		pstmt = null;
		rs= null;
		String sql="";
		List<productDataBean> articleList=null;
		try {
			con = getConnection();
			sql = "select * from cart where owner=?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,ownerid);
			
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				articleList = new ArrayList<productDataBean>();
				do{
					productDataBean article= new productDataBean();
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
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public List<productDataBean> getcartArticles(int[] cartid) {
		con = null;
		pstmt = null;
		rs= null;
		String sql="";
		List<productDataBean> articleList=null;
		try {
			con = getConnection();
			sql = "select * from cart where cartid in("+cartid[0];
			for(int i=1;i<cartid.length;i++) {
				sql+=","+cartid[i];
			}
			sql+=")";
			
			pstmt = con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				articleList = new ArrayList<productDataBean>();
				do{
					productDataBean article= new productDataBean();
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
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	public void deletecartArticle(int cartid) {
		con = null;
		pstmt = null;
		rs= null;
		String sql="";
		try {
			con = getConnection();
			sql = "delete from cart where cartid ="+cartid;
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public void deletecartArticle(String owner) {
		con = null;
		pstmt = null;
		rs= null;
		String sql="";
		try {
			con = getConnection();
			sql = "delete from cart where owner=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,owner);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public void SendCartToBuy(int[] cartid,buyDataBean requestArticle) {
		con = null;
		pstmt = null;
		rs= null;
		String sql="";
		String owner="";
		int pointused=requestArticle.getPointused();
		int totalprice=0;
		int pointadd=0;
		int maxnumber=0;
		String productnameforpointhist="";
		int rslength=0;
		
		try {
			con = getConnection();
			
			sql = "select max(buyId) from buy";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				maxnumber=rs.getInt(1)+1;
			}
			
			sql = "select productCount,price,discountRate from cart where cartid in("+cartid[0];
			for(int i=1;i<cartid.length;i++) {
				sql+=","+cartid[i];
			}
			sql+=")";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				do {
					int count=rs.getInt("productCount");
					int price=rs.getInt("price")*(100-rs.getInt("discountRate"))/100;
					totalprice+=count*price;
				}while(rs.next());
			}
			
			if(totalprice<pointused) {
				pointused=totalprice;
			}
			pointadd=totalprice/100;
			
			
			sql = "select * from cart where cartid in("+cartid[0];
			for(int i=1;i<cartid.length;i++) {
				sql+=","+cartid[i];
			}
			sql+=")";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				productnameforpointhist=rs.getString("productName");
				do{
					rslength++;
					sql = "insert into buy(ref,pointused,owner,productCount,productId,productName";
					sql+=",isTool,productType,price,discountRate,productThumb";
					sql+=",accountid,deliveryName,deliveryTel,deliveryMessage,deliveryAddrnum";
					sql+=",deliveryAddress,deliveryDetailAdd,buydate";
					sql+=") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1,maxnumber);
					pstmt.setInt(2,pointused);
						
					pstmt.setString(3,rs.getString("owner"));
						owner=rs.getString("owner");
					pstmt.setInt(4,rs.getInt("productCount"));
					pstmt.setInt(5,rs.getInt("productId"));
					pstmt.setString(6,rs.getString("productName"));
					pstmt.setInt(7,rs.getInt("isTool"));
					pstmt.setInt(8,rs.getInt("productType"));
					pstmt.setInt(9,rs.getInt("price"));
					pstmt.setInt(10,rs.getInt("discountRate"));
					pstmt.setString(11,rs.getString("productThumb"));
					pstmt.setInt(12,requestArticle.getAccountId());
					pstmt.setString(13,requestArticle.getDeliveryName());
					pstmt.setString(14,requestArticle.getDeliveryTel());
					pstmt.setString(15,requestArticle.getDeliveryMessage());
					pstmt.setString(16,requestArticle.getDeliveryAddrnum());
					pstmt.setString(17,requestArticle.getDeliveryAddress());
					pstmt.setString(18,requestArticle.getDeliveryDetailAdd());
					pstmt.setTimestamp(19,ts);
					
					pstmt.executeUpdate();
					
				}while(rs.next());
			}
			deletecartArticle(owner);
			if(rslength==1) {
				pointupdate(owner,pointadd,productnameforpointhist+" 구매");
			}else {
				pointupdate(owner,pointadd,productnameforpointhist+" 외"+(rslength-1)+" 개 상품 구매");
			}
			pointupdate(owner,-1*pointused,"물품 구매에 사용");
			
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
	}
	public int[] getDistinctBuyRefs(String userId) {
		con = null;
		pstmt = null;
		rs= null;
		String sql="";
		int refcount=0;
		int refarray[]=null;
		try {
			con = getConnection();
			
			sql = "select count(distinct ref) from buy where owner='"+userId+"'";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				refcount=rs.getInt(1);
				refarray=new int[refcount];
			}
			
			sql = "select distinct ref from buy where owner='"+userId+"'";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				int i=0;
				do {
					refarray[i]=rs.getInt(1);
					i++;
				}while(rs.next());
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return refarray;
	}
	public List<buyDataBean> getbuyArticles(int refnumber){
		con = null;
		pstmt = null;
		rs= null;
		String sql="";
		List<buyDataBean> articleList=null;
		
		try {
			con = getConnection();
			sql = "select * from buy where ref="+refnumber;
			pstmt = con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<buyDataBean>();
				do{
				buyDataBean article= new buyDataBean();
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
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articleList;
	}
	
	public int getbuyArticleCount(int refnumber){
		con = null;
		pstmt = null;
		rs= null;
		String sql="";
		int articlecount=0;
		
		try {
			con = getConnection();
			sql = "select count(*) from buy where ref="+refnumber;
			pstmt = con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			articlecount=rs.getInt(1);
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return articlecount;
	}
		
}