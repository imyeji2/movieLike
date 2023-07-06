/**
 * 
 */
let horizontalBar = document.getElementById("horizontal-underline");
let horizontalMenus = document.getElementById("myPageMenu").querySelectorAll("a");

function horizontalIndicator(e) {
  horizontalBar.style.left = e.offsetLeft + "px";
  horizontalBar.style.width = e.offsetWidth + "px";
  horizontalBar.style.top = e.offsetTop + e.offsetHeight + "px";
  horizontalBar.style.visibility = "visible";
}
  horizontalBar.style.visibility = "hidden";
horizontalMenus.forEach((menu) =>
  menu.addEventListener("click", (e) =>
    horizontalIndicator(e.currentTarget)
  )
);
function showContent(num){
	var tag = document.getElementsByClassName("content");
	for(var i = 0; i < tag.length; i++){
		if(i == num){
		tag[num].style.display = "block";
		}else{
			tag[i].style.display = "none";
		}
	}
}
function pageup(num){
	num++;
}
function pagedown(num){
	num--;
}
