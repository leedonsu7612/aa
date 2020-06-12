package com.hyundai.cmmn.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;

import com.hyundai.cmmn.service.EgovFileMngService;
import com.hyundai.cmmn.service.FileVO;

/**
 * 파일 조회, 삭제, 다운로드 처리를 위한 컨트롤러 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.25  이삼섭          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */
@Controller
public class EgovFileMngController {

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;

    //Logger log = Logger.getLogger(this.getClass());

    /**
     * 첨부파일에 대한 목록을 조회한다.
     *
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/selectFileInfs.do")
    public String selectFileInfs(@ModelAttribute("searchVO") FileVO fileVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {
		String atchFileId = (String)commandMap.get("param_atchFileId");
		String iconOnly = (String) commandMap.get("iconOnly");
		if (iconOnly == null)
			iconOnly = "N";
	
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileService.selectFileInfs(fileVO);
	
		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", "N");
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);
		model.addAttribute("iconOnly", iconOnly);
	
		return "cmmn/EgovFileList";
    }

    /**
     * 첨부파일 변경을 위한 수정페이지로 이동한다.
     *
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/selectFileInfsForUpdate.do")
    public String selectFileInfsForUpdate(@ModelAttribute("searchVO") FileVO fileVO, @RequestParam Map<String, Object> commandMap,
	    ModelMap model) throws Exception {

		String atchFileId = (String)commandMap.get("param_atchFileId");
		String returnUrl = (String) commandMap.get("returnUrl");
		String iconOnly = (String) commandMap.get("iconOnly");
		if (iconOnly == null)
			iconOnly = "N";
	
		fileVO.setAtchFileId(atchFileId);
	
		List<FileVO> result = fileService.selectFileInfs(fileVO);
	
		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", "Y");
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);
		model.addAttribute("iconOnly", iconOnly);
		model.addAttribute("returnUrl", returnUrl);
	
		return "cmmn/EgovFileList";
    }

    /**
     * 첨부파일에 대한 삭제를 처리한다.
     *
     * @param fileVO
     * @param returnUrl
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/fms/deleteFileInfs.do", method = RequestMethod.POST)
	@ResponseBody
    public String deleteFileInf(@ModelAttribute("searchVO") FileVO fileVO) throws Exception {

		Boolean isAuthenticated = (RequestContextHolder.getRequestAttributes() != null);
	
		if (isAuthenticated) {
		    fileService.deleteFileInf(fileVO);
		}
	
		//--------------------------------------------
		// contextRoot가 있는 경우 제외 시켜야 함
		//--------------------------------------------
		////return "forward:/cmm/fms/selectFileInfs.do";
		//return "forward:" + returnUrl;
	
		/*if ("".equals(request.getContextPath()) || "/".equals(request.getContextPath())) {
		    return "forward:" + returnUrl;
		}
	
		if (returnUrl.startsWith(request.getContextPath())) {
		    return "forward:" + returnUrl.substring(returnUrl.indexOf("/", 1));
		} else {
		    return "forward:" + returnUrl;
		}*/
		return "Success";
		////------------------------------------------
    }

    /**
     * 이미지 첨부파일에 대한 목록을 조회한다.
     *
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/selectImageFileInfs.do")
    public String selectImageFileInfs(@ModelAttribute("searchVO") FileVO fileVO, @RequestParam Map<String, Object> commandMap,
	    ModelMap model) throws Exception {

		String atchFileId = (String)commandMap.get("atchFileId");
	
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileService.selectImageFileList(fileVO);
	
		model.addAttribute("fileList", result);
	
		return "cmmn/EgovImgFileList";
    }
}
