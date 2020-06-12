package com.hyundai.cmmn.view;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.hyundai.cmmn.view.ExcelHeaderVO;
import com.hyundai.cmmn.view.ExcelVO;
import com.hyundai.cmmn.view.StaticUtil;

@SuppressWarnings("deprecation")
public class ExcelDownloadView extends AbstractExcelView {

	protected final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook tempWorkbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		OutputStream out = null;
		HSSFWorkbook workbook = new HSSFWorkbook();
		ArrayList<HashMap> excelList = (ArrayList)model.get("excelList");

		String destFileName = (String)model.get("excelTitle") + getTimeStamp() + ".xls";
		setDisposition(destFileName, request, response);

		if(excelList != null && excelList.size() > 0){
			for(HashMap excelMap : excelList ){
				HSSFSheet sheet =  makeSheet(workbook,excelMap);
			}
		}else{
			String excelTitle = (String)model.get("excelTitle");  //타이틀 설정
			ArrayList excelInfoList = (ArrayList)model.get("excelInfoList"); //테이블 속성정보
			ArrayList excelSearchInfoList = (ArrayList)model.get("excelSearchInfoList"); //테이블 조회조건 리스트
			ArrayList<ExcelHeaderVO> excelHeaderInfoList = (ArrayList<ExcelHeaderVO>)model.get("excelHeaderInfoList"); //테이블 조회조건 리스트
			ArrayList excelDataList = (ArrayList)model.get("excelDataList"); //테이블 데이터 리스트
			HashMap excelMap = new HashMap();
			excelMap.put("excelTitle", excelTitle);
			excelMap.put("excelInfoList", excelInfoList);
			excelMap.put("excelSearchInfoList", excelSearchInfoList);
			excelMap.put("excelHeaderInfoList", excelHeaderInfoList);
			excelMap.put("excelDataList", excelDataList);
			HSSFSheet sheet =  makeSheet(workbook,excelMap);
		}

		try {
			out = response.getOutputStream();
			workbook.write(out);
		} catch (IOException e) {
			LOG.error("buildExcelDocument : " +  e.getCause() + " [IOException]");
		} finally {
			if(out != null) try {out.close();} catch(IOException e){LOG.error("ignore");}
		}
	}

    public String getTimeStamp() {

		String rtnStr = null;
	
		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		String pattern = "yyyyMMddhhmmssSSS";
	
		try {
		    SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		    Timestamp ts = new Timestamp(System.currentTimeMillis());
	
		    rtnStr = sdfCurrent.format(ts.getTime());
		} catch (Exception e) {
		    //e.printStackTrace();
		    throw new RuntimeException(e);	// 2011.10.10 보안점검 후속조치
		}
	
		return rtnStr;
    }

    public HSSFSheet makeSheet(HSSFWorkbook workbook, HashMap excelMap) throws Exception{
		int index = 0;	//row count
		String excelTitle = (String)excelMap.get("excelTitle");  //타이틀 설정
		ArrayList excelInfoList = (ArrayList)excelMap.get("excelInfoList"); //테이블 속성정보
		ArrayList excelSearchInfoList = (ArrayList)excelMap.get("excelSearchInfoList"); //테이블 조회조건 리스트
		ArrayList<ExcelHeaderVO> excelHeaderInfoList = (ArrayList<ExcelHeaderVO>)excelMap.get("excelHeaderInfoList"); //테이블 조회조건 리스트
		ArrayList excelDataList = (ArrayList)excelMap.get("excelDataList"); //테이블 데이터 리스트

		int excelInfoSize = excelInfoList.size();

		HSSFSheet sheet = workbook.createSheet(excelTitle);

		/**********************************
		 * Cell 스타일 지정
		 **********************************/
		HSSFCellStyle titleStyle = workbook.createCellStyle();      //타이틀 스타일
		HSSFCellStyle titleStyle2 = workbook.createCellStyle();     //타이틀2 스타일
		HSSFCellStyle headerStyle = workbook.createCellStyle();     //헤더 스타일
		HSSFCellStyle data = workbook.createCellStyle();       //데이터 스타일(left)
		HSSFCellStyle dataRight = workbook.createCellStyle();  //데이터 스타일(right)
		HSSFCellStyle dataCenter = workbook.createCellStyle(); //테이터 스타일(center)

		/**********************************
		 * Cell 정렬기준 설정
		 **********************************/
		titleStyle.setAlignment (titleStyle.ALIGN_CENTER);
		headerStyle.setAlignment (headerStyle.ALIGN_CENTER);
		data.setAlignment (data.ALIGN_LEFT);
		dataRight.setAlignment (dataRight.ALIGN_RIGHT);
		dataCenter.setAlignment (dataCenter.ALIGN_CENTER);

		titleStyle.setVerticalAlignment(titleStyle.VERTICAL_CENTER);
		titleStyle2.setVerticalAlignment(titleStyle.VERTICAL_CENTER);
		headerStyle.setVerticalAlignment(headerStyle.VERTICAL_CENTER);
		data.setVerticalAlignment(data.VERTICAL_CENTER);
		dataRight.setVerticalAlignment(dataRight.VERTICAL_CENTER);
		dataCenter.setVerticalAlignment(dataCenter.VERTICAL_CENTER);

		/**********************************
		 * Cell 테두리 선긋기
		 **********************************/
		headerStyle.setBorderTop(headerStyle.BORDER_THIN);
		headerStyle.setBorderBottom(headerStyle.BORDER_THIN);
		headerStyle.setBorderLeft(headerStyle.BORDER_THIN);
		headerStyle.setBorderRight(headerStyle.BORDER_THIN);

		data.setBorderBottom(data.BORDER_THIN);
		data.setBorderLeft(data.BORDER_THIN);
		data.setBorderRight(data.BORDER_THIN);
		data.setBorderTop(data.BORDER_THIN);

		dataRight.setBorderBottom(data.BORDER_THIN);
		dataRight.setBorderLeft(data.BORDER_THIN);
		dataRight.setBorderRight(data.BORDER_THIN);
		dataRight.setBorderTop(data.BORDER_THIN);

		dataCenter.setBorderBottom(data.BORDER_THIN);
		dataCenter.setBorderLeft(data.BORDER_THIN);
		dataCenter.setBorderRight(data.BORDER_THIN);
		dataCenter.setBorderTop(data.BORDER_THIN);

		/**********************************
		 * Cell 색상설정
		 **********************************/
		headerStyle.setFillBackgroundColor(HSSFColor.WHITE.index);
		headerStyle.setFillForegroundColor(HSSFColor.LEMON_CHIFFON.index);
		headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);

		/**********************************
		 * font 설정
		 **********************************/
		HSSFFont font1 = workbook.createFont();
		font1.setFontHeightInPoints((short)12);
		font1.setFontName("돋음");
		font1.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		titleStyle.setFont(font1);

		HSSFFont font2 = workbook.createFont();
		font2.setFontHeightInPoints((short)9);
		font2.setFontName("돋음");
		font2.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		headerStyle.setFont(font2);

		HSSFFont font3 = workbook.createFont();
		font3.setFontHeightInPoints((short)9);
		font3.setFontName("돋음");
		data.setFont(font3);
		dataRight.setFont(font3);
		dataCenter.setFont(font3);
		titleStyle2.setFont(font3);


		/**********************************
		 * 개행문자 설정
		 **********************************/
		data.setWrapText(true);


		HSSFRow row = null;
		HSSFCell cell = null;
		/**********************************
		 * 타이틀 설정
		 **********************************/
		if(excelTitle != null && !"".equals(excelTitle)) {
			row = sheet.createRow((short)index);
			row.setHeight((short)430);

			//row를 미리 생성하여 테두리 선 스타일 시트 처리
			for(int i = 0; i < excelInfoList.size(); i++){
				cell = row.createCell((short)i);
				cell.setCellStyle (titleStyle);
			}

			cell = row.getCell((short)0);   //0셀 불러오기
			cell.setCellValue(excelTitle);
			cell.setCellStyle(titleStyle);
//			sheet.addMergedRegion(new Region(0,(short)0,0,(short)(excelInfoList.size()-1))); //셀병합
		}

		/**********************************
		 * 조회 조건 그리기
		 **********************************/
		if(null != excelSearchInfoList && 0 < excelSearchInfoList.size()) {
			for(int i = 0; i < excelSearchInfoList.size(); i++) {
				ExcelVO excelVO = (ExcelVO)excelSearchInfoList.get(i);
				index++;
				row = sheet.createRow((short)index);
				row.setHeight((short)360);

				//row를 미리 생성하여 테두리 선 스타일 시트 처리
				for(int j = 0; j < excelInfoList.size(); j++){
					cell = row.createCell((short)j);
					cell.setCellStyle (titleStyle2);
				}

				cell = row.getCell((short)0);   //0셀 불러오기
				cell.setCellValue("▣" + excelVO.getSearchTitle() + " : " + (String)StaticUtil.nullToDefault(excelVO.getSearchValue(),""));
				cell.setCellStyle(titleStyle2);
//				sheet.addMergedRegion(new Region(0,(short)0,0,(short)(excelInfoList.size()-1))); //셀병합
			}
		}

		/**********************************
		 * 테이블 헤더 그리기
		 **********************************/
		index++;
		if(excelHeaderInfoList != null && excelHeaderInfoList.size() > 0){
			int maxRow = 0;
			ArrayList<HSSFRow> rowList = new ArrayList<HSSFRow>();
			//셀그리고 row만들기
			for(ExcelHeaderVO vo :  excelHeaderInfoList){
				//row생성
				int currentRow = vo.getEndY();
				if(maxRow<currentRow){
					for(;maxRow<currentRow;maxRow++){
						rowList.add(sheet.createRow((short)index+maxRow));
					}
				}

				cell = rowList.get(vo.getStartY()-1).createCell((short)vo.getStartX()-1);
				cell.setCellValue(vo.getHeader());
				cell.setCellStyle(headerStyle);
				//나머지 셀들 스타일 먹이기
				for(int y=vo.getStartY();y<=vo.getEndY();y++){
					for(int x=vo.getStartX();x<=vo.getEndX();x++){
						if(y!=vo.getStartY() || x!=vo.getStartX()){
							cell = rowList.get(y-1).createCell(x-1);
							cell.setCellStyle(headerStyle);
						}
					}
				}
			}
			//머징
			for(ExcelHeaderVO vo :  excelHeaderInfoList){
//				sheet.addMergedRegion(new Region(index+vo.getStartY()-1,(short)(vo.getStartX()-1), index+vo.getEndY()-1, (short)(vo.getEndX()-1)));
			}
			index = index + maxRow - 1;
		}else{
			row = sheet.createRow((short)index);
			row.setHeight((short)512);

			//셀에 데이터 추가
			for(int i = 0; i < excelInfoList.size(); i++) {
				ExcelVO excelVO = (ExcelVO)excelInfoList.get(i);
				cell = row.createCell((short)i);
				cell.setCellValue(excelVO.getHeader());
				cell.setCellStyle(headerStyle);

				//sheet.addMergedRegion(new Region(index,(short)i, index+2-1, (short)i)); //셀병합
				//sheet.addMergedRegion(new Region(index,(short)i, index+2-1, (short)i)); //셀병합
			}
		}
		//index = index+1;

		String rowspan = "";
		int rowspanCount = 0;
		HashMap<String, Integer> countMap = new HashMap<String, Integer>();

		int[] colRowCnt = new int[excelInfoList.size()];
		for(int j = 0; j < excelInfoList.size(); j++) {
			colRowCnt[j] = 0;
		}

		HashMap rowspanMap = new HashMap();

		/**********************************
		 * 테이블 데이터 그리기
		 **********************************/
		int dataStartIndex = 0 ;
		if(null != excelDataList && 0 < excelDataList.size()) {
			int maxRowNewlineCnt = 0;
			String tmpDataArray[] = new String[1];
			//데이터의 갯수만큼 반복
			for(int i = 0; i < excelDataList.size(); i++) {
				Object orig = (Object)excelDataList.get(i);

				index++;
				dataStartIndex = index;
				row = sheet.createRow((short)index); //row 추가
				row.setHeight((short)300);

				maxRowNewlineCnt = 1;
				tmpDataArray = new String[1];
				//컬럼의 갯수만큼 반복
				for(int j = 0; j < excelInfoList.size(); j++) {
					ExcelVO excelVO = (ExcelVO)excelInfoList.get(j);
					//Object obj = (Object)map.get(excelVO.getColumn());
					Object obj = BeanUtils.getProperty(orig,excelVO.getColumn());
					if(obj == null) obj = "";
					String value = String.valueOf(obj);
					//value = value.replaceAll("\r\n", " ");
					value = value.replaceAll("\r", "");

					tmpDataArray = value.split("\n");
					if( maxRowNewlineCnt < tmpDataArray.length ){
						maxRowNewlineCnt = tmpDataArray.length;
					}
					/**********************************
					 * Rowspan 설정시작
					 **********************************/
					//Object rowspanObj = (Object)map.get(excelVO.getRowspanColumn());
					if(!excelVO.isRowspan()){
						if(excelVO.getRowspanColumn() != null && !"".equals(excelVO.getRowspanColumn())){
							Object rowspanObj = BeanUtils.getProperty(orig,excelVO.getRowspanColumn());
							if(rowspanObj != null) {
								rowspan = String.valueOf(rowspanObj);
								if(!"".equals(rowspan)) {
									rowspanCount = Integer.parseInt(rowspan);
								}

								if(colRowCnt[j] == 0) {
//									sheet.addMergedRegion(new Region(index,(short)j, index+rowspanCount-1, (short)j)); //셀병합
								}

								colRowCnt[j]++;

								if(colRowCnt[j] == rowspanCount) {
									colRowCnt[j] = 0;
								}
							}
						}
					}else{
						if(excelVO.getRowspanColumn() != null && !"".equals(excelVO.getRowspanColumn())){
							//로우스팬컬럼이 이전컬럼과 같을경우 카운팅을 + 한다.아니면 카운팅을 0로 하고 , 이전 로우스팬컬럼의 인덱스부터 카운팅 만큼 셀병합한다.
							//로우스팬컬럼의 값을 가져온다.
							String col = excelVO.getRowspanColumn();
							Object rowspanColumn = BeanUtils.getProperty(orig,col);
							if(rowspanColumn == null) rowspanColumn = "";
							String rowspanValue = String.valueOf(rowspanColumn);

							//이전Row와 로우스팬컬럼에 해당하는 값이 같은가?
							//이전컬럼에 해당하는 map가져오기
							HashMap map = (HashMap)rowspanMap.get(excelVO.getColumn());

							if(map == null){
								//최초일 경우의 초기화
								map = new HashMap();
							}
							//이전컬럼의 기준값
							String prevValue = (String)map.get("prevValue");
							//이전컬럼의 기준값
							Integer prevIndex = (Integer)map.get("prevIndex");
							if(prevIndex==null){
								prevIndex = index;
							}
							//이전컬럼의 반복횟수
							Integer colCnt = (Integer)map.get("colCnt");
							if(colCnt==null){
								colCnt = 0;
							}

							if(rowspanValue.equals(prevValue)){
								//카운팅 +
								colCnt++;
								map.put("colCnt",colCnt);
							}else{
								//최초이거나 기존과 다를경우 온다.
								if(colCnt>0){
									//셀병합
//									sheet.addMergedRegion(new Region(prevIndex,(short)j, prevIndex+colCnt, (short)j)); //셀병합
								}else{
									//이전로우에 대한 셀병합이 필요없다.
								}
								//카운팅0
								map.put("colCnt",0);
								//현재기준값입력
								map.put("prevValue",rowspanValue);
								//최초의 index값 저장
								map.put("prevIndex",index);
								//마지막을 위한 저장
								map.put("colIndex",j);
							}

							//마지막 row일 경우 셀머징을 한다.
							if(i == excelDataList.size()-1){
								colCnt = (Integer)map.get("colCnt");
								prevIndex = (Integer)map.get("prevIndex");
								if(colCnt>0){
//									sheet.addMergedRegion(new Region(prevIndex,(short)j, prevIndex+colCnt, (short)j)); //셀병합
								}
							}
							rowspanMap.put(excelVO.getColumn(),map);
						}
					}
					/**********************************
					 * Rowspan 설정 끝
					 **********************************/

					cell = row.createCell((short)j);
					cell.setCellValue(value);
					cell.setCellType( HSSFCell.CELL_TYPE_STRING );

					if("right".equalsIgnoreCase(excelVO.getAlign())) {
						cell.setCellStyle(dataRight);
					} else if("center".equalsIgnoreCase(excelVO.getAlign())) {
						cell.setCellStyle(dataCenter);
					} else {
						cell.setCellStyle(data);
					}
				}

				row.setHeight((short)(300 * maxRowNewlineCnt) );

			}
		}

		/**********************************
		 * Cell 너비설정
		 **********************************/
		for(int i = 0; i < excelInfoList.size(); i++) {
			ExcelVO excelVO = (ExcelVO)excelInfoList.get(i);

			if(0 != excelVO.getWidth()) {
				sheet.setColumnWidth((short) i, (short) excelVO.getWidth());
			} else {
				sheet.autoSizeColumn(i);
				sheet.setColumnWidth((short)i, (short)((sheet.getColumnWidth(i)) + 512) );
				if(sheet.getColumnWidth(i) > 10000) sheet.setColumnWidth(i, 10000);
			}
		}
		return null;
	}

	/**
     * 브라우저 구분 얻기.
     *
     * @param request
     * @return
     */
	public String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        } else if (header.indexOf("Trident") > -1) {	// IE11 문자열 깨짐 방지
        	return "Trident";
        }
        return "Firefox";
    }

	/**
     * Disposition 지정하기.
     *
     * @param filename
     * @param request
     * @param response
     * @throws Exception
     */
	public void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);

		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;

		if (browser.equals("MSIE")) {
		    encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
		    encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
		    encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
		    StringBuffer sb = new StringBuffer();
		    for (int i = 0; i < filename.length(); i++) {
			char c = filename.charAt(i);
			if (c > '~') {
			    sb.append(URLEncoder.encode("" + c, "UTF-8"));
			} else {
			    sb.append(c);
			}
		    }
		    encodedFilename = sb.toString();
		} else if (browser.equals("Trident")) {		// IE11 문자열 깨짐 방지
	    	encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else {
		    //throw new RuntimeException("Not supported browser");
		    throw new IOException("Not supported browser");
		}

		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

		if ("Opera".equals(browser)){
		    response.setContentType("application/octet-stream;charset=UTF-8");
		}
    }
}

