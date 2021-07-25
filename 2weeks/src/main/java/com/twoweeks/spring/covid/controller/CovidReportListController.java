package com.twoweeks.spring.covid.controller;

import java.io.IOException;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CovidReportListController {

	public static HashMap<String, String> map;
	
	@RequestMapping("/covidUpdate/report.do")
	public String reportList(Model m) {
		//Document : Jsoup���� ���� ��� HTML ��ü ����
		//Element : Document�� HTML���
		//Elements : Element�� ���� �ڷ���, for�� while �� �ݺ��� ��� ����
		//Conection : Jsoup�� Connect Ȥ�� ���� �żҵ���� �̿��� ��������� ��ü, �����ϱ� ���� ������ ��� ����.
		String reportUrl="http://ncov.mohw.go.kr/tcmBoardList.do?brdId=3&brdGubun=";
		Document doc=null;
		
		try {
			doc=Jsoup.connect(reportUrl).get();			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		Elements elem=doc.select("table tbody tr");
		String no=elem.select("td").eq(0).text();
		
		System.out.println("no "+no);
		System.out.println(elem);
		
		m.addAttribute("elem", elem);
		
		return "covidUpdate/reportList";
	}

	
	
}
