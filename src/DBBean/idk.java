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