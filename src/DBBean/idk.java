package DBBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

    public void insertcookhelpArticle(BoardDataBean article) 
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num=article.getNum();
		int number=0;
        String sql="";

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select max(num) from cookhelp");
			rs = pstmt.executeQuery();
			
			if (rs.next())
		      number=rs.getInt(1)+1;
		    else
		      number=1; 
		   
		    
            // 쿼리를 작성
            sql = "insert into cookhelp(title,contury,foodtype,ingredients,tools,writerid,reg_date,content";
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
    public int getcookhelpArticleCount(String search)
            throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;

       int x=0;

       try {
           conn = getConnection();

           pstmt = conn.prepareStatement("select count(*) from cookhelp  where (contury like '%"+search+"%' or foodtype like '%"+search+"%' or title like '%"+search+"%' or writerid in(select id from user where nkname like '%"+search+"%'))");
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
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<BoardDataBean> articleList=null;
       try {
           conn = getConnection();

           pstmt = conn.prepareStatement(
               "select * from cookhelp where (contury like '%"+search+"%' or foodtype like '%"+search+"%' or title like '%"+search+"%' or writerid in(select id from user where nkname like '%"+search+"%')) order by num desc limit ?,? ");
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
    public int getcookhelpArticleCount()
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select count(*) from cookhelp");
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
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<BoardDataBean> articleList=null;
       try {
           conn = getConnection();
           
           pstmt = conn.prepareStatement(
           	"select * from cookhelp order by num desc limit ?,? ");
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
	public BoardDataBean getcookhelpArticle(int num)
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean article=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
            	"update cookhelp set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

            pstmt = conn.prepareStatement(
            	"select * from cookhelp where num = ?");
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
	public BoardDataBean updatecookhelpGetArticle(int num)
	          throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        BoardDataBean article=null;
	        try {
	            conn = getConnection();

	            pstmt = conn.prepareStatement(
	            	"select * from cookhelp where num = ?");
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
    public int updatecookhelpArticle(BoardDataBean article)
            throws Exception {
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs= null;

          String sql="";
  		int x=-1;
          try {
              conn = getConnection();

  			 
                  sql="update cookhelp set title=?,contury=?,foodtype=?,ingredients=?";
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
    public int deletecookhelpArticle(int num)
          throws Exception {
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs= null;
          int x=-1;
          try {
  			conn = getConnection();

  					pstmt = conn.prepareStatement(
              	      "delete from cookhelp where num=?");
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
    public void insertcookhelpCommentsArticle(commentDataBean article,int rootin) 
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

              pstmt = conn.prepareStatement("select max(num) from cookhelp_comment");
  			rs = pstmt.executeQuery();
  			
  			if (rs.next())
  		      number=rs.getInt(1)+1;
  		    else
  		      number=1; 
  			
  			if (num!=0) {  
  		      sql="update cookhelp_comment set re_step=re_step+1 ";
  		      sql += "where ref=? and re_step >? and rootin=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, ref);
                pstmt.setInt(2, re_step);
                pstmt.setInt(3, rootin);
  			  pstmt.executeUpdate();
  			  re_step=re_step+1;
  			  re_level=re_level+1;
  		     }else{
  		  	  ref=number;
  			  re_step=0;
  			  re_level=0;
  		     }	
  		   
  		    
              // 쿼리를 작성
              sql = "insert into cookhelp_comment(rootin,writerid,reg_date,ref,re_step,re_level,content";
  		    sql+=") values(?,?,?,?,?,?,?)";

              pstmt = conn.prepareStatement(sql);
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
    public List<commentDataBean> getcookhelpCommentsArticles(int start, int end,int num)
              throws Exception {
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         List<commentDataBean> articleList=null;
         try {
             conn = getConnection();
             
             pstmt = conn.prepareStatement(
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
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;

         int x=0;

         try {
             conn = getConnection();
             
             pstmt = conn.prepareStatement("select count(*) from cookhelp_comment where rootin=?");
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
