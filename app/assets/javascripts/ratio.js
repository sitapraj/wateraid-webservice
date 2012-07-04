function divideFirstRatio(ratio) {
  var firstRatio = "";
  for(var i=0; i<ratio.length; i++) {
      firstRatio = ratio[0];
  }
  return firstRatio;    
}

function divideSecondRatio(ratio) { 	  
	  var aRatio = [];
	  var tempRatio = "";
	  var secondRatio = "";
	  for(var j=2; j<ratio.length; j++) {
	      aRatio[j] = ratio[j];    
	  }
	  tempRatio = aRatio.toString();
	  secondRatio = tempRatio.replace(/\,/g,"");
	  return secondRatio;
}
