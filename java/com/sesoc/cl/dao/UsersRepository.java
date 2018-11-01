package com.sesoc.cl.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.Users;


@Repository
public class UsersRepository {
	
	@Autowired
	SqlSession sqlSession;
	
	
	public Users login(String id, String password) {
		UsersDAO dao = sqlSession.getMapper(UsersDAO.class);
		
		Users AccessUser = new Users();
		AccessUser.setId(id);
		AccessUser.setPassword(password);
		
		Users resultUser = dao.login(AccessUser);
		
		return resultUser;
	}
	
	public String idcheck(String id) {
		UsersDAO dao = sqlSession.getMapper(UsersDAO.class);
		String checked_id = dao.idcheck(id);
		return checked_id;
	}
	
	public String emailcheck(String email) {
		UsersDAO dao = sqlSession.getMapper(UsersDAO.class);
		String checked_id = dao.emailcheck(email);
		return checked_id;
	}
	
	public int register(Users makedUser) {
		UsersDAO dao = sqlSession.getMapper(UsersDAO.class);
		
		int result = dao.register(makedUser);
		
		return result;
	}
	
	public Users selectOne(Users searchUser) {
		UsersDAO dao = sqlSession.getMapper(UsersDAO.class);
		
		Users searchedUser = dao.selectOne(searchUser);
		
		return searchedUser;
	}
	

	public int update(Users user) {
		UsersDAO dao = sqlSession.getMapper(UsersDAO.class);
		
		int result = dao.update(user);
		
		return result;
	}
	
	public int unregister(Users quitUser) {
		UsersDAO dao = sqlSession.getMapper(UsersDAO.class);
		
		int result = dao.unregister(quitUser);
		
		return result;
		
	}
	
	public int delete_class_user(Users quitUser) {
		UsersDAO dao = sqlSession.getMapper(UsersDAO.class);
		
		int result = dao.delete_class_user(quitUser);
		
		return result;
	}
	public Users unregisterCheck(Map<String, String> user) {
		UsersDAO dao = sqlSession.getMapper(UsersDAO.class);
		
		Users result = dao.unregisterCheck(user);
		
		return result;
	}
	public List<Users> allList(){
		UsersDAO dao = sqlSession.getMapper(UsersDAO.class);
		List<Users> result = dao.allList();
		return result;
	}
}
