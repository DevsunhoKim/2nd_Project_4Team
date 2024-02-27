package com.sist.service;


import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sist.MailSender.MailSender;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
@Service
public class MemberServiceIml implements MemberService{
    private MemberDAO dao;
    private BCryptPasswordEncoder encoder;

    @Autowired
    MemberServiceIml(MemberDAO dao,BCryptPasswordEncoder encoder) {
        this.dao = dao;
        this.encoder = encoder;
    }

    @Override
    public MemberVO getMemberByID(String id){
        return dao.getMemberByID(id);
    }

    @Override
    public int getIDCount(String id) {
        return dao.getIDCount(id);
    }

    @Override
    public int getNicknameCount(String nickname) {
        return dao.getNicknameCount(nickname);
    }

	@Override
	public int joinMember(MemberVO vo) {
		String enPwd=encoder.encode(vo.getUserPwd());// 비밀번호 암호화
    	vo.setUserPwd(enPwd);
		return dao.joinMember(vo);
	}

	@Override
	public void memberAuthorityInsert(String userId) {
		dao.memberAuthorityInsert(userId);

	}

	@Override
	public MemberVO login(String userId, String userPwd) {
		return dao.login(userId, userPwd);
	}

	@Override
	public void lastLoginUpdate(String name) {
		dao.lastLoginUpdate(name);
	}

	@Override
	public String sendCode(String email) {
		int code = (int)(Math.random() * 900000) + 100000; // 인증번호 6자리수 100000~999999
		String res = dao.sendCode(email,code);
		if(res.equals("SEND_CODE")) {
			  try {
				  MailSender ms = new MailSender();
				ms.FindIdMailSend(email, code);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		return res;
	}

	@Override
	public String idFind(String email, int code) {
		String res = dao.idFind(email, code);
		return res;
	}

	@Override
	public String pwdFind(String userId, String email) {
		int random_ = (int)(Math.random() * 900000) + 100000; // 임시비밀번호 6자리수 100000~999999
		  String tempPwd=random_+"";
		  String enTempPwd=encoder.encode(tempPwd);
		  String res = dao.pwdFind(userId,email,enTempPwd);
		  // id, email 맞으면 임시비밀번호 변경 후 메일전송
		  if(res.equals("CHANGE_PWD")) {
			  try {
				  MailSender ms = new MailSender();
				ms.FindPwdMailSend(email, tempPwd);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		  }
		  return res;
	}
}
