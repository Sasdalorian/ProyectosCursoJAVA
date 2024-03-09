let userName = document.getElementById("userName");

// Elementos HTML
let notasHtml = document.getElementById("ingresoHtml");
let nota1Html = document.getElementById("nota1Html");
let nota2Html = document.getElementById("nota2Html");
let nota3Html = document.getElementById("nota3Html");
let promedioHtml = document.getElementById("promedioHtml");

// Elementos CSS
let notasCss = document.getElementById("ingresoCss");
let nota1Css = document.getElementById("nota1Css");
let nota2Css= document.getElementById("nota2Css");
let nota3Css = document.getElementById("nota3Css");
let promedioCss = document.getElementById("promedioCss");

// Elementos JS
let notasJs = document.getElementById("ingresoJs");
let nota1Js = document.getElementById("nota1Js");
let nota2Js= document.getElementById("nota2Js");
let nota3Js = document.getElementById("nota3Js");
let promedioJs = document.getElementById("promedioJs");

/* INGRESO DE NOMBRE */
let newName = prompt("Por favor, ingrese su nombre");
if (newName !== null && newName !== "") {
  userName.textContent = newName;
}

/* CALCULO DE PROMEDIO */
function promedio(nota1, nota2, nota3) {
  let suma = parseFloat(nota1) + parseFloat(nota2) + parseFloat(nota3);
  let promedio = suma / 3;

  if (isNaN(promedio) ){
    alert("Ingresar números validos");
  } else if(promedio % 1 !== 0) {
    return promedio.toFixed(2);
  } else {
    return promedio;
  }
}


/* INGRESO DE NOTAS HTML */
notasHtml.addEventListener("click", function() {
  var nota1 = prompt("Ingrese nota 1. (Sólo números)");
  var nota2 = prompt("Ingrese nota 2. (Sólo números)");
  var nota3 = prompt("Ingrese nota 3. (Sólo números)");

  if (!isNaN(nota1) && nota1 !== "" && !isNaN(nota2) && nota2 !== "" && !isNaN(nota3) && nota3 !== "") {
    nota1Html.textContent = nota1;
    nota2Html.textContent = nota2;
    nota3Html.textContent = nota3;

    let Rpromedio = promedio(nota1, nota2, nota3);
    promedioHtml.textContent = Rpromedio;
  } else {
    alert("Ingresar números validos")
  }
})

/* INGRESO DE NOTAS CSS */
notasCss.addEventListener("click", function() {
  var nota1 = prompt("Ingrese nota 1. (Sólo números)");
  var nota2 = prompt("Ingrese nota 2. (Sólo números)");
  var nota3 = prompt("Ingrese nota 3. (Sólo números)");

  if (!isNaN(nota1) && nota1 !== "" && !isNaN(nota2) && nota2 !== "" && !isNaN(nota3) && nota3 !== "") {
    nota1Css.textContent = nota1;
    nota2Css.textContent = nota2;
    nota3Css.textContent = nota3;

    let Rpromedio = promedio(nota1, nota2, nota3);
    promedioCss.textContent = Rpromedio;
  } else {
    alert("Ingresar números validos")
  }
})

/* INGRESO DE NOTAS JS */
notasJs.addEventListener("click", function() {
  var nota1 = prompt("Ingrese nota 1. (Sólo números)");
  var nota2 = prompt("Ingrese nota 2. (Sólo números)");
  var nota3 = prompt("Ingrese nota 3. (Sólo números)");

  if (!isNaN(nota1) && nota1 !== "" && !isNaN(nota2) && nota2 !== "" && !isNaN(nota3) && nota3 !== "") {
    nota1Js.textContent = nota1;
    nota2Js.textContent = nota2;
    nota3Js.textContent = nota3;

    let Rpromedio = promedio(nota1, nota2, nota3);
    promedioJs.textContent = Rpromedio;
  } else {
    alert("Ingresar números validos")
  }
})
