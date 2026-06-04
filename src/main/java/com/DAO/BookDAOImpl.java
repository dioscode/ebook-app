package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO {

	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	private BookDtls map(ResultSet rs) throws Exception {
		BookDtls b = new BookDtls();
		b.setBookid(rs.getInt(1));
		b.setBookName(rs.getString(2));
		b.setAuthor(rs.getString(3));
		b.setPrice(rs.getString(4));
		b.setBookCategory(rs.getString(5));
		b.setStatus(rs.getString(6));
		b.setPhotoName(rs.getString(7));
		b.setEmail(rs.getString(8));
		b.setGenre(rs.getString(9));
		return b;
	}

	public boolean addBooks(BookDtls b) {
		boolean f = false;
		try {
			String sql = "insert into book_dtls(bookname,author,price,bookCategory,status,photo,email,genre) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());
			ps.setString(8, b.getGenre() != null ? b.getGenre() : "General");
			int i = ps.executeUpdate();
			if (i == 1) f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getAllBooks() {
		List<BookDtls> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from book_dtls");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) list.add(map(rs));
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	@Override
	public BookDtls getBookById(int id) {
		BookDtls b = null;
		try {
			PreparedStatement ps = conn.prepareStatement("select * from book_dtls where bookid=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) b = map(rs);
		} catch (Exception e) { e.printStackTrace(); }
		return b;
	}

	@Override
	public boolean updateEditBooks(BookDtls b) {
		boolean f = false;
		try {
			String sql = "update book_dtls set bookname=?,author=?,price=?,status=?,genre=? where bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setString(5, b.getGenre() != null ? b.getGenre() : "General");
			ps.setInt(6, b.getBookid());
			if (ps.executeUpdate() == 1) f = true;
		} catch (Exception e) { e.printStackTrace(); }
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement("delete from book_dtls where bookid=?");
			ps.setInt(1, id);
			if (ps.executeUpdate() == 1) f = true;
		} catch (Exception e) { e.printStackTrace(); }
		return f;
	}

	public List<BookDtls> getNewBook() {
		List<BookDtls> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(
				"select * from book_dtls where bookCategory=? and status=? order by bookid DESC limit 4");
			ps.setString(1, "New"); ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) list.add(map(rs));
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	@Override
	public List<BookDtls> getRecentBook() {
		List<BookDtls> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(
				"select * from book_dtls where status=? order by bookid DESC limit 4");
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) list.add(map(rs));
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	@Override
	public List<BookDtls> getOldBook() {
		List<BookDtls> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(
				"select * from book_dtls where bookCategory=? and status=? order by bookid DESC limit 4");
			ps.setString(1, "Old"); ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) list.add(map(rs));
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	@Override
	public List<BookDtls> getAllRecentBook() {
		List<BookDtls> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(
				"select * from book_dtls where status=? order by bookid DESC");
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) list.add(map(rs));
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBook() {
		List<BookDtls> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(
				"select * from book_dtls where bookCategory=? and status=? order by bookid DESC");
			ps.setString(1, "New"); ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) list.add(map(rs));
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	@Override
	public List<BookDtls> getAllOldBook() {
		List<BookDtls> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(
				"select * from book_dtls where bookCategory=? and status=? order by bookid DESC");
			ps.setString(1, "Old"); ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) list.add(map(rs));
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	@Override
	public List<BookDtls> getBookByOld(String email, String cate) {
		List<BookDtls> list = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(
				"select * from book_dtls where bookCategory=? and email=?");
			ps.setString(1, cate); ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) list.add(map(rs));
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String cat, int id) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement(
				"delete from book_dtls where bookCategory=? and email=? and bookid=?");
			ps.setString(1, cat); ps.setString(2, email); ps.setInt(3, id);
			if (ps.executeUpdate() == 1) f = true;
		} catch (Exception e) { e.printStackTrace(); }
		return f;
	}

	@Override
	public List<BookDtls> getBookBySearch(String ch) {
		List<BookDtls> list = new ArrayList<>();
		try {
			String sql = "select * from book_dtls where status='Active' and " +
				"(bookname like ? or author like ? or bookCategory like ? or genre like ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			String w = "%" + ch + "%";
			ps.setString(1, w); ps.setString(2, w);
			ps.setString(3, w); ps.setString(4, w);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) list.add(map(rs));
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

}
