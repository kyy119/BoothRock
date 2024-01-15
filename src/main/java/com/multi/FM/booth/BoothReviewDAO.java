package com.multi.FM.booth;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.multi.FM.myboothpage.BoothVO;

@Repository
public class BoothReviewDAO {
  @Autowired
  SqlSessionTemplate my;

   public List<BoothReviewVO> list(int booth_no) {
    Map<String, Object> params = new HashMap<>();
    params.put("booth_no", booth_no);
    return my.selectList("booth.reviewlist", params);
}

  public BoothVO Rbooth(int booth_no) {
    return my.selectOne("booth.Rbooth", booth_no);
  }

}
