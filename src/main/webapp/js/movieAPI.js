/**
 * 
 */


function serchMovieApi(){
	var serch=$('#serch_txt').val();
	var url ="http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=62f477ad2df43d65d7d1becce91a4754&movieNm="+serch;
    $.getJSON(url, function(data) {
         var movieList = data.movieListResult.movieList;
         if(movieList.length<1){
			$('tbody').append("<tr><td colspan='4' class='text-truncate'>검색 결과가 없습니다.</td>"
	);		 $('.serch_tabel').show();	   
		}else{
           for(var i in movieList){
	
			   for(var j in movieList[i].directors){
				   var directors=movieList[i].directors[j].peopleNm;
				   if(j<1){
					   directors+=", "+movieList[i].directors[j].peopleNm;
				   }
			   }
				$('tbody').append("<tr id='"+movieList[i].movieCd+"'>"+ 
				"<td class='text-truncate'style='max-width: 300px;'>"+movieList[i].movieNm+"</td>"
			    +"<td class='text-truncate' style='max-width: 100px;' >"+directors+"</td>"
			   	+"<td class='text-truncate' style='max-width: 100px;'>"+movieList[i].nationAlt+"</td>"
			    +"<td class='text-truncate' style='max-width: 100px;'>"+movieList[i].openDt+"</td></tr>");
	        }
	        $('.serch_tabel').show();				   
		}
	});		
}

function sendMovieInfo(movieCd){
	var url =" http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=62f477ad2df43d65d7d1becce91a4754&movieCd="+movieCd;
    $.getJSON(url, function(data){
         var movieList = data.movieInfoResult.movieInfo;
         var title = movieList.movieNm;
         var runningTiem = movieList.showTm;
         var openDate = movieList.openDt;
         var ageRate = movieList.watchGradeNm;
         
         
         opener.document.getElementById("movie_tit").value=title;
         opener.document.getElementById("runningTiem").value=runningTiem;
         opener.document.getElementById("openDate").value=openDate;
         opener.document.getElementById("ageRate").value=ageRate;
         self.close();
	});
}
