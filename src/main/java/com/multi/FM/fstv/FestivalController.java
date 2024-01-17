package com.multi.FM.fstv;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.jws.WebParam.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FestivalController {

  @Autowired
  FestivalDAO dao;

  @Autowired
  FestivalService service;

  @RequestMapping("festivalinsert")
  public void insert(FestivalVO festivalVO, Model model) {
    System.out.println("controller start");
    ArrayList<FestivalVO> list = service.insert();
    model.addAttribute("vo", list);
  }

  // 메인페이지 bannerlist를 불러오는 메서드
  @RequestMapping("bannerlist")
  public void banner(Model model) {
    List<FestivalVO> bannerlist = service.banner();
    model.addAttribute("bannerlist", bannerlist);
  }

  // 메인페이지 endlist를 불러오는 메서드
  @RequestMapping("endlist")
  public void soon(Model model) {
    List<FestivalVO> endlist = service.end();
    model.addAttribute("endlist", endlist);
  }

  // 메인페이지 endlist의 개수를 가져와서 js로 prev-btn과 next-btn을 조정하기 위한 메서드
  @GetMapping("listcnt")
  @ResponseBody
  public ResponseEntity<Map<String, Integer>> cnt() {
    Map<String, Integer> data = new HashMap<>();
    int count = service.cnt();
    data.put("count", count);
    return ResponseEntity.ok().body(data);
  }

  // 리스트 페이지 전체 축제리스트 불러오는 메서드 / 페이징 처리 포함
  @RequestMapping("fstv_list")
  public void list(FestivalPageVO fstvpageVO, Model model) {
    fstvpageVO.calidx(); // js에서 page데이터를 받아오고 index를 설정
    List<FestivalVO> list = service.list(); // list를 불러옴
    model.addAttribute("list", list); // views에 가져온 list전달
    model.addAttribute("idx", fstvpageVO.getIndex());
  }

  @RequestMapping("fstv_jjim")
  public void list_jjim(FestivalPageVO fstvpageVO, Model model) {
    fstvpageVO.calidx();
    List<FestivalVO> list = service.jjim(fstvpageVO);
    model.addAttribute("list", list);
  }

  @RequestMapping("fstv_detail")
  public void detail(FestivalVO festivalVO, Model model) {
    FestivalVO vo = service.one(festivalVO);
    model.addAttribute("vo", vo);
  }

  @RequestMapping("fstv_date_search")
  public void date(Model model, FestivalPageVO vo) {
    List<FestivalVO> list = service.date(vo);
    model.addAttribute("list", list);
  }
  
  @RequestMapping("fstv_detail_boothin")
  public void booth_in(Model model, FestivalVO vo) {
    List<FestivalBoothVO> list = service.booth_in(vo);
    model.addAttribute("list", list);
  }
  
  @RequestMapping("fstv_detail_boothstar")
  public String booth_star(Model model, FestivalVO vo) {
    List<FestivalBoothVO> list = service.booth_star(vo);
    model.addAttribute("list", list);
    return "fstv_detail_boothin";
  }
  
  @RequestMapping("fstv_search")
  public void search(String q, Model model) {
    List<FestivalVO> list = service.search(q);
    model.addAttribute("list", list);
    model.addAttribute("q", q);
  }
  
  @RequestMapping("fstv_maplist")
  public void map(String region, Model model) {
    List<FestivalVO> list = service.map(region);
    model.addAttribute("list", list);
    model.addAttribute("region", region);
  }
  
  @RequestMapping("fstv_maplistJ")
  public String mapJ(String region, Model model) {
    List<FestivalVO> list = service.mapJ(region);
    model.addAttribute("list", list);
    model.addAttribute("region", region);
    return "fstv_maplist";
  }
  
  @RequestMapping("fstv_detail_jjim")
  public void jjimchu(JjimVO jvo, Model model) {
    int res = service.jjimChu(jvo);
    if(res==0) {
      model.addAttribute("res", "찜 목록에서 삭제되었습니다");
    }else {
      model.addAttribute("res", "찜 목록에 추가되었습니다");
    }
  }
  
  @GetMapping("jjim_search")
  @ResponseBody
  public ResponseEntity<Map<String, Integer>> jjimSearch(JjimVO jvo) {
    Map<String, Integer> data = new HashMap<>();
    int count = service.jjimSearch(jvo);
    data.put("count", count);
    return ResponseEntity.ok().body(data);
  }
  
  @RequestMapping("fstv_boothup")
  public void boothup(Model model) {
    List<FestivalBoothVO> list = service.boothup();
    model.addAttribute("list",list);
  }
  
}
