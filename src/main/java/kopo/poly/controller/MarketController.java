package kopo.poly.controller;

import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IMarketService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Slf4j
@RequestMapping(value = {"/market", "/admin"})
@Controller
public class MarketController {

    @Resource(name = "MarketService")
    private IMarketService marketService;

    @GetMapping(value = "market-list")
    public String marketlist(ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".market-list Start!!");

        // 마켓리스트 가져오기
        List<MarketDTO> mList = marketService.getMarketList();
        UserInfoDTO uDTO = new UserInfoDTO();


        if (mList == null) {
            mList = new ArrayList<>();
        }


        // 조회된 리스트 결과값 넣어주기
        model.addAttribute("mList", mList);

        model.addAttribute("uDTO",uDTO);

        log.info(this.getClass().getName() + ".market-list End!!");

        return "/market/market-list";
    }

    @GetMapping(value = "market-upload")
    public String marketupload() {
        log.info(this.getClass().getName() + ".market-upload Start!!");
        log.info(this.getClass().getName() + ".market-upload End!!");
        return "/market/market-upload";
    }

    // 마켓 글 등록
    @RequestMapping(value = "marketInsert", method = {RequestMethod.GET,RequestMethod.POST})
    public String marketInsert(HttpSession session, HttpServletRequest request, ModelMap model)  throws Exception {
        log.info(this.getClass().getName() + ".MarketInsert Start!");

        String msg = "";

        try {
            String user_name = CmmUtil.nvl((String) session.getAttribute("SESSION_USER_NAME"));
            String title = CmmUtil.nvl(request.getParameter("title"));
            int price = Integer.parseInt(CmmUtil.nvl(request.getParameter("price")));
            String contents = CmmUtil.nvl(request.getParameter("contents"));


            log.info("user_name : " + user_name);
            log.info("title : " + title);
            log.info("price : " + price);
            log.info("contents : " + contents);

            String test1 = contents.split("<img alt=\"\" src=\"")[1];

            String imgThum = test1.split("\"")[0];

            log.info("imgThum : "+imgThum);

            MarketDTO mDTO = new MarketDTO();

            if(imgThum != null) {
                mDTO.setThumbnail(imgThum);
            } else {
                mDTO.setThumbnail(" ");
            }

            //UserInfoDTO uDTO = new UserInfoDTO();

            // user 이름 가져오기

            mDTO.setUser_seq(mDTO.getUser_seq());
            //mDTO.setUser_name("혜경");
            //uDTO.setUser_name(user_name);
            mDTO.setTitle(title);
            mDTO.setPrice(price);
            mDTO.setContents(contents);


            marketService.InsertMarketInfo(mDTO);

            msg = "등록되었습니다.";

        } catch (Exception e) {

            // 저장이 실패되면 사용자에게 보여줄 메시지
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".MarketInsert end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        return "/market/market-MsgToList";
    }

    // 마켓 상세보기
    @GetMapping(value = "market-detail")
    public String getMarketInfo(HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".market-detail Start!!");

        String msg = "";

        try {
            int mk_seq = Integer.parseInt(CmmUtil.nvl(request.getParameter("mk_seq")));

            log.info("mk_seq : " + mk_seq);

            MarketDTO mDTO = new MarketDTO();
            mDTO.setMk_seq(mk_seq);
            mDTO.setUser_seq(mDTO.getUser_seq());

            // 마켓 상세정보 가져오기
            MarketDTO rDTO = marketService.getMarketInfo(mDTO);

            if (rDTO == null) {
                rDTO = new MarketDTO();

            }

            log.info("getMarketInfo success!!");

            // 조회된 리스트 결과값 넣어주기
            model.addAttribute("rDTO", rDTO);
        } catch (Exception e) {

            // 저장이 실패되면 사용자에게 보여줄 메시지
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".getMarketInfo end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        log.info(this.getClass().getName() + ".market-detail end!");

        return "/market/market-detail";

    }


    // 수정페이지 보기
    @GetMapping(value = "market-modify")
    public String marketmodify(HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".market modify start!");

        String msg = "";

        try {

            /*String mk_seq = CmmUtil.nvl(request.getParameter("mk_seq")); // 마켓 등록 번호(PK)*/
            int mk_seq = Integer.parseInt(CmmUtil.nvl(request.getParameter("mk_seq")));

            log.info("mk_seq : " + mk_seq);

            MarketDTO mDTO = new MarketDTO();

            mDTO.setMk_seq(mk_seq);

            MarketDTO rDTO = marketService.getMarketInfo(mDTO);

            if (rDTO == null) {
                rDTO = new MarketDTO();

            }

            // 조회된 리스트 결과값 넣어주기
            model.addAttribute("rDTO", rDTO);

        } catch (Exception e) {
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".market modify end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        log.info(this.getClass().getName() + ".market modify end!");

        return "/market/market-modify";
    }


    // 마켓 수정하기
    @RequestMapping(value = "marketUpdate", method = {RequestMethod.GET,RequestMethod.POST})
    public String updateMarketInfo(HttpSession session, HttpServletRequest request, ModelMap model) {
        log.info(this.getClass().getName() + ".updateMarketInfo Start!!");

        String msg = "";

        try {
            String user_name = CmmUtil.nvl((String) session.getAttribute("SESSION_USER_NAME"));
            int mk_seq = Integer.parseInt(CmmUtil.nvl(request.getParameter("mk_seq")));
            String title = CmmUtil.nvl(request.getParameter("title"));
            /*String price = CmmUtil.nvl(request.getParameter("price"));*/
            int price = Integer.parseInt(CmmUtil.nvl(request.getParameter("price")));
            String contents = CmmUtil.nvl(request.getParameter("contents"));

            log.info("user_name : " + user_name);
            log.info("mk_seq : " + mk_seq);
            log.info("title : " + title);
            log.info("price : " + price);
            log.info("contents : " + contents);

            /*String test1 = contents.split("<img alt=\"\" src=\"")[1];

            String imgThum = test1.split("\"")[0];

            log.info("imgThum : "+imgThum);*/

            MarketDTO mDTO = new MarketDTO();

/*
            if(imgThum != null) {
                mDTO.setThumbnail(imgThum);
            } else {
                mDTO.setThumbnail(" ");
            }
*/


            mDTO.setUser_seq(mDTO.getUser_seq());
            mDTO.setMk_seq(mk_seq);
            mDTO.setTitle(title);
            mDTO.setPrice(price);
            mDTO.setContents(contents);

            // 마켓 수정하기 DB
            marketService.updateMarketInfo(mDTO);

            msg = "수정되었습니다.";

        } catch (Exception e) {

            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".MarketUpdate end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        return "/market/market-MsgToList";
    }

    // 마켓 삭제
    @GetMapping(value = "deleteMarketInfo")
    private String deleteMarketInfo(HttpServletRequest request, ModelMap model) {
        log.info(this.getClass().getName() + ".deleteMarketInfo start!");

        String msg = "";

        try {
            String mk_seq = CmmUtil.nvl(request.getParameter("mk_seq"));

            log.info("mk_seq : " + mk_seq);

            MarketDTO mDTO = new MarketDTO();

            mDTO.setMk_seq(Integer.parseInt(mk_seq));

            // 마켓 삭제하기 DB
            marketService.deleteMarketInfo(mDTO);

            msg = "삭제되었습니다.";

        } catch (Exception e) {
            msg = "삭제하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".MarketDelete end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        return "/market/market-MsgToList";
    }
    @GetMapping(value = "admin-market")
    public String adminmarket(ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".admin-market Start!!");

        // 마켓리스트 가져오기
        List<MarketDTO> mList = marketService.getMarketList();
        UserInfoDTO uDTO = new UserInfoDTO();


        if (mList == null) {
            mList = new ArrayList<>();
        }


        // 조회된 리스트 결과값 넣어주기
        model.addAttribute("mList", mList);

        model.addAttribute("uDTO",uDTO);

        log.info(this.getClass().getName() + ".admin-market End!!");

        return "/admin/admin-market";
    }

    // 이미지 업로드
    @RequestMapping(value="/image/upload", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
                            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try{
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = "C:\\czero3\\src\\main\\webapp\\WEB-INF\\image" + "upload/";	// 이미지 경로 설정(폴더 자동 생성)
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/market/market-upload?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
            printWriter.flush();

        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }
        return;
    }

    // 서버로 전송된 이미지 뿌려주기
    @RequestMapping(value="/market/market-upload")
    public void ckSubmit(@RequestParam(value="uid") String uid
            , @RequestParam(value="fileName") String fileName
            , HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        //서버에 저장된 이미지 경로
        String path = "C:\\czero3\\src\\main\\webapp\\WEB-INF\\image" + "upload/";	// 저장된 이미지 경로
        System.out.println("path:"+path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            }catch(IOException e){
                e.printStackTrace();
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }
}
