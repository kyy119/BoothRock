package com.multi.FM.mypage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.multi.FM.booth.BoothReviewVO;
import com.multi.FM.users.UsersVO;

@Repository
public class MypageDAO {
    
    @Autowired
    SqlSessionTemplate my;
    
    public List<UsersVO> user_info(String user_id){
      return my.selectList("myPage.user_info", user_id);
    }
    
    public List<BoothReviewVO> review_list(String user_id) { //리뷰 조회
        return my.selectList("myPage.review_list", user_id);
    }
    
    public int user_edit(UsersVO users) {
      return my.update("myPage.mypage_edit", users);
    }
    
    public String user_seller_info(String user_id) {
      return my.selectOne("myPage.user_seller_info", user_id);
    }
//    
//    public List<FestivalVO> jjim_list(String user_id){
//        return my.selectList("myPage.jjim_list", user_id);
//    }
//    
//    public int review_delete(int review_no) {
//        return my.delete("myPage.review_delete",review_no);
//    }
}
