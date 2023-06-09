package com.prj.flower.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.prj.flower.member.dao.MemberDAO;
import com.prj.flower.member.vo.MemberVO;


@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(Map  loginMap) throws Exception{
		return memberDAO.login(loginMap);
	}
	
	@Override
	public void addMember(MemberVO memberVO) throws Exception{
		memberDAO.insertNewMember(memberVO);
	}
	
	@Override
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}

	@Override
	public String findMemberid(Map<String, Object> map) {
		
		return memberDAO.selectMemberid(map);
	}

	@Override
	public boolean updatePassword(Map<String, Object> map) {
		memberDAO.updatePassword(map);
		boolean result = true;
		return result;
	}
}
