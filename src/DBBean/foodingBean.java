package DBBean;

import java.sql.*;
import java.util.*;

public class foodingBean {

	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	String str=null;
	
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
			System.out.println("Connection Error");
		}
	}
	
	public ResultSet resultQuery(String sql) {
		try {
			con = getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
		}catch(Exception e) {
			System.out.println("Result Error");
			rs=null;
		}
		return rs;
	}
	
	public void nonResultQuery(String sql) {
		try {
			con = getConnection();
			stmt=con.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
		}catch(Exception e) {
			System.out.println("notResultQuery Error 2");
		}finally {
			DBclose();
        }
	}
	
	public String findnkname(String id) {
		try {
			con = getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery("select nkname from user where id='"+id+"';");
			if(rs.next()) {
				str=rs.getString("nkname");
			}
		}catch(Exception e) {
			System.out.println("Result Error");
			rs=null;
			str="";
		}finally {
			DBclose();
        }
		return str;
	}
	public void DBclose() {
		stmtClosing();
		resultclosing();
		DBClosing();
	}
	public void stmtClosing() {
		try {
			rs.close();
		}catch(Exception e) {}
	}
	
	public void resultclosing() {
		try {
			rs.close();
		}catch(Exception e) {}
	}
	
	public void DBClosing() {
		try {
			con.close();
		}catch(Exception e) {}
	}
    
	private static foodingBean instance = new foodingBean();
    //.jsp페이지에서 DB연동빈인 recipesDBBean클래스의 메소드에 접근시 필요
    public static foodingBean getInstance() {
        return instance;
    }
	
    //커넥션풀로부터 Connection객체를 얻어냄
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
 
    //recipes테이블에 글을 추가(inset문)<=writePro.jsp페이지에서 사용
    public void insertArticle(BoardDataBean article) 
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num=article.getNum();
		int number=0;
        String sql="";

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select max(num) from recipes");
			rs = pstmt.executeQuery();
			
			if (rs.next())
		      number=rs.getInt(1)+1;
		    else
		      number=1; 
		   
		    
            // 쿼리를 작성
            sql = "insert into recipes(title,contury,foodtype,ingredients,tools,writerid,reg_date,content";
		    sql+=") values(?,?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, article.getTitle());
            pstmt.setString(2, article.getContury());
            pstmt.setString(3, article.getFoodtype());
            pstmt.setString(4, article.getIngredients());
            pstmt.setString(5, article.getTools());
            pstmt.setString(6, article.getWriterid());
			pstmt.setTimestamp(7, article.getReg_date());
            pstmt.setString(8, article.getContent());
			
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	DBclose();
        }
    }
    
    
    
    public int getArticleCount(String search)
            throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;

       int x=0;

       try {
           conn = getConnection();

           pstmt = conn.prepareStatement("select count(*) from recipes  where (contury like '%"+search+"%' or foodtype like '%"+search+"%' or title like '%"+search+"%')");
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
    
    public List<BoardDataBean> getArticles(int start, int end,String search)
            throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<BoardDataBean> articleList=null;
       try {
           conn = getConnection();

           pstmt = conn.prepareStatement(
               "select * from recipes where (contury like '%"+search+"%' or foodtype like '%"+search+"%' or title like '%"+search+"%') order by num desc limit ?,? ");
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
    
    
    //recipes테이블에 저장된 전체글의 수를 얻어냄(select문)<=list.jsp에서 사용
	public int getArticleCount()
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select count(*) from recipes");
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

	//글의 목록(복수개의 글)을 가져옴(select문) <=list.jsp에서 사용
	public List<BoardDataBean> getArticles(int start, int end)
            throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<BoardDataBean> articleList=null;
       try {
           conn = getConnection();
           
           pstmt = conn.prepareStatement(
           	"select * from recipes order by num desc limit ?,? ");
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
 
	//글의 내용을 보기(1개의 글)(select문)<=content.jsp페이지에서 사용
	public BoardDataBean getArticle(int num)
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean article=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
            	"update recipes set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

            pstmt = conn.prepareStatement(
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
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	DBclose();
        }
		return article;
    }
    
	//글 수정폼에서 사용할 글의 내용(1개의 글)(select문)<=updateForm.jsp에서 사용
	public BoardDataBean updateGetArticle(int num)
	          throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        BoardDataBean article=null;
	        try {
	            conn = getConnection();

	            pstmt = conn.prepareStatement(
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
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	        	DBclose();
	        }
			return article;
	    }

    //글 수정처리에서 사용(update문)<=updatePro.jsp에서 사용
    public int updateArticle(BoardDataBean article)
            throws Exception {
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs= null;

          String sql="";
  		int x=-1;
          try {
              conn = getConnection();

  			 
                  sql="update recipes set title=?,contury=?,foodtype=?,ingredients=?";
  			    sql+=",tools=? ,content=? where num=?";
                  pstmt = conn.prepareStatement(sql);

                  pstmt.setString(1, article.getTitle());
                  pstmt.setString(2, article.getContury());
                  pstmt.setString(3, article.getFoodtype());
                  pstmt.setString(4, article.getIngredients());
                  pstmt.setString(5, article.getTools());
                  pstmt.setString(6, article.getContent());
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
      
      //글삭제처리시 사용(delete문)<=deletePro.jsp페이지에서 사용
      public int deleteArticle(int num)
          throws Exception {
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs= null;
          int x=-1;
          try {
  			conn = getConnection();

  					pstmt = conn.prepareStatement(
              	      "delete from recipes where num=?");
                      pstmt.setInt(1, num);
                      pstmt.executeUpdate();
  					x= 1; //글삭제 성공
          } catch(Exception ex) {
              ex.printStackTrace();
          } finally {
        	  DBclose();
          }
  		return x;
      }
      
      public void insertCommentsArticle(commentDataBean article,int rootin) 
              throws Exception {
          Connection conn = null;
          PreparedStatement pstmt = null;
  		ResultSet rs = null;
  		
  		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number=0;

          String sql="";

          try {
              conn = getConnection();

              pstmt = conn.prepareStatement("select max(num) from recipe_comment");
  			rs = pstmt.executeQuery();
  			
  			if (rs.next())
  		      number=rs.getInt(1)+1;
  		    else
  		      number=1; 
  			
  			if (num!=0) {  
  		      sql="update recipe_comment set re_step=re_step+1 ";
  		      sql += "where ref= ? and re_step = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, ref);
  			  pstmt.setInt(2, re_step);
  			  pstmt.executeUpdate();
  			  re_step=re_step+1;
  			  re_level=re_level+1;
  		     }else{
  		  	  ref=number;
  			  re_step=0;
  			  re_level=0;
  		     }	
  		   
  		    
              // 쿼리를 작성
              sql = "insert into recipe_comment(rootin,writerid,reg_date,ref,re_step,re_level,content";
  		    sql+=") values(?,?,?,?,?,?,?)";

              pstmt = conn.prepareStatement(sql);
              pstmt.setInt(1, rootin);
              pstmt.setString(2, article.getWriterid());
              pstmt.setTimestamp(3, article.getReg_date());
              pstmt.setInt(4, article.getRef());
              pstmt.setInt(5, article.getRe_step());
  			  pstmt.setInt(6, article.getRe_level());
              pstmt.setString(7, article.getContent());
  			
              pstmt.executeUpdate();
          } catch(Exception ex) {
              ex.printStackTrace();
          } finally {
          	DBclose();
          }
      }
      
      public List<commentDataBean> getCommentsArticles(int start, int end,int num)
              throws Exception {
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         List<commentDataBean> articleList=null;
         try {
             conn = getConnection();
             
             pstmt = conn.prepareStatement(
             	"select * from recipe_comment where rootin=? order by ref desc, re_step asc,num desc limit ?,? ");
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
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;

         int x=0;

         try {
             conn = getConnection();
             
             pstmt = conn.prepareStatement("select count(*) from recipe_comment where rootin=?");
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

	

}