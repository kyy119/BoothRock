package com.multi.FM.mypage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.multi.FM.booth.BoothReviewVO;

@Repository
public class MypageDAO {
    
    @Autowired
    SqlSessionTemplate my;
    
    public List<BoothReviewVO> review_list(String user_id) {
        return my.selectList("myPage.review_list", user_id);
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
