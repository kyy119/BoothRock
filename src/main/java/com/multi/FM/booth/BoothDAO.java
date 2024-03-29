package com.multi.FM.booth;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.multi.FM.myboothpage.BoothVO;

@Repository
public class BoothDAO {
  @Autowired
  SqlSessionTemplate my;

  public BoothVO detail(BoothVO boothVO) {
    return my.selectOne("booth.detail", boothVO);
  }
  
  public List<BoothProductVO> product(int booth_no) {
    Map<String, Object> params = new HashMap<>();
    params.put("booth_no", booth_no);
    return my.selectList("booth.product", params);
}

}
