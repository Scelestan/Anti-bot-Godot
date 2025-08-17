var repopIA;
var tour = true;
var score = 0;
    var ident;
	var ass;
    var tableau = [["0","0","0"],["0","0","0"],["0","0","0"]]; 
	var ik = "";
	 for (var i=0;i<tableau.length;i++) {

for (var k = 0; k < tableau[i].length; k++) {
ik += "A";
      document.getElementById('ttt').innerHTML += " <button class='case' id= " + ik + " onclick='go(this, " + i.toString() + ", " + k.toString() + " )' style='background-color:#a22e34'> </button>"
    }

};
var doubl = [0,0];
		function IA() {


var cul = false;
var verif = "";
var verifligne = "";
doubl = [call(2),call(2)];
var test = 0;


for (var B = 0; B < tableau.length; B ++) {

if (tableau[B][1] == tableau[B][0] && tableau[B][0] != "0" && tableau[B][1] != "0") {
doubl[0] = B;
doubl[1] = 2;
test = (((Math.abs((doubl[0]-tableau[doubl[1]].length)-(doubl[1]+tableau.length-1)))));
verif = tableau[B][1] + tableau[B][0];
cul = true;
B = tableau.length;
} else if (tableau[B][2] == tableau[B][1] && tableau[B][1] != "0" && tableau[B][2] != "0") {
doubl[0] = B;
doubl[1] = 0;
test = (((Math.abs((doubl[0]-tableau[doubl[1]].length)-(doubl[1]+tableau.length-1)))));
verif = tableau[B][2] + tableau[B][1];
cul = true;
B = tableau.length;
} else if (tableau[B][2] == tableau[B][0] && tableau[B][0] != "0" && tableau[B][2] != "0") {
doubl[0] = B;
doubl[1] = 1;
test = (((Math.abs((doubl[0]-tableau[doubl[1]].length)-(doubl[1]+tableau.length-1)))));
verif = tableau[B][2] + tableau[B][0];
cul = true;
B = tableau.length;
}



if (tableau.length-1 == B && cul == false) {

for (var A = 0; A < tableau[B].length; A ++) {
var theb = "";
var theb2 = "";
if (tableau[A][A] == ("X" || "O")) {
verif += tableau[A][A];
theb += "A";
}
if (tableau[B-A][A] == ("X" || "O")) {
verif += tableau[B-A][A];
theb2 += "A";
}
if (tableau[B].length-1 == A) {

if (theb == "AA") {
doubl[0] = A;
doubl[1] = A;
test = (((Math.abs((doubl[0]-tableau[doubl[1]].length)-(doubl[1]+tableau.length-1)))));
cul = true;
} else if (theb2 == "AA") {
doubl[0] = B-A;
doubl[1] = A;
test = (((Math.abs((doubl[0]-tableau[doubl[1]].length)-(doubl[1]+tableau.length-1)))));
cul = true;
}


}

}




}     

var justif = true;
   if ((verif != "XX" && verif != "OO") && cul == false && tour == false) {

justif = false;

ass = 0;

for (var D = 0; D < tableau.length; D ++) {
var zero = "0";
for (zero in tableau[D]) {
ass += 1;
}


}


var prat = 0;

var BLA = call(ass);
console.log(BLA.toString());

	var jil = -1;
for (var D = 0; D < tableau.length; D ++) {
var zero = "0";
prat += 1;

for (var D2 = 0; D2 < tableau[(D)].length; D2 ++) {
if (tableau[D][D2] == zero) {

jil += 1;

if (jil == BLA) {
	var T = D;
	var U = D2;
		
	
doubl[0] = T;
doubl[1] = U;
console.log(Math.abs((doubl[0]-tableau[doubl[1]].length)-(doubl[1]+tableau.length-1)));
verif = "OO";
cul = false;
tour = false;
justif = false;
	}
}
}
}





} else if (tour == false && verif == "XX" && cul){

	
justif = true;


ass = 0;

for (var D = 0; D < tableau.length; D ++) {
var zero = "0";
for (zero in tableau[D]) {
ass += 1;
}


}

	tableau[doubl[0]][doubl[1]] = 'X';
ident = "";
for ( var cas = 0; cas <= (((Math.abs((doubl[0]-tableau[doubl[1]].length)-(doubl[1]+tableau.length-1))))); cas ++) {
	ident += "A";
}

	document.getElementById(ident).innerHTML = tableau[doubl[0]][doubl[1]];
        document.getElementById(ident).style.background=('lightblue');


}
if ((verif == "OO") || justif == false) {

if (verif == "OO") {
	
	
	tableau[doubl[0]][doubl[1]] = 'X';
ident = "";
for ( var cas = 0; cas <= (((Math.abs((doubl[0]-tableau[doubl[1]].length)-(doubl[1]+tableau.length-1))))); cas ++) {
	ident += "A";
}

	document.getElementById(ident).innerHTML = tableau[doubl[0]][doubl[1]];
        document.getElementById(ident).style.background=('lightblue');
	
	ident = "";
	var trustrg = "";
var trustinverse = "";
for (var B = 0; B < tableau[tableau.length-1].length; B ++) {

	
if (tableau[B][0] == tableau[B][1] && tableau[B][0] != "0" && tableau[B][1] != "0") {
alert("game end by ligneon IA");
score -= 1;
repop();
B = tableau.length;
} else if (tableau[B][1] == tableau[B][2] && tableau[B][1] != "0" && tableau[B][2] != "0") {
alert("game end by lignetw iA");
score -= 2;
repop();
B = tableau.length;
} else if (tableau[B][0] == tableau[B][2] && tableau[B][0] != "0" && tableau[B][2] != "0") {
alert("game end by lignetr Ia");
score -= 3;
repop();
B = tableau.length;
}


if (tableau.length-1 == B) {

for (var A = 0; A < tableau.length; A ++) {

trustrg += tableau[A][A];
trustinverse += tableau[B-A][A];

if ((tableau[0][A] == tableau[1][A] && tableau[1][A] == tableau[2][A] && tableau[0][A] == tableau[2][A]) && tableau[0][A] != "0" && tableau[1][A] != "0" && tableau[2][A] != "0") {
alert("game end by colonne ia");
score -= 5;
repop();
B = tableau.length;
}
}

if (trustrg == "OOO" || trustrg == "XXX") {
alert("game end by DIAGONE IA");
score -= 10;
repop();
B = tableau.length;
}
if (trustinverse == "OOO" || trustinverse == "XXX") {
alert("game end by DIAGOTWO IA");
score -= 15;
repop();
B = tableau.length;
}
}

}
clearInterval(repopIA);
          tour = true;

} else {


tableau[doubl[0]][doubl[1]] = 'X';
ident = "";

for ( var cas = 0; cas <= ((Math.abs((doubl[0]-tableau[doubl[1]].length)-(doubl[1]+tableau.length-1)))); cas ++) {
	ident += "A";
}

	document.getElementById(ident).innerHTML = tableau[doubl[0]][doubl[1]];
        document.getElementById(ident).style.background=('lightblue');
clearInterval(repopIA);
			tour = true;

}
//verif = "";
}


      }
	  
}
 // end ia
   function go(au,i,k){
   var stringO = true;   
	var trustrg = "";
var trustinverse = "";
if(tableau[i][k] != "0") {
stringO = false;
}
 
      if(stringO == true){


        if (tour){
        tableau[i][k] = 'O';
              au.innerHTML = tableau[i][k];
          au.style.background=('lightcoral')
    
          tour = false;

      }

	}

for (var B = 0; B < tableau[tableau.length-1].length; B ++) {

	
if ((tableau[B][0] == tableau[B][1] && tableau[B][1] == tableau[B][2] && tableau[B][0] == tableau[B][2]) && tableau[B][0] != "0" && tableau[B][1] != "0" && tableau[B][2] != "0") {
alert("game end by ligne");
score += 2;
repop();
B = tableau.length;
}


if (tableau.length-1 == B) {

for (var A = 0; A < tableau.length; A ++) {

trustrg += tableau[A][A];
trustinverse += tableau[B-A][A];

if ((tableau[0][A] == tableau[1][A] && tableau[1][A] == tableau[2][A] && tableau[0][A] == tableau[2][A]) && tableau[0][A] != "0" && tableau[1][A] != "0" && tableau[2][A] != "0") {
alert("game end by colonne");
score += 4;
repop();
B = tableau.length;
}
}

if (trustrg == "OOO" || trustrg == "XXX") {
alert("game end by DIAGONE");
score += 7;
repop();
B = tableau.length;
}
if (trustinverse == "OOO" || trustinverse == "XXX") {
alert("game end by DIAGOTWO");
score += 10;
repop();
B = tableau.length;
}
repopIA = setInterval(1000, IA());

}     
}
	}
    
function repop () {

score -= 1;

document.getElementById('score').innerHTML = score.toString() + "++";

	ik = "";
document.getElementById('ttt').innerHTML = "";
for (var i=0;i<tableau.length;i++) {

for (var k = 0; k < tableau[i].length; k++) {
tableau[i][k] = "0";
      ik += "A";
      document.getElementById('ttt').innerHTML += " <button class='case' id=" + ik + " onclick='go(this, " + i.toString() + ", " + k.toString() + " )' style='background-color:#a22e34'> </button>"
    }

};

if (tour == false) {

doubl[0] = call(2);
doubl[1] = call(2);

	tableau[doubl[0]][doubl[1]] = 'X';
	ident = "";
	ass = 0;
for ( var cas = 0; cas <= ((Math.abs((doubl[0]-tableau[doubl[1]].length)-(doubl[1]+tableau.length-1)))); cas ++) {
	ident += "A";
}
	document.getElementById(ident).innerHTML = tableau[doubl[0]][doubl[1]];
        document.getElementById(ident).style.background=('lightblue');
		tour = true;
}
}
function call (testage) {
		
		var GG = (Math.trunc(Math.random()*(testage + 0.4)))
		
	return GG;
	
	}