package com.sesoc.cl.dao;

import java.util.List;
import java.util.Map;

import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.Users;


public interface UsersDAO {
	public Users login(Users AccessUser);
	public String idcheck(String id);
	public String emailcheck(String email);
	public Users unregisterCheck(Map<String, String> user);
	public int register(Users makedUser);
	public Users selectOne(Users searchUser);
	public int update(Users user);
	public int unregister(Users quitUser);         //삭제처리1-1 (is_deleted = 'Y')
	public int delete_class_user(Users quitUser);  //삭제처리1-2 (class_user 테이블삭제)
	public List<Users> allList();
}
